# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/audit/SKILL.md
# Generated: 2026-07-31T00:49:45.193Z

description: Comprehensive 9-category project audit — structure, handshakes, compliance naming, Claude Code integration. Writes report to audits/YYYY-MM-DD_audit.md. Read-only, no fixes applied.
disable-model-invocation: false
argument-hint: (no arguments needed)

Perform a comprehensive audit of this project and write a detailed report to
`audits/$CURRENT_DATE_audit.md` (ISO 8601 date) and update `audits/SCORES.md`.

**DO NOT apply any fixes. Report findings only.**



### 1. CLAUDE.md Assessment (score 0–20)
- Does it exist? Line count? (flag if > 200 lines per official Claude Code guidance)
- Sections present: tech stack / folder structure / dev commands / conventions / gotchas?
- Quality: developer-facing or PM-facing?
- Is it current?

### 2. Project Structure (score 0–20)
- Print full folder/file tree (exclude .git)
- Is pipeline order (Discovery → Strategy → Execution) clear?
- Are artifact numbering and placement consistent?
- Orphaned files? Missing standard folders?

### 3. Handshake Integrity (score 0–20)
Check all 9 formal handshakes from CLAUDE.md Article VI:
| ID | Source Artifact | Target Artifact | Status |
|---|---|---|---|
| HS-DISC-01 | Artifact_2a–2d (JTBD) | Artifact_12_Startup_Canvas | ✓/✗ |
| HS-DISC-02 | Artifact_4_Market_Segmentation | Artifact_14_Value_Proposition | ✓/✗ |
| HS-DISC-03 | Artifact_9_Ethics_Trust_Map | Artifact_16_Compliance_Privacy_Audit | ✓/✗ |
| HS-DISC-04 | Artifact_10_Agentic_Safety_Discovery | Artifact_23_Agentic_Logic_Spec | ✓/✗ |
| HS-STRAT-01 | Artifact_15_User_Journey_Map | Artifact_21_PRD §7.2 | ✓/✗ |
| HS-STRAT-02 | Artifact_16_Compliance_Privacy_Audit | Artifact_23 NFRs | ✓/✗ |
| HS-STRAT-03 | Artifact_20_AI_Unit_Economics | Artifact_23 model selection | ✓/✗ |
| HS-STRAT-04 | Artifact_14_Value_Proposition | Artifact_21 SMART OKRs | ✓/✗ |
| HS-STRAT-05 | Artifact_18_Partnership_Mapping | Artifact_19_Positioning_Statement | ✓/✗ |

### 4. File Size Analysis (score 0–10, penalty-only)
- List all files > 300 lines with exact counts
- Files > 500 lines: suggest split strategy

### 5. Code Quality & Compliance Architecture (score 0–10)
- List all source code files (non-markdown): language, line count, purpose
- Approval gates present? (config/sms_templates.py APPROVED_BY / APPROVED_DATE)
- PHI guard patterns in code?
- CRIT-02 compliance?

### 6. Testing Assessment (score 0–10)
- Do test files exist in tests/? Say explicitly if not.
- Is synthetic-data/ referenced in Artifact_25 and Artifact_26?
- **Note:** Testing deferred until post-ECC build sprint (decision: audits/SCORES.md 2026-03-30). Score < 5 expected — do not flag as new finding.

### 7. Documentation (score 0–10)
- README.md line count and usefulness
- docs/ folder contents
- ADRs present?
- **Note:** README and docs/ deferred until post-ECC (decision: audits/SCORES.md 2026-03-30). Score < 5 expected — do not flag as new finding.

### 8. Claude Code Integration (score 0–10)
- .claude/settings.json: permissions, enabledPlugins (all 3 should be enabled as of 2026-03-30)
- .claude/rules/: how many files, are paths: scopes correct?
- .claude/skills/: custom skills present?
- .claude/agents/: subagents present?

### 9. Regulatory & Naming Compliance (score 0–10)
- Grep for `HIPAAAuditLogEntry` outside CLAUDE.md and `extends` declarations
- Each non-extends occurrence = MEDIUM finding per CLAUDE.md Article IX
- Does Artifact_16 reference APP 8 cross-border disclosure?
- Does expected_audit.sql use APPAuditLogEntry naming?



```markdown
[2–3 sentences + Overall Score X/120]
### Quick Wins (< 30 min)
### Medium Effort (1–4 hours)
### Major Work (1+ days)
```

- Specific: exact file paths and line numbers only
- Do NOT invent issues — only report what you can verify
- Cannot verify something? Say "Could not verify — [reason]"
- DO NOT apply fixes

Scoring rubric: see scoring-rubric.md in this skill directory.
