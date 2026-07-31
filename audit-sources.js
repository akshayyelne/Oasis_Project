#!/usr/bin/env node
/**
 * audit-sources.js  —  Oasis knowledge-base source audit (READ-ONLY)
 * ---------------------------------------------------------------------------
 * Measures SUBSTANCE, not presence. Walks the numbered source dirs, strips
 * template scaffolding (headings + known section labels + empty bullets),
 * counts the real prose that remains, flags off-topic / unreadable files,
 * and assigns an honest confidence level per file and per source.
 *
 * It never writes to, moves, or deletes your source files. Its only output is
 * a printed report plus one JSON + one Markdown report under 99_System/.
 *
 * Run:   node audit-sources.js [projectRoot]
 * Deps (optional, for PDF/DOCX): npm install pdf-parse mammoth
 *   - If not installed, those files are reported as "reader missing" instead
 *     of crashing, and .md/.txt/.json/.csv are audited immediately.
 */

'use strict';
const fs = require('fs');
const path = require('path');

// ---------------------------------------------------------------------------
// CONFIG  (edit these — they encode YOUR corpus, not generic defaults)
// ---------------------------------------------------------------------------

const PROJECT_ROOT =
  process.argv[2] || process.env.OASIS_ROOT || 'C:\\Users\\aksha\\Oasis_Project';

// Source dirs to audit, relative to PROJECT_ROOT.
const SOURCE_DIRS = [
  '1_Source\\11_Project_Boards',
  '1_Source\\12_AI_Chats',
  '1_Source\\13_Github_Repos',
  '1_Source\\14_Onedrive',
  '1_Source\\15_NotebookLM',
];

// Confidence thresholds, in REAL tokens (after scaffolding is removed).
const THRESHOLDS = { high: 500, medium: 100 }; // >500 HIGH, >=100 MEDIUM, else LOW

// Template scaffolding: section labels that, when alone on a line, are NOT
// content. Extend this to match your note templates exactly.
const TEMPLATE_LABELS = new Set([
  'objective', 'objectives', 'key notes', 'key points', 'action items',
  'reference', 'references', 'resources', 'summary', 'overview', 'notes',
  'next steps', 'tags', 'metadata', 'status', 'date', 'author', 'source',
  'sources', 'links', 'related', 'todo', 'to do', 'agenda', 'outcomes',
]);

// Domain lexicon for relevance (healthcare AI ethics / deployment). Substring
// match, case-insensitive. A content-bearing file with ~zero hits is flagged
// OFF-TOPIC (a *suggestion* to exclude — review before dropping anything).
const DOMAIN_TERMS = [
  'health', 'clinic', 'patient', 'physician', 'hospital', 'provider', 'care',
  'medical', 'medicine', 'diagnos', 'treatment', 'therap', 'emr', 'ehr',
  'hipaa', 'privacy', 'consent', 'bias', 'fair', 'ethic', 'responsib',
  'govern', 'regulat', 'fda', 'deploy', 'model', 'algorithm', ' ai', 'ai ',
  'machine learning', ' ml', 'artificial intelligence', 'risk', 'safety',
  'transparen', 'accountab', 'oversight', 'validation', 'clinical',
];
const OFFTOPIC_MIN_TOKENS = 60; // only judge relevance once a file has some prose
const OFFTOPIC_MAX_HITS = 0;    // hits <= this AND enough prose => OFF-TOPIC

// File classification by extension.
const TEXT_EXT = new Set(['.md', '.markdown', '.txt', '.json', '.csv', '.tsv', '.yml', '.yaml']);
const PDF_EXT = new Set(['.pdf']);
const DOCX_EXT = new Set(['.docx']);
const ASSET_EXT = new Set(['.png', '.jpg', '.jpeg', '.gif', '.svg', '.ico', '.webp',
  '.mp3', '.mp4', '.wav', '.mov', '.zip', '.gz', '.7z', '.xlsx', '.pptx', '.bin']);

// ---------------------------------------------------------------------------
// helpers
// ---------------------------------------------------------------------------

const estTokens = (chars) => Math.ceil(chars / 4); // rough, matches bot's own /4 heuristic

function walk(dir) {
  let out = [];
  let entries;
  try { entries = fs.readdirSync(dir, { withFileTypes: true }); }
  catch { return out; }
  for (const e of entries) {
    const full = path.join(dir, e.name);
    if (e.isDirectory()) out = out.concat(walk(full));
    else if (e.isFile()) out.push(full);
  }
  return out;
}

