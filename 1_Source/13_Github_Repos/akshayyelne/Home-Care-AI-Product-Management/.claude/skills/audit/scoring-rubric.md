# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/audit/scoring-rubric.md
# Generated: 2026-07-31T00:49:45.194Z

| # | Category | Max | Rationale |
|---|---|---|---|
| 1 | CLAUDE.md Assessment | 20 | Primary context contract for every session |
| 2 | Project Structure | 20 | Pipeline clarity is foundational |
| 3 | Handshake Integrity | 20 | Core constitutional requirement — artifacts must chain |
| 4 | File Size Analysis | 10 | Context window efficiency for ECC |
| 5 | Code Quality & Compliance | 10 | Only category with production code right now |
| 6 | Testing Assessment | 10 | Deferred pre-ECC — see SCORES.md |
| 7 | Documentation | 10 | Deferred pre-ECC — see SCORES.md |
| 8 | Claude Code Integration | 10 | Tooling completeness |
| 9 | Regulatory & Naming | 10 | APP vs HIPAA naming is a legal risk |
| | **Total** | **120** | |


| Score | % | Label |
|---|---|---|
| 108–120 | 90–100% | Production Ready |
| 96–107 | 80–89% | Build Ready |
| 72–95 | 60–79% | Pre-Build (current state) |
| 48–71 | 40–59% | Needs Work |
| < 48 | < 40% | Do Not Build |


### Cat 1 — CLAUDE.md (0–20)
- 20: < 200 lines, has dev commands, tech stack, folder index, conventions
- 15: < 300 lines, missing 1–2 developer sections
- 10: 300–400 lines, PM-facing, missing commands
- 5: > 400 lines or missing key sections
- 0: Does not exist

### Cat 3 — Handshake Integrity (0–20)
- 20: All 9 handshakes verified, artifacts in correct folders
- 18: 8–9 present, minor placement issue
- 12: 7–8 present
- 6: < 7 present
- 0: < 5 present or no cross-references

### Cat 9 — Regulatory Naming (0–10)
- 10: Zero `HIPAAAuditLogEntry` outside CLAUDE.md + extends declarations
- 7: 1–2 MEDIUM violations
- 4: 3–5 MEDIUM violations
- 0: Any CRITICAL violation (production class named HIPAAAuditLogEntry)

See audits/SCORES.md for trend tracking.
