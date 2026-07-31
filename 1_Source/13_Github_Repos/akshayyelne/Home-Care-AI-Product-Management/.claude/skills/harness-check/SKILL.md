# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/harness-check/SKILL.md
# Generated: 2026-07-31T00:49:45.197Z

description: Runs the harness audit grader against built code — checks Security Debt (SD) and Requirement Drift (RD) against the PRD and Logic Spec. SD-01B is the merge gate. Returns PASS or FAIL with an Agent Fix Queue.
argument-hint: (no arguments needed)


Run a full audit of the built code against the PRD (Artifact_21), Logic Spec (Artifact_23), and User Stories (Artifact_24).

The grading criteria are defined in: `.claude/skills/Execution/Artifact_26_Harness_Audit_Grader.md`
Read that file now before proceeding.



### Security Debt (SD) Checks

| ID | Check | Merge Gate? |
|---|---|---|
| **SD-01B** | Audit Log Completeness — every state transition writes APPAuditLogEntry | **YES — blocks merge** |
| SD-02 | Authentication & Authorisation | No (v1 deferred by design — document deferral) |
| SD-03 | Prompt Injection / CRIT-02 | Yes if SMS rendering uses LLM or f-strings |
| SD-04 | RAG / Vector Store Isolation | N/A in v1 |
| SD-05 | Secrets & Credentials | Yes — no hardcoded keys |
| SD-06 | APPAuditLogEntry naming | Yes — HIPAAAuditLogEntry in production = MEDIUM |
| SD-07 | Hash-chain integrity | Yes — entry_hash + previous_hash non-nullable |
| SD-08 | Immutable log storage | Yes — write-once S3 Object Lock pattern |

### Requirement Drift (RD) Checks

| ID | Check |
|---|---|
| RD-01 | All P1 features from PRD §7.2 implemented |
| RD-02 | SMART OKRs (OKR-1 to OKR-5) measurable by the build |
| RD-03 | All Threshold Constants from Artifact_23 §3 present as named constants |
| RD-04 | All guards (CC-1, CC-4, CC-6, CC-8, G-DS-05, G-E3-1) implemented and tested |
| RD-05 | All User Story Confirmation criteria met (with APPAuditLogEntry fields) |
| RD-06 | Synthetic data scenarios passing (expected_audit.sql validation queries return correct rows) |



For every state transition in the codebase, verify:
1. `log_event()` is called **before** the transition completes
2. The `APPAuditLogEntry` includes all non-nullable fields
3. `state_before` and `state_after` match the Event Type Registry (CLAUDE.md Article IX)
4. `entry_hash = SHA-256(all fields)` is computed
5. `previous_hash` references the prior entry's hash

Missing any of the above = **CRITICAL** finding.



```
OVERALL VERDICT: PASS | CONDITIONAL PASS | FAIL

CRITICAL findings:  N
HIGH findings:      N
MEDIUM findings:    N
LOW findings:       N
PASS checks:       N / total

Merge gate SD-01B: CLEAR | BLOCKED

FIX-001 [CRITICAL] — <description> — <file:line> — <fix instruction>
FIX-002 [HIGH] — ...
```

Report CRITICAL → HIGH → MEDIUM → LOW order.
After the report, state clearly: "ECC may proceed" or "ECC is blocked — resolve CRITICAL findings first."
