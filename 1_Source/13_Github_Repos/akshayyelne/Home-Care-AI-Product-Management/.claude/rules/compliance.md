# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/rules/compliance.md
# Generated: 2026-07-31T00:49:45.104Z

paths:
  - "**/*.py"
  - "**/*.ts"
  - "**/*.sql"
Source: CLAUDE.md Articles VII + IX | .claude/skills/Strategy/Artifact_16_Compliance_Privacy_Audit.md

- Always `APPAuditLogEntry` in production code, schemas, and acceptance criteria
- Never `HIPAAAuditLogEntry` as a primary class name — it is the design floor only
- `interface APPAuditLogEntry extends HIPAAAuditLogEntry` is acceptable in type declarations

- No PHI in plaintext logs, error traces, crash dumps, analytics, or AI prompt completions — CRITICAL violation
- `patient_id` is always a UUID — never name, DOB, or any direct identifier
- RAG queries must include `patient_id` metadata filter on every retrieval — no exceptions

- Every state transition writes an `APPAuditLogEntry` **before** any other action
- Logs are append-only — no application role may UPDATE or DELETE a log entry
- 7-year retention: `AUDIT_LOG_RETENTION_YEARS = 7` — write-once S3 Object Lock (COMPLIANCE mode)
- Non-nullable fields: `log_id`, `timestamp`, `patient_id`, `event_type`, `state_before`, `state_after`, `action_taken`, `ai_confidence_score`, `entry_hash`, `previous_hash`
- Hash-chain: `entry_hash = SHA-256(all fields)`, `previous_hash = hash of prior entry`

- Any data sent via WhatsApp/Meta requires `cross_border_disclosure = True` + `app8_basis` field populated
- WhatsApp payloads must pass CC-8 guard: Green-zone data only — no SPP fields

- SMS templates: `template.replace("{variable}", sanitized_value)` only
- No f-strings with user-controlled input, no `format()` with unvalidated data, no LLM in SMS rendering path

Full audit: .claude/skills/Strategy/Artifact_16_Compliance_Privacy_Audit.md
