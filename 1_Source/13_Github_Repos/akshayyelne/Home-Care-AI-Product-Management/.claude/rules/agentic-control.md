# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/rules/agentic-control.md
# Generated: 2026-07-31T00:49:45.102Z

paths:
  - "**/*.py"
  - "**/*.ts"
Source: CLAUDE.md Article VIII | .claude/skills/Discovery/Artifact_10_Agentic_Safety_Discovery.md

- **L1 Informer** — `push_notification()`, `log_event()`: passive, reversible, no HITL required
- **L2 Verifier** — `escalate_to_hitl()`, `flag_for_review()`: requires human confirmation, gates L3
- **L3 Escalator** — `dispatch_ems()`, `revoke_access()`, `override_medication()`: irreversible, mandatory HITL

- L1 / L2 actions: `claude-haiku-4-5-20251001`
- L3 actions only: `claude-sonnet-4-6`
- New L3 classifications require PM Lead sign-off before implementation

```
escalate_to_hitl(RN, 120s SLA)
  ├── RN responds → CONFIRM or CLEAR → log + act
  └── RN timeout → log HITL_TIMEOUT
        └── escalate_to_hitl(MD, 60s SLA)
              ├── MD responds → CONFIRM or CLEAR → log + act
              └── MD timeout → log HITL_DOUBLE_TIMEOUT
                    └── auto dispatch_ems()  ← safety default, not a bypass
                        log EMS_DISPATCHED + HITL_DOUBLE_TIMEOUT
```
**The system must never be left in ALERT_PENDING state. Every path must resolve.**

- **CC-1**: Never combine P-3 + P-4 + P-5 in a single outbound payload
- **CC-4**: P-9 (cognitive vulnerability) excluded from all scoring algorithms
- **CC-6**: Never expose match score or algorithm explanation to carers
- **CC-8**: WhatsApp/SMS payload contains Green-zone data only — no SPP fields
- **G-DS-05**: P-3-aware notification phrasing — two variants based on carer visit history
- **G-E3-1**: `client_notified = True` REQUIRED before family notification sends

Full spec: .claude/skills/Execution/Artifact_23_Agentic_Logic_Spec.md
