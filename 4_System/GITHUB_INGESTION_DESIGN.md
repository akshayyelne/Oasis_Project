# GitHub Cloud Ingestion Pipeline - Design Document

**Date**: 2026-07-22  
**Status**: DESIGN PHASE  
**Reuse**: OneDrive ingestion patterns + new GitHub API layer

---

## 1. Overview & Requirements

### Core Intent
Ingest GitHub repository contents (code, docs, configuration) via GitHub REST/GraphQL APIs without local git cloning. Provide read-only, human-reviewed ingestion for code analysis and architectural pattern discovery.

### Requirements
1. **Cloud-Only Read**: REST API (or GraphQL) to fetch repo structure recursively, no git clone
2. **Uni-Directional & Safe**: Strictly read-only; no auto-commits/pushes ever
3. **Human-in-the-Loop Write Gate**: Any proposed code changes → local staging first → explicit human review → manual approval before GitHub touch
4. **Reuse Existing Patterns**: Leverage OneDrive ingestion architecture where possible

---

## 2. Architecture Overview

```
github_ingest/
├── package.json                    # Dependencies: node-fetch, dotenv, js-yaml, etc.
├── .env.example                    # Template (safe to commit)
├── .gitignore                      # .env, token-cache, output/*.tmp, node_modules/
├── index.js                        # CLI orchestrator (matches cloud_ingest/index.js pattern)
├── src/
│   ├── auth.js                     # GitHub Personal Access Token (PAT) validation & cache
│   ├── github.js                   # REST API client for repo traversal & file fetch
│   ├── parse.js                    # Dispatch parser for code files (.js, .py, .go, .rs, .md, .json, .yaml, etc.)
│   ├── rateLimiter.js              # Reuse from cloud_ingest verbatim
│   ├── fallback.js                 # Local git clone cache or manual repo download
│   └── memoryLog.js                # Reuse from cloud_ingest (audit trail)
├── output/
│   └── latest_github_ingest.md     # Consolidated repo contents
└── README.md                       # Setup + usage + safety notes
```

---

## 3. Reusable Components

### 3.1 Rate Limiter (`src/rateLimiter.js`)
**Status**: Reuse as-is from `cloud_ingest/src/rateLimiter.js`

GitHub API limits:
- REST API: 60 req/min (unauthenticated) → 5000 req/h (authenticated)
- GraphQL: 5000 points/h (query complexity scoring)

Configuration:
- Default: `MAX_REQUESTS_PER_SECOND=10` (conservative; GitHub allows burst)
- Respects `X-RateLimit-Remaining`, `X-RateLimit-Reset` headers
- Backs off on 429, retries up to 3x per request

### 3.2 Memory Logging (`src/memoryLog.js`)
**Status**: Reuse as-is

Logs to `../../../.claude/projects/C--Users-aksha-Oasis-Project/memory/GITHUB_INGESTION_AUDIT.md`:
```
### 2026-07-22 14:03 — GitHub API run
Mode: github-rest | Repos: 2 | Files found: 145 | Parsed: 142 | Skipped: 2 | Failed: 1
Duration: 12.4s | Fallback triggered: no

### 2026-07-22 14:05 — GitHub fallback run
Reason: API rate limit exceeded
Mode: local-cache | Files found: 89 | Parsed: 89
Duration: 2.1s
```

### 3.3 Consolidated Markdown Output
**Status**: Reuse pattern from `cloud_ingest/output/latest_ingestion.md`

**Format**:
```markdown
# GitHub Ingestion Output

**Source**: GitHub API (REST)
**Generated**: 2026-07-22T14:03:00.000Z
**Repositories Processed**: 2
**Files Processed**: 142

## Repository Index

✅ [owner/repo-1] — 87 files parsed
✅ [owner/repo-2] — 55 files parsed

## Full Content

## Repository: owner/repo-1

### File: src/main.js (2.4 KB)

[extracted code content]

---

### File: docs/API.md (1.8 KB)

[extracted markdown content]

---

## Repository: owner/repo-2

[... continues for all repos and files ...]
```

---

## 4. New GitHub-Specific Components

### 4.1 Authentication (`src/auth.js`)

