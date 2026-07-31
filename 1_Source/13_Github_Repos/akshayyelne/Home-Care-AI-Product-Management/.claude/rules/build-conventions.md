# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/rules/build-conventions.md
# Generated: 2026-07-31T00:49:45.103Z

paths:
  - "src/**"
  - "tests/**"
  - "config/**"
Source: config/sms_templates.py (existing baseline) | .claude/skills/Execution/Artifact_21_PRD.md

- Python 3.11+
- Type annotations required on all public functions and return types
- No `Any` type — use `Union`, `Optional`, or `TypeVar`
- `mypy --strict` compliance target

```
src/
├── core/           ← matching engine, HITL coordinator, vacancy state machine
├── notifications/  ← SMS templates (config/sms_templates.py will migrate here)
├── audit/          ← APPAuditLogEntry writer, hash-chain logic, log_event()
└── integrations/   ← AlayaCare write-back (AX-02), WhatsApp/Twilio client

tests/
├── unit/           ← pure logic, no I/O, fast
└── integration/    ← loads Execution/synthetic-data/ fixtures, hits real logic paths
```

- No f-strings with user-controlled input (CRIT-02) — see rules/compliance.md
- Every function that writes an `APPAuditLogEntry` must document it in its docstring:
  `Writes: APPAuditLogEntry(event_type='ANOMALY_DETECTED')`
- Guard IDs must appear as inline comments at the guard check:
  `# CC-8: Green-zone only`

- Framework: `pytest`
- Fixtures load from `.claude/skills/Execution/synthetic-data/` (clients.json, incidents.json, expected_audit.sql)
- `conftest.py` at `tests/` root
- Test naming: `test_<module>_<scenario>.py`
- Unit tests: no real I/O, no real DB, mock at system boundary only
- Integration tests: must run against synthetic-data fixtures — never real PHI

- Declare in `requirements.txt` (runtime) and `requirements-dev.txt` (test/lint)
- No unpinned dependencies in requirements.txt

- `config/sms_templates.py` is the canonical source — no template strings anywhere else
- `assert_copy_approved()` must be called at application startup (not per-send)
- `HOMECARE_AI_TEST_MODE=true` bypasses approval gate in test harness only