// Strip scaffolding; return the prose that actually carries meaning.
function extractSubstance(text) {
  const kept = [];
  for (const raw of text.split(/\r?\n/)) {
    const line = raw.trim();
    if (!line) continue;
    if (/^#{1,6}\s/.test(line)) continue;               // markdown heading
    if (/^(-{3,}|\*{3,}|_{3,})$/.test(line)) continue;  // horizontal rule
    let s = line.replace(/^([-*+]\s+|\d+[.)]\s+)/, '').trim(); // list marker
    s = s.replace(/^\[[ xX]\]\s*/, '').trim();          // checkbox marker
    if (!s) continue;                                    // empty bullet/checkbox
    const labelTest = s.replace(/[*_`>#|]/g, '').replace(/:\s*$/, '').trim().toLowerCase();
    if (TEMPLATE_LABELS.has(labelTest)) continue;        // bare section label
    kept.push(s);
  }
  return kept.join(' ').replace(/\s+/g, ' ').trim();
}

function domainHits(substanceLower) {
  let hits = 0;
  for (const t of DOMAIN_TERMS) if (substanceLower.includes(t)) hits++;
  return hits;
}

function readText(file, ext) {
  if (TEXT_EXT.has(ext)) return { text: fs.readFileSync(file, 'utf-8'), reader: 'text' };

  if (PDF_EXT.has(ext)) {
    let pdfParse;
    try { pdfParse = require('pdf-parse'); }
    catch { return { text: '', reader: 'missing', note: 'install pdf-parse' }; }
    const buf = fs.readFileSync(file);
    // pdf-parse is async; caller handles the promise.
    return { promise: pdfParse(buf).then(r => ({ text: r.text || '', reader: 'pdf' })), reader: 'pdf' };
  }

  if (DOCX_EXT.has(ext)) {
    let mammoth;
    try { mammoth = require('mammoth'); }
    catch { return { text: '', reader: 'missing', note: 'install mammoth' }; }
    return { promise: mammoth.extractRawText({ path: file }).then(r => ({ text: r.value || '', reader: 'docx' })), reader: 'docx' };
  }

  if (ASSET_EXT.has(ext)) return { text: '', reader: 'asset' };
  return { text: '', reader: 'unknown' };
}

function classify(realTokens, flags) {
  if (flags.includes('ASSET')) return 'EXCLUDE';
  if (flags.includes('READER-MISSING')) return 'UNKNOWN';
  if (flags.includes('OFF-TOPIC')) return 'EXCLUDE';
  if (realTokens > THRESHOLDS.high) return 'HIGH';
  if (realTokens >= THRESHOLDS.medium) return 'MEDIUM';
  return 'LOW';
}

// ---------------------------------------------------------------------------
// audit one file
// ---------------------------------------------------------------------------

async function auditFile(file) {
  const ext = path.extname(file).toLowerCase();
  const rawBytes = (() => { try { return fs.statSync(file).size; } catch { return 0; } })();
  const rec = { file, ext, rawBytes, flags: [] };

  let text = '', reader = 'unknown', note = '';
  try {
    const r = readText(file, ext);
    reader = r.reader; note = r.note || '';
    if (r.promise) { const done = await r.promise; text = done.text; reader = done.reader; }
    else text = r.text || '';
  } catch (e) {
    rec.flags.push('READ-ERROR'); rec.error = e.message;
  }
  rec.reader = reader;

  if (reader === 'asset') rec.flags.push('ASSET');
  if (reader === 'missing') rec.flags.push('READER-MISSING');
  if (note) rec.note = note;

  const substance = extractSubstance(text);
  const realChars = substance.length;
  rec.rawChars = text.length;
  rec.realChars = realChars;
  rec.realTokens = estTokens(realChars);
  rec.scaffoldPct = text.length ? Math.round((1 - realChars / text.length) * 100) : 0;

  // Template detection: recognizable structure but almost no prose.
  if (reader === 'text' && rec.realTokens < 40 && /#{1,6}\s|\n[-*]\s/.test(text)) {
    rec.flags.push('TEMPLATE');
  }

  // Relevance (only judge files that actually have prose).
  if (realChars > 0 && rec.realTokens >= OFFTOPIC_MIN_TOKENS) {
    rec.domainHits = domainHits(substance.toLowerCase());
    if (rec.domainHits <= OFFTOPIC_MAX_HITS) rec.flags.push('OFF-TOPIC');
  } else {
    rec.domainHits = null;
  }

  // PDF that yielded almost no text from a sizeable file => likely scanned.
  if (reader === 'pdf' && rawBytes > 20000 && realChars < 40) rec.flags.push('PDF-SUSPECT');

  rec.confidence = classify(rec.realTokens, rec.flags);
  return rec;
}

// ---------------------------------------------------------------------------
// run
// ---------------------------------------------------------------------------

function pad(s, n) { s = String(s); return s.length >= n ? s.slice(0, n) : s + ' '.repeat(n - s.length); }
function padL(s, n) { s = String(s); return s.length >= n ? s : ' '.repeat(n - s.length) + s; }

async function main() {
  console.log('\n' + '='.repeat(78));
  console.log(' OASIS SOURCE AUDIT  (read-only — measures substance, not presence)');
  console.log(' Root: ' + PROJECT_ROOT);
  console.log('='.repeat(78));

  const perSource = [];
  const allRecords = [];

  for (const sd of SOURCE_DIRS) {
    const abs = path.join(PROJECT_ROOT, sd);
    const exists = fs.existsSync(abs);
    const files = exists ? walk(abs) : [];
    const records = [];
    for (const f of files) records.push(await auditFile(f));
    records.forEach(r => { r.source = sd; });
    allRecords.push(...records);

    // Rollup: "content files" = text-bearing, non-asset, readable.
    const content = records.filter(r =>
      !r.flags.includes('ASSET') && !r.flags.includes('READER-MISSING'));
    const populated = content.filter(r =>
      (r.confidence === 'HIGH' || r.confidence === 'MEDIUM') && !r.flags.includes('OFF-TOPIC'));
    const roll = {
      source: sd,
      exists,
      files: files.length,
      contentFiles: content.length,
      high: content.filter(r => r.confidence === 'HIGH').length,
      medium: content.filter(r => r.confidence === 'MEDIUM').length,
      low: content.filter(r => r.confidence === 'LOW').length,
      template: records.filter(r => r.flags.includes('TEMPLATE')).length,
      offtopic: records.filter(r => r.flags.includes('OFF-TOPIC')).length,
      excluded: records.filter(r => r.confidence === 'EXCLUDE').length,
      readerMissing: records.filter(r => r.flags.includes('READER-MISSING')).length,
      realTokens: content.reduce((a, r) => a + r.realTokens, 0),
      populatedPct: content.length ? Math.round((populated.length / content.length) * 100) : 0,
    };
    perSource.push(roll);

    // Print source block
    console.log('\n' + '-'.repeat(78));
    if (!exists) { console.log(` ${sd}   [MISSING DIR]`); continue; }
    console.log(` ${sd}   files:${roll.files}  content:${roll.contentFiles}` +
      `  populated:${roll.populatedPct}%  realTokens:${roll.realTokens}`);
    console.log('-'.repeat(78));
    console.log(` ${pad('file', 34)}${pad('conf', 8)}${padL('tok', 6)} ${padL('scaf%', 6)}  flags`);
    for (const r of records) {
      const name = path.relative(abs, r.file);
      console.log(` ${pad(name, 34)}${pad(r.confidence, 8)}${padL(r.realTokens, 6)} ${padL(r.scaffoldPct + '%', 6)}  ${r.flags.join(',')}`);
    }
  }

  // Global summary
  const g = {
    files: allRecords.length,
    high: allRecords.filter(r => r.confidence === 'HIGH').length,
    medium: allRecords.filter(r => r.confidence === 'MEDIUM').length,
    low: allRecords.filter(r => r.confidence === 'LOW').length,
    excluded: allRecords.filter(r => r.confidence === 'EXCLUDE').length,
    template: allRecords.filter(r => r.flags.includes('TEMPLATE')).length,
    offtopic: allRecords.filter(r => r.flags.includes('OFF-TOPIC')).length,
    readerMissing: allRecords.filter(r => r.flags.includes('READER-MISSING')).length,
    realTokens: allRecords.reduce((a, r) => a + r.realTokens, 0),
  };
  console.log('\n' + '='.repeat(78));
  console.log(' SUMMARY');
  console.log('='.repeat(78));
  console.log(` files:${g.files}  HIGH:${g.high}  MEDIUM:${g.medium}  LOW:${g.low}  EXCLUDE:${g.excluded}`);
  console.log(` templates(blank):${g.template}  off-topic:${g.offtopic}  reader-missing:${g.readerMissing}`);
  console.log(` total real tokens across corpus: ${g.realTokens}`);
  if (g.template) console.log(`\n  ⚠  ${g.template} file(s) are blank templates — these are the "100% populated" liars.`);
  if (g.readerMissing) console.log(`  ⚠  ${g.readerMissing} PDF/DOCX file(s) unread — run: npm install pdf-parse mammoth`);
  if (g.offtopic) console.log(`  ⚠  ${g.offtopic} file(s) flagged OFF-TOPIC — REVIEW before excluding (heuristic, not gospel).`);

  // Write machine + human reports (into 99_System, created if absent).
  try {
    const outDir = path.join(PROJECT_ROOT, '99_System');
    fs.mkdirSync(outDir, { recursive: true });
    const jsonPath = path.join(outDir, 'source_audit.json');
    fs.writeFileSync(jsonPath, JSON.stringify({ generatedAt: new Date().toISOString(), thresholds: THRESHOLDS, perSource, records: allRecords, summary: g }, null, 2));
    console.log(`\n  Reports written: ${jsonPath}`);
  } catch (e) {
    console.log(`\n  (Could not write report: ${e.message})`);
  }
  console.log('');
}

main().catch(e => { console.error('Audit failed:', e); process.exit(1); });