**Flow**:
1. Read `GITHUB_PAT` from `.env` (user provides Personal Access Token)
2. Validate PAT by making authenticated request to `/user` endpoint
3. Cache validation result + PAT metadata (scope, expiry if applicable)
4. Return authenticated headers for downstream requests

**Security**:
- PAT stored only in `.env` (gitignored)
- No token in logs or output
- Supports classic (full scope) and fine-grained tokens (repository-scoped)
- Warn if token has insufficient scopes

```javascript
// Example usage
const { getAuthHeaders } = require('./src/auth');
const headers = getAuthHeaders(); // Returns { Authorization: 'token <PAT>' }
```

### 4.2 GitHub REST API Client (`src/github.js`)

**Endpoints Used**:
- `GET /repos/{owner}/{repo}/git/trees/{sha}?recursive=1` — fetch entire tree recursively
- `GET /repos/{owner}/{repo}/contents/{path}` — fetch individual file content (base64 encoded)
- `GET /user` — validate authentication
- `GET /rate_limit` — check remaining API budget

**Fetch Strategy**:
1. **Get default branch SHA**: `GET /repos/{owner}/{repo}` → `default_branch.commit.sha`
2. **Recursively fetch tree**: `GET /repos/{owner}/{repo}/git/trees/{sha}?recursive=1`
3. **Filter by file type**: `.md, .txt, .json, .yaml, .js, .py, .go, .rs, .ts, .jsx, .tsx, .sql`
4. **Download each file**: `GET /repos/{owner}/{repo}/contents/{path}` (returns `content` field in base64)
5. **Rate limit aware**: Check headers after each request; back off if low

**File Size Limits**:
- GitHub API returns max 100 KB per single file request
- Larger files: use Git Data API (returns raw content URLs, then fetch separately)
- Config: `MAX_FILE_SIZE_MB=10` (skip oversized files, log reason)

```javascript
// Example usage
const GitHubClient = require('./src/github');
const client = new GitHubClient(accessToken, rateLimiter);
const { files, errors } = await client.fetchRepositories(['owner/repo-1', 'owner/repo-2']);
// Returns: { files: [...], errors: [...] }
```

**Error Handling**:
- 404 (repo not found) → skip repo, log error
- 403 (rate limit) → trigger fallback immediately
- 401 (invalid token) → throw + exit
- Network timeout → retry with backoff

### 4.3 Code File Parser (`src/parse.js`)

**Supported File Types**:
- Markdown (`.md`, `.txt`) — return as-is
- JSON (`.json`) — format with 2-space indent
- YAML (`.yaml`, `.yml`) — parse + format readable
- Code (`.js`, `.ts`, `.jsx`, `.tsx`, `.py`, `.go`, `.rs`, `.java`, `.c`, `.cpp`, `.rb`, `.php`) — return as-is with language hint
- SQL (`.sql`) — format + highlight
- Config (`.env`, `.conf`, `.cfg`, `.toml`, `.xml`) — format for readability

**Dispatch Logic** (in `parseCodeFile(buffer, fileName)`):
```
if .md → return text as-is
if .json → JSON.stringify(JSON.parse(text), null, 2)
if .yaml → format with readable structure
if .js|.ts|.py|.go|.rs → return as-is (preserve formatting)
else → return text as-is (safe default)
```

**File-Type Specific Sections**:
```markdown
### File: src/api.js (3.2 KB, JavaScript)

​`​`​`javascript
[code content with backticks]
​`​`​`

---

### File: docs/ARCHITECTURE.md (1.8 KB, Markdown)

[markdown content]

---

### File: config.json (512 B, JSON)

​`​`​`json
[formatted JSON]
​`​`​`
```

