# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/rules/execution.md
# Generated: 2026-07-31T00:49:45.106Z

paths:
  - ".claude/skills/Execution/**"
  - "src/**"
  - "tests/**"
Source: CLAUDE.md Article V

- **Stage A** — PRD is Source of Truth. If PRD changes, restart Stage A.
- **Stage B** — Logic Spec before Stories. Stories without Threshold Constants = invalid ECC input.
- **Stage C** — Stories cite Audit Schema fields. Every Confirmation section names `APPAuditLogEntry` fields.
- **Stage D** — Synthetic data before build. ECC instruction: "make these tests pass."

- No feature ships until every state transition writes a correctly structured, immutable `APPAuditLogEntry`
- Missing `log_event()` call = CRITICAL finding — blocks merge
- Required state machine: `NORMAL → ALERT_PENDING → HITL_PENDING → ALERT_DISPATCHED → RESOLVED`
- Every path through the state machine must be covered by a row in `expected_audit.sql`

| Stage | Required Input Artifacts |
|---|---|
| Stage A (PRD) | Artifact_15 (MoT + L3s) + Artifact_16 (NFRs) + Artifact_14 ("What After") |
| Stage B (Logic Spec) | Artifact_21 (PRD) + ranked problems from Artifact_22 |
| Stage C (User Stories) | Artifact_23 (Threshold Constants + event type registry) |
| Stage D (ECC Build) | PRD + Logic Spec + User Stories + synthetic-data/ |

- [ ] All Threshold Constants named in Artifact_23 §3 appear as Python constants in `src/`
- [ ] Every guard ID (CC-1, CC-4, CC-6, CC-8, G-DS-05, G-E3-1) has a named function or check
- [ ] Every `APPAuditLogEntry` write includes `entry_hash` and `previous_hash`
- [ ] `tests/integration/` loads from `.claude/skills/Execution/synthetic-data/`

Full rules: CLAUDE.md Article V
