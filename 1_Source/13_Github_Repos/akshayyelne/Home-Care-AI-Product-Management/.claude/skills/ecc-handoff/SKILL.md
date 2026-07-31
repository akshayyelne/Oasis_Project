# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/ecc-handoff/SKILL.md
# Generated: 2026-07-31T00:49:45.195Z

description: ECC onboarding sequence — loads build inputs in correct order, confirms handshake integrity, and sets up the build context before coding begins. Run this at the start of every ECC build session.
disable-model-invocation: false
argument-hint: (no arguments needed)


You are about to begin building the Home-Care-AI scheduling platform. Load context in this exact order before writing any code.



Read: `.claude/skills/Execution/Artifact_21_PRD.md`

Key sections to internalise:
- §4 Objectives (SMART OKRs OKR-1 through OKR-5) — these are your success criteria
- §7.2 Priority 1 features — these must ship; the product does not exist without them
- §7.3 Technology (model selection: Haiku for L1/L2, Sonnet for L3 only)
- §8 Constraints — every High-Risk Compound Combination is a hard constraint



Read: `.claude/skills/Execution/Artifact_23_Agentic_Logic_Spec.md`

Key sections:
- §2 State machine — NORMAL → ALERT_PENDING → HITL_PENDING → ALERT_DISPATCHED → RESOLVED
- §3 Threshold Constants — copy these verbatim as Python constants in `src/core/constants.py`
- §4 Gate functions (Gate 0 through Gate 14) — each becomes a named function
- §7 Guards (CC-1, CC-4, CC-6, CC-8, G-DS-05, G-E3-1) — each becomes an assertion
- §8 APPAuditLogEntry schema — your audit log contract
- §9 Infrastructure — AWS services, environment variables required



Read: `.claude/skills/Execution/Artifact_24_User_Stories.md`

Each story's Confirmation section names the `APPAuditLogEntry` fields required.
A story is not done until its audit log fields are written correctly.



Your build instruction is: **make the tests in synthetic-data/ pass.**

Files:
- `.claude/skills/Execution/synthetic-data/clients.json` — 5 fictitious patients
- `.claude/skills/Execution/synthetic-data/incidents.json` — 24h telemetry with anomaly events
- `.claude/skills/Execution/synthetic-data/expected_audit.sql` — ground truth + validation queries

Load these as pytest fixtures in `tests/conftest.py`. Every integration test runs against them.



Rules that load automatically when you write code:
- `.claude/rules/compliance.md` — APPAuditLogEntry, no PHI, append-only logs
- `.claude/rules/agentic-control.md` — L1/L2/L3 levels, HITL timeout protocol, guard IDs
- `.claude/rules/build-conventions.md` — Python 3.11+, src/ layout, test conventions
- `.claude/rules/execution.md` — SD-01B merge gate, handshake inputs



Before any feature is marked done, run: `/grade`

The merge gate is SD-01B: every state transition must write a correctly structured, immutable `APPAuditLogEntry`. A missing `log_event()` call is CRITICAL and blocks merge.



- [ ] `src/core/constants.py` created with all Threshold Constants from Artifact_23 §3
- [ ] `tests/conftest.py` loads clients.json and incidents.json as fixtures
- [ ] Every gate function (Gate 0–14) has a corresponding test in `tests/unit/`
- [ ] `log_event()` called before any state transition returns
- [ ] `APPAuditLogEntry` used everywhere — never `HIPAAAuditLogEntry`
- [ ] `/grade` returns OVERALL VERDICT: PASS before PR is opened