**Safety**:
- Never execute code
- No syntax checking (return as-is)
- Scrub common secrets (API keys in comments) → `[REDACTED_KEY]`
- Warn if `.env` file encountered (don't parse; security risk)

### 4.4 Fallback Ingestion (`src/fallback.js`)

**Trigger**: When GitHub API fails (rate limit, network error, auth failure)

**Strategy 1: Local Cache** (Preferred)
- Check if repo exists in `C:\Users\aksha\Oasis_Project\60_GitHub_Cache\{owner}\{repo}\.git`
- If yes → use `git ls-tree -r HEAD` to fetch file list (no HTTP calls)
- Read from local `.git/objects` (no clone needed, just existing cache)
- Fast, no API calls

**Strategy 2: Manual Fallback** (If no cache)
- Suggest downloading repo as ZIP from GitHub UI
- Extract to `60_GitHub_Cache/{owner}/{repo}/`
- Run fallback again to read from extracted files
- Document in output: "Manual setup required"

**Configuration**:
```env
GITHUB_CACHE_PATH=C:\Users\aksha\Oasis_Project\60_GitHub_Cache
USE_LOCAL_CACHE_FALLBACK=yes
```

**Fallback Output** (same format as cloud, but prefixed):
```markdown
## Repository: owner/repo (CACHED - 2026-07-20 12:34 UTC)

[cached content]

---

⚠️ Note: Content from local cache, not live from GitHub API.
Updated: `rclone sync` equivalent or manual download needed.
```

---

## 5. Configuration & Safety

### 5.1 Environment Variables (`.env.example`)

```env
# GitHub API
GITHUB_PAT=your_personal_access_token_here
GITHUB_OWNER=your_github_username

# Repositories to ingest (space-separated or JSON array)
GITHUB_REPOS=owner/repo-1 owner/repo-2

# Or use GraphQL query to auto-discover (alternative)
GITHUB_AUTO_DISCOVER=false
GITHUB_AUTO_DISCOVER_QUERY=language:JavaScript stars:>100

# API Rate Limiting
MAX_REQUESTS_PER_SECOND=10

# File size cap (MB)
MAX_FILE_SIZE_MB=10

# File types to ingest (space-separated)
INCLUDED_FILE_TYPES=.md .js .py .json .yaml .ts .tsx .go .rs

# Fallback cache path
GITHUB_CACHE_PATH=../../../Oasis_Project/60_GitHub_Cache
USE_LOCAL_CACHE_FALLBACK=yes

# Output
OUTPUT_DIR=./output
ARCHIVE_OUTPUTS=yes

# Token cache (for future optimization)
TOKEN_CACHE_PATH=./token-cache.json
```

### 5.2 Safety Constraints

**Read-Only Enforcement**:
- ✅ All GitHub API calls use read-only endpoints (no repo creation, no commit, no PR)
- ✅ No `POST`, `PUT`, `DELETE` methods used
- ✅ Code explicitly forbids any write operations
- ✅ .gitignore excludes any staging directories

**Human-in-the-Loop for Writes**:
```
Proposed code change:
  → Save to: C:\Users\aksha\Oasis_Project\60_GitHub_Staging\{owner}\{repo}\{path}.PROPOSED
  → Require explicit human review file
  → Never auto-commit or push
  → Document in MEMORY.md: "Proposed change saved; awaiting human review"
```

**No Auto-Publishing**:
- Output file is `latest_github_ingest.md` (informational only)
- Branding engine reads as optional reference (like cloud reference)
- Changes to Branding/Community output still require human Review Checklist
- Zero auto-execution of ingested code

**Token Security**:
- PAT never logged
- `.env` and `token-cache.json` gitignored
- PAT scoped to minimum: `repo:read` (GitHub fine-grained tokens)
- Fail loudly if PAT has write scopes (warn user to regenerate read-only token)

---

## 6. Implementation Roadmap

### Phase 1: Core Ingestion (Standalone)
- [ ] `index.js` — orchestrator (copy & adapt from `cloud_ingest/index.js`)
- [ ] `src/auth.js` — PAT validation
- [ ] `src/github.js` — REST API client (fetch files)
- [ ] `src/parse.js` — code file dispatcher
- [ ] `src/rateLimiter.js` — reuse from cloud_ingest
- [ ] `src/memoryLog.js` — reuse from cloud_ingest
- [ ] `src/fallback.js` — local cache or manual fallback

### Phase 2: Integration with Branding/Community Engines
- [ ] Configure branding_engine to optionally read `latest_github_ingest.md` as reference
- [ ] Add GitHub reference config to `branding_engine/CLOUD_REFERENCE_CONFIG.md`
- [ ] Document in `CLOUD_REFERENCE_MANIFEST.md`

### Phase 3: Proposed Change Workflow
- [ ] Define staging directory structure: `60_GitHub_Staging/{owner}/{repo}/{path}.PROPOSED`
- [ ] Document review workflow in `GITHUB_INGESTION_HUMAN_REVIEW_GATE.md`
- [ ] Create safety checklist for human reviewers

---

## 7. File Organization

```
C:\Users\aksha\.openclaw\agents\branding_engine\tools\github_ingest\  [NEW]
├── package.json                        # node-fetch, js-yaml, dotenv
├── .env.example                        # Template (safe to commit)
├── .gitignore                          # .env, token-cache.json, node_modules/, *.tmp
├── index.js                            # Main orchestrator
├── README.md                           # Setup + usage + safety
├── src/
│   ├── auth.js                         # PAT validation
│   ├── github.js                       # GitHub REST API client
│   ├── parse.js                        # Code file parser dispatcher
│   ├── rateLimiter.js                  # (Copy from cloud_ingest)
│   ├── fallback.js                     # Local cache fallback
│   └── memoryLog.js                    # (Copy from cloud_ingest)
└── output/
    └── latest_github_ingest.md         # Consolidated repo contents

C:\Users\aksha\Oasis_Project\60_GitHub_Cache\  [NEW]
└── {owner}/{repo}/...                  # Optional local cache

C:\Users\aksha\Oasis_Project\60_GitHub_Staging\  [NEW]
└── {owner}/{repo}/{path}.PROPOSED      # Proposed changes awaiting human review
```

---

## 8. Example Workflow

### Run 1: Ingest from GitHub API
```bash
cd C:\Users\aksha\.openclaw\agents\branding_engine\tools\github_ingest
npm install
npm start
```

**Output**:
- `output/latest_github_ingest.md` — 142 files, 3.2 MB, all repos
- Audit: `GITHUB_INGESTION_AUDIT.md` updated with run stats
- Branding engine can now reference GitHub repo structures

### Run 2: API Rate Limit Hit
- Catch 403 response
- Trigger fallback: check `60_GitHub_Cache/`
- If cache exists: use cached files
- If no cache: log error, ask user to download via UI
- Output still generated (merged cloud + cache)

### Run 3: Proposed Code Change
- Branding engine suggests refactoring suggestion based on GitHub patterns
- Save to `60_GitHub_Staging/owner/repo/src/refactor.PROPOSED`
- Output: "Change proposed and staged for human review"
- User manually reviews, approves, or discards
- Zero auto-commit or push

---

## 9. Comparison to OneDrive Ingestion

| Feature | OneDrive | GitHub |
|---------|----------|--------|
| **API** | Microsoft Graph | GitHub REST (+ GraphQL option) |
| **Auth** | MSAL device code flow | Personal Access Token |
| **Rate Limit** | 3 req/sec | 10 req/sec (GitHub faster) |
| **File Types** | PDF, DOCX, CSV, MD | Code, JSON, YAML, MD, etc. |
| **Fallback** | Local `20_Tech_Notes/` | Local `60_GitHub_Cache/` |
| **Output** | `latest_ingestion.md` | `latest_github_ingest.md` |
| **Use Case** | Course materials | Code repositories |

---

## 10. Security & Audit Trail

**Compliance**:
- ✅ Read-only enforced (no mutations possible)
- ✅ Token security (PAT never logged, `.env` gitignored)
- ✅ Human-in-the-loop for any writes (staging + manual review)
- ✅ Audit logging (all runs tracked in MEMORY.md)
- ✅ Rate limiting (respectful of GitHub API limits)

**Monitoring**:
- Run stats logged: repos, files, duration, API calls, fallback reasons
- Rate limit headers logged: remaining/reset times
- Failed files tracked: which repos, which files, why
- Proposed changes logged with timestamp + path

---

## Next Steps

1. **Implement Phase 1** (standalone GitHub ingestion)
2. **Test with sample repo** (validate API calls, parser, output format)
3. **Add to branding_engine reference** (Phase 2 integration)
4. **Document human review workflow** (Phase 3 write gates)

---

**Status**: Design Ready for Implementation  
**Effort Estimate**: 2-3 hours (Phase 1 core ingestion)
