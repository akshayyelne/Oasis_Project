# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Execution/synthetic-data/expected_audit.sql
# Generated: 2026-07-31T00:49:45.170Z

```sql
-- =============================================================================
-- SYNTHETIC DATA — NOT REAL APP-PROTECTED DATA
-- Generated for Home-Care-AI ECC validation harness — Artifact 25
-- All identifiers are deterministic for test reproducibility; all names fictitious
-- Generated: 2026-03-28T00:00:00.000Z
-- Compliance: Australian Privacy Act 1988 (APP) — not US HIPAA
-- Schema: APPAuditLogEntry (extends CLAUDE.md Article IX with APP-specific fields)
-- SD-01B merge gate: Every state transition must produce a correctly structured entry
-- Hash note: entry_hash and previous_hash are SHA-256 placeholders.
--             ECC MUST compute SHA-256(CONCAT(all_fields)) at runtime.
--             Placeholder format: 'SHA256_PLACEHOLDER_{log_id}' — not a real hash.
-- =============================================================================

-- =============================================================================
-- DDL: Expected audit events (ground truth — populated before test run)
-- =============================================================================

CREATE TABLE IF NOT EXISTS synthetic_expected_audit_events (
  -- Ground truth identification
  audit_id                VARCHAR(36)     PRIMARY KEY,
  scenario_id             VARCHAR(10)     NOT NULL,  -- SYN-01 through SYN-05
  incident_id             VARCHAR(36)     NOT NULL,
  sequence_order          INTEGER         NOT NULL,  -- Event position within scenario
  expected_trigger_ts     TIMESTAMP       NOT NULL,  -- When ECC should produce this entry
  trigger_window_ms       INTEGER         NOT NULL   DEFAULT 30000,  -- Acceptable latency

  -- APPAuditLogEntry fields (CLAUDE.md Article IX — all non-nullable fields enforced)
  log_id                  VARCHAR(36)     NOT NULL,
  timestamp               TIMESTAMP       NOT NULL,
  session_id              VARCHAR(36)     NOT NULL,
  case_id                 VARCHAR(36)     NOT NULL,
  patient_id              VARCHAR(36)     NOT NULL,  -- maps to client_id; never name/DOB
  user_id                 VARCHAR(36),               -- null if AI-initiated
  hitl_id                 VARCHAR(36),               -- null until escalated
  reviewer_role           VARCHAR(30),               -- 'CARE_COORDINATOR'|'SYSTEM'
  event_type              VARCHAR(60)     NOT NULL,
  state_before            VARCHAR(40)     NOT NULL,
  state_after             VARCHAR(40)     NOT NULL,
  action_taken            VARCHAR(200)    NOT NULL,
  ai_confidence_score     DECIMAL(5,3)    NOT NULL,
  model_id                VARCHAR(60)     NOT NULL,
  trigger_sensor          VARCHAR(100)    NOT NULL,
  trigger_value           TEXT,
  threshold_applied       VARCHAR(200)    NOT NULL,
  hitl_decision           VARCHAR(40),
  hitl_response_ms        INTEGER,
  hitl_notes              TEXT,
  lawful_basis            VARCHAR(20)     NOT NULL,  -- 'Treatment'|'Operations'|'Emergency'
  data_sensitivity        VARCHAR(20)     NOT NULL,  -- 'PHI'|'PII'|'OPERATIONAL'|'SYNTHETIC'
  entry_hash              VARCHAR(64)     NOT NULL,  -- SHA-256 placeholder — ECC computes real value
  previous_hash           VARCHAR(64)     NOT NULL,  -- Hash-chain link

  -- APP-specific extension fields (Artifact 23 §7 APPAuditLogEntry extension)
  cross_border_disclosure BOOLEAN         NOT NULL   DEFAULT FALSE,
  app8_basis              VARCHAR(60),               -- null unless disclosure crosses AU border
  consent_record_id       VARCHAR(36),
  consent_version         VARCHAR(10),
  guard_id                VARCHAR(20),               -- Named guard constant (e.g. 'CC-8', 'G-DS-05')
  guard_passed            BOOLEAN,
  guard_block_reason      TEXT,

  -- Validation metadata
  is_synthetic            BOOLEAN         NOT NULL   DEFAULT TRUE,
  notes                   TEXT
);

-- =============================================================================
-- DDL: Detected audit events (populated by ECC during test run)
-- =============================================================================

CREATE TABLE IF NOT EXISTS synthetic_detected_audit_events (
  detected_id             VARCHAR(36)     PRIMARY KEY,
  expected_audit_id       VARCHAR(36)     REFERENCES synthetic_expected_audit_events(audit_id),
  scenario_id             VARCHAR(10)     NOT NULL,
  incident_id             VARCHAR(36)     NOT NULL,
  sequence_matched        INTEGER,                   -- Which expected sequence_order matched
  event_type              VARCHAR(60)     NOT NULL,
  detected_at_ts          TIMESTAMP       NOT NULL,
  latency_ms              INTEGER,                   -- detected_at_ts - expected_trigger_ts
  guard_id_correct        BOOLEAN,                   -- guard_id matches expected
  guard_passed_correct    BOOLEAN,                   -- guard_passed matches expected
  hash_chain_valid        BOOLEAN,                   -- entry_hash = SHA256(fields); previous_hash = prior entry
  model_id_correct        BOOLEAN,                   -- model_id matches expected (L1/L2 vs L3)
  non_nullable_complete   BOOLEAN,                   -- All non-nullable fields present and non-null
  phi_in_plaintext        BOOLEAN         NOT NULL   DEFAULT FALSE,  -- CRITICAL if TRUE
  true_positive           BOOLEAN,                   -- Populated by grader after comparison
  false_positive          BOOLEAN,
  notes                   TEXT
);

-- =============================================================================
-- INSERTS: Ground truth expected events
-- Session and case ID naming convention:
--   session_id = 'sess-{scenario}-{incident_short}'
--   case_id    = 'case-{incident_short}'
--   log_id     = 'log-{scenario}-{seq:04d}'
-- =============================================================================

-- ============================================================
-- SCENARIO SYN-01: Happy path — familiarity ranking (Margaret Chen)
-- Case: case-inc0001 | Session: sess-syn01-inc0001
-- Expected terminal state: RESOLVED
-- Total events: 10
-- ============================================================

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0001', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 1, '2026-04-15T07:30:00Z', 30000,
  'log-syn01-0001', '2026-04-15T07:30:00.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', NULL, NULL, 'SYSTEM',
  'VACANCY_DETECTED', 'NORMAL', 'VACANCY_DETECTED',
  'trigger_matching_engine; vacancy_id=inc0001',
  0.999, 'NO_LLM', 'alayacare_absence_api',
  'shift_date=2026-04-15; client_id=c1a30001; service_type=domestic_assistance',
  'VACANCY_UNRESOLVED_ALERT_THRESHOLD=0.10',
  NULL, NULL, NULL,
  'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0001', 'CHAIN_GENESIS_syn01',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL,
  TRUE, 'Happy path start — vacancy from AlayaCare absence API');

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0002', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 2, '2026-04-15T07:30:15Z', 30000,
  'log-syn01-0002', '2026-04-15T07:30:15.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', NULL, NULL, 'SYSTEM',
  'SHORTLIST_GENERATED', 'VACANCY_DETECTED', 'SHORTLIST_READY',
  'generate_shortlist; shortlist_size=3; top_carer=ca3e0001; composite_score=0.726',
  0.997, 'claude-haiku-4-5-20251001', 'matching_engine',
  'shortlist_size=3; shortlist[0].carer_id=ca3e0001; shortlist[0].composite_score=0.726',
  'SCORING_WEIGHT_FAMILIARITY=0.60,SCORING_WEIGHT_PROXIMITY=0.40,SHORTLIST_MAX_CANDIDATES=3,IS-03:POSTCODE_CENTROID_FALLBACK',
  NULL, NULL, NULL,
  'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0002', 'SHA256_PLACEHOLDER_log-syn01-0001',
  FALSE, NULL, NULL, NULL, 'G-DS-05', TRUE, NULL,
  TRUE, 'Familiarity scoring: David Okafor rank 1 with visit_count=3; composite=0.726; phrasing=who has visited you before');

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0003', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 3, '2026-04-15T07:30:16Z', 30000,
  'log-syn01-0003', '2026-04-15T07:30:16.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', NULL, 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'HITL_REQUESTED', 'SHORTLIST_READY', 'HITL_PENDING',
  'escalate_to_hitl; coordinator_id=c00rd001; sla_min=30',
  0.995, 'claude-haiku-4-5-20251001', 'matching_engine',
  'shortlist_ready; coordinator_dashboard_notification_sent',
  'COORDINATOR_APPROVAL_SLA_MIN=30',
  NULL, NULL, NULL,
  'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0003', 'SHA256_PLACEHOLDER_log-syn01-0002',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL,
  TRUE, 'HITL escalation to primary coordinator; 30-min SLA starts');

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0004', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 4, '2026-04-15T07:35:00Z', 30000,
  'log-syn01-0004', '2026-04-15T07:35:00.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', 'c00rd001-0000-0000-0000-000000000001', 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'COORDINATOR_APPROVED', 'HITL_PENDING', 'COORDINATOR_APPROVED',
  'coordinator_approved; selected_carer=ca3e0001; hitl_response_ms=284000',
  0.999, 'NO_LLM', 'coordinator_dashboard',
  'approved=ca3e0001-4b3c-9d2e-0000-000000000001; rank=1',
  'COORDINATOR_APPROVAL_SLA_MIN=30',
  'CONFIRM_ASSIGNMENT', 284000, NULL,
  'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0004', 'SHA256_PLACEHOLDER_log-syn01-0003',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL,
  TRUE, 'Coordinator approved David Okafor within 30-min SLA (4 min 44 sec)');

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0005', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 5, '2026-04-15T07:35:01Z', 5000,
  'log-syn01-0005', '2026-04-15T07:35:01.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', NULL, NULL, 'SYSTEM',
  'CC8_FIELD_STRIPPED', 'COORDINATOR_APPROVED', 'COORDINATOR_APPROVED',
  'compliance_guard CC-8: strip PHI fields before carer SMS composition',
  0.999, 'NO_LLM', 'compliance_guard',
  'stripped_fields=[client_full_address, medical_notes, family_contact_details]',
  'CC-8:PHI_FIELDS_STRIPPED_BEFORE_CARER_SMS',
  NULL, NULL, NULL,
  'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0005', 'SHA256_PLACEHOLDER_log-syn01-0004',
  FALSE, NULL, NULL, NULL, 'CC-8', TRUE, NULL,
  TRUE, 'CRITICAL guard: PHI stripped before carer SMS — client address and medical info excluded from ACT-C-01 template');

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0006', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 6, '2026-04-15T07:35:02Z', 30000,
  'log-syn01-0006', '2026-04-15T07:35:02.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', NULL, NULL, 'SYSTEM',
  'CARER_NOTIFIED', 'COORDINATOR_APPROVED', 'CARER_NOTIFIED',
  'send_sms_template ACT-C-01; carer_id=ca3e0001; sms_gateway=AU_HOSTED; grace_period_min=15',
  0.999, 'NO_LLM', 'sms_gateway',
  'carer_id=ca3e0001; template=ACT-C-01; sms_sent=true; template_version=1.0.0',
  'CARER_REPLY_GRACE_MIN=15; CC-8:PHI_STRIPPED_CONFIRMED',
  NULL, NULL, NULL,
  'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0006', 'SHA256_PLACEHOLDER_log-syn01-0005',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL,
  TRUE, 'Carer SMS sent via AU-hosted gateway; no PHI in message body; 15-min grace period starts');

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0007', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 7, '2026-04-15T07:40:00Z', 60000,
  'log-syn01-0007', '2026-04-15T07:40:00.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', NULL, NULL, 'SYSTEM',
  'BRIEFING_SENT', 'CARER_NOTIFIED', 'BRIEFING_SENT',
  'send_briefing ACT-C-02; mode=STANDARD; guard CC-6 applied: no match_explanation in body',
  0.999, 'NO_LLM', 'briefing_assembly',
  'template=ACT-C-02; mode=STANDARD; cc6_guard=APPLIED; match_explanation_omitted=true',
  'CC-6:NO_MATCH_EXPLANATION_IN_BRIEFING; G-DS-05:FAMILIARITY_PHRASING_VARIANT_A',
  NULL, NULL, NULL,
  'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0007', 'SHA256_PLACEHOLDER_log-syn01-0006',
  FALSE, NULL, NULL, NULL, 'CC-6', TRUE, NULL,
  TRUE, 'Briefing sent; CC-6 guard confirms no scoring explanation; G-DS-05 phrasing: Margaret uses familiar carer (prior visits)');

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0008', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 8, '2026-04-15T07:40:30Z', 30000,
  'log-syn01-0008', '2026-04-15T07:40:30.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', NULL, NULL, 'SYSTEM',
  'CLIENT_NOTIFIED', 'BRIEFING_SENT', 'CLIENT_NOTIFIED',
  'send_sms_template ACT-P-01 Variant A; phrasing=who has visited you before (G-DS-05)',
  0.999, 'NO_LLM', 'sms_gateway',
  'template=ACT-P-01; variant=A; phrasing=familiar; client_sms_sent=true',
  'G-DS-05:FAMILIARITY_PHRASING_APPLIED; E3_GATE2_PREREQ_SET=true',
  NULL, NULL, NULL,
  'Treatment', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0008', 'SHA256_PLACEHOLDER_log-syn01-0007',
  FALSE, NULL, NULL, NULL, 'G-DS-05', TRUE, NULL,
  TRUE, 'Client SMS sent with familiarity phrasing per G-DS-05 Variant A; E-3 Gate 2 prerequisite satisfied');

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0009', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 9, '2026-04-15T07:40:45Z', 30000,
  'log-syn01-0009', '2026-04-15T07:40:45.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', NULL, NULL, 'SYSTEM',
  'FAMILY_NOTIFIED', 'CLIENT_NOTIFIED', 'FAMILY_NOTIFIED',
  'send_sms_template ACT-F-01; E-3 Gate 2 passed: client_notified=true',
  0.999, 'NO_LLM', 'sms_gateway',
  'template=ACT-F-01; family_contact=Alan_Chen; e3_gate2_passed=true; client_notified_before_family=CONFIRMED',
  'G-E3-1:E3_GATE2_CLIENT_NOTIFIED_REQUIRED',
  NULL, NULL, NULL,
  'Treatment', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0009', 'SHA256_PLACEHOLDER_log-syn01-0008',
  FALSE, NULL, NULL, NULL, 'G-E3-1', TRUE, NULL,
  TRUE, 'Family notification sent AFTER client confirmation — E-3 Gate 2 order enforced');

INSERT INTO synthetic_expected_audit_events VALUES
('syn01-aud-0010', 'SYN-01', '1nc00001-5c4d-7e3f-0000-000000000001', 10, '2026-04-15T07:41:00Z', 30000,
  'log-syn01-0010', '2026-04-15T07:41:00.000Z', 'sess-syn01-inc0001', 'case-inc0001',
  'c1a30001-4a2d-8f3c-0000-000000000001', NULL, NULL, 'SYSTEM',
  'INCIDENT_RESOLVED', 'FAMILY_NOTIFIED', 'RESOLVED',
  'incident_closed; fill_time_min=11; carer=ca3e0001; resolution=CARER_ACCEPTED',
  0.999, 'NO_LLM', 'matching_engine',
  'fill_time_min=11; resolution=CARER_ACCEPTED',
  'OKR-1:FILL_TIME_TARGET_MIN=5',
  NULL, NULL, NULL,
  'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn01-0010', 'SHA256_PLACEHOLDER_log-syn01-0009',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL,
  TRUE, 'Incident resolved in 11 min; OKR-1 target is <5 min — this is a test baseline over-run (acceptable in test harness)');


-- ============================================================
-- SCENARIO SYN-02: All carers decline + HITL double timeout (Patricia Williams)
-- Case: case-inc0002 | Session: sess-syn02-inc0002
-- Expected terminal state: VACANCY_UNRESOLVED
-- Total events: 17
-- ============================================================

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0001', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 1, '2026-04-16T08:00:00Z', 30000,
  'log-syn02-0001', '2026-04-16T08:00:00.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'VACANCY_DETECTED', 'NORMAL', 'VACANCY_DETECTED',
  'trigger_matching_engine; vacancy_id=inc0002',
  0.999, 'NO_LLM', 'alayacare_absence_api',
  'shift_date=2026-04-16; client_id=c1a30002',
  'VACANCY_UNRESOLVED_ALERT_THRESHOLD=0.10',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0001', 'CHAIN_GENESIS_syn02',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0002', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 2, '2026-04-16T08:00:15Z', 30000,
  'log-syn02-0002', '2026-04-16T08:00:15.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'SHORTLIST_GENERATED', 'VACANCY_DETECTED', 'SHORTLIST_READY',
  'generate_shortlist; shortlist_size=3; all_familiarity_scores=0.0',
  0.997, 'claude-haiku-4-5-20251001', 'matching_engine',
  'shortlist_size=3; shortlist[0].carer_id=ca3e0007; composite=0.364',
  'SCORING_WEIGHT_FAMILIARITY=0.60,SCORING_WEIGHT_PROXIMITY=0.40,IS-03:POSTCODE_CENTROID_FALLBACK',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0002', 'SHA256_PLACEHOLDER_log-syn02-0001',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'No familiar carers — proximity-only ranking');

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0003', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 3, '2026-04-16T08:00:16Z', 30000,
  'log-syn02-0003', '2026-04-16T08:00:16.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'HITL_REQUESTED', 'SHORTLIST_READY', 'HITL_PENDING',
  'escalate_to_hitl; coordinator_id=c00rd001; sla_min=30',
  0.995, 'claude-haiku-4-5-20251001', 'matching_engine', NULL,
  'COORDINATOR_APPROVAL_SLA_MIN=30',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0003', 'SHA256_PLACEHOLDER_log-syn02-0002',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0004', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 4, '2026-04-16T08:05:00Z', 30000,
  'log-syn02-0004', '2026-04-16T08:05:00.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', 'c00rd001-0000-0000-0000-000000000001', 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'COORDINATOR_APPROVED', 'HITL_PENDING', 'COORDINATOR_APPROVED',
  'coordinator_approved; selected_shortlist=all_3; proceed_in_rank_order',
  0.999, 'NO_LLM', 'coordinator_dashboard',
  'approved_shortlist_size=3', 'COORDINATOR_APPROVAL_SLA_MIN=30',
  'CONFIRM_ASSIGNMENT', 284000, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0004', 'SHA256_PLACEHOLDER_log-syn02-0003',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

-- Carer 1 (Robert Kim): notify → decline
INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0005', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 5, '2026-04-16T08:05:02Z', 10000,
  'log-syn02-0005', '2026-04-16T08:05:02.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'CC8_FIELD_STRIPPED', 'COORDINATOR_APPROVED', 'COORDINATOR_APPROVED',
  'compliance_guard CC-8: strip PHI before carer SMS; candidate=1 of 3',
  0.999, 'NO_LLM', 'compliance_guard', 'candidate_rank=1; carer_id=ca3e0007',
  'CC-8:PHI_FIELDS_STRIPPED_BEFORE_CARER_SMS',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0005', 'SHA256_PLACEHOLDER_log-syn02-0004',
  FALSE, NULL, NULL, NULL, 'CC-8', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0006', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 6, '2026-04-16T08:05:05Z', 30000,
  'log-syn02-0006', '2026-04-16T08:05:05.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'CARER_NOTIFIED', 'COORDINATOR_APPROVED', 'CARER_NOTIFIED',
  'send_sms ACT-C-01; carer_id=ca3e0007; rank=1',
  0.999, 'NO_LLM', 'sms_gateway', 'carer_id=ca3e0007; rank=1',
  'CARER_REPLY_GRACE_MIN=15', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0006', 'SHA256_PLACEHOLDER_log-syn02-0005',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Robert Kim notified — 15-min grace period starts');

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0007', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 7, '2026-04-16T08:20:02Z', 30000,
  'log-syn02-0007', '2026-04-16T08:20:02.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'CARER_DECLINED', 'CARER_NOTIFIED', 'COORDINATOR_APPROVED',
  'carer_declined; carer_id=ca3e0007; try_next_candidate=ca3e0004',
  0.999, 'NO_LLM', 'sms_gateway', 'carer_id=ca3e0007; declined=true; next_rank=2',
  'CARER_REPLY_GRACE_MIN=15',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0007', 'SHA256_PLACEHOLDER_log-syn02-0006',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Robert Kim declined after 15-min grace; proceeding to rank 2');

-- Carer 2 (Lisa Wong): notify → decline
INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0008', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 8, '2026-04-16T08:20:05Z', 10000,
  'log-syn02-0008', '2026-04-16T08:20:05.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'CC8_FIELD_STRIPPED', 'COORDINATOR_APPROVED', 'COORDINATOR_APPROVED',
  'compliance_guard CC-8: strip PHI; candidate=2 of 3',
  0.999, 'NO_LLM', 'compliance_guard', 'candidate_rank=2; carer_id=ca3e0004',
  'CC-8:PHI_FIELDS_STRIPPED_BEFORE_CARER_SMS',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0008', 'SHA256_PLACEHOLDER_log-syn02-0007',
  FALSE, NULL, NULL, NULL, 'CC-8', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0009', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 9, '2026-04-16T08:20:08Z', 30000,
  'log-syn02-0009', '2026-04-16T08:20:08.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'CARER_NOTIFIED', 'COORDINATOR_APPROVED', 'CARER_NOTIFIED',
  'send_sms ACT-C-01; carer_id=ca3e0004; rank=2',
  0.999, 'NO_LLM', 'sms_gateway', 'carer_id=ca3e0004; rank=2',
  'CARER_REPLY_GRACE_MIN=15', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0009', 'SHA256_PLACEHOLDER_log-syn02-0008',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Lisa Wong notified — 15-min grace period starts');

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0010', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 10, '2026-04-16T08:35:08Z', 30000,
  'log-syn02-0010', '2026-04-16T08:35:08.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'CARER_DECLINED', 'CARER_NOTIFIED', 'COORDINATOR_APPROVED',
  'carer_declined; carer_id=ca3e0004; try_next_candidate=ca3e0009',
  0.999, 'NO_LLM', 'sms_gateway', 'carer_id=ca3e0004; declined=true; next_rank=3',
  'CARER_REPLY_GRACE_MIN=15', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0010', 'SHA256_PLACEHOLDER_log-syn02-0009',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Lisa Wong declined; proceeding to rank 3');

-- Carer 3 (James Sullivan): notify → decline → all candidates exhausted
INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0011', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 11, '2026-04-16T08:35:10Z', 10000,
  'log-syn02-0011', '2026-04-16T08:35:10.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'CC8_FIELD_STRIPPED', 'COORDINATOR_APPROVED', 'COORDINATOR_APPROVED',
  'compliance_guard CC-8: strip PHI; candidate=3 of 3; final_candidate',
  0.999, 'NO_LLM', 'compliance_guard', 'candidate_rank=3; carer_id=ca3e0009',
  'CC-8:PHI_FIELDS_STRIPPED_BEFORE_CARER_SMS',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0011', 'SHA256_PLACEHOLDER_log-syn02-0010',
  FALSE, NULL, NULL, NULL, 'CC-8', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0012', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 12, '2026-04-16T08:35:12Z', 30000,
  'log-syn02-0012', '2026-04-16T08:35:12.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, NULL, 'SYSTEM',
  'CARER_NOTIFIED', 'COORDINATOR_APPROVED', 'CARER_NOTIFIED',
  'send_sms ACT-C-01; carer_id=ca3e0009; rank=3; final_candidate',
  0.999, 'NO_LLM', 'sms_gateway', 'carer_id=ca3e0009; rank=3; final_candidate=true',
  'CARER_REPLY_GRACE_MIN=15', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0012', 'SHA256_PLACEHOLDER_log-syn02-0011',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'James Sullivan notified — final candidate; 15-min grace period starts');

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0013', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 13, '2026-04-16T08:50:12Z', 30000,
  'log-syn02-0013', '2026-04-16T08:50:12.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'CARER_DECLINED', 'CARER_NOTIFIED', 'HITL_PENDING',
  'carer_declined; carer_id=ca3e0009; all_candidates_exhausted=true; re-escalate_to_hitl',
  0.999, 'NO_LLM', 'sms_gateway',
  'carer_id=ca3e0009; declined=true; shortlist_exhausted=true; re-escalating_for_VACANCY_UNRESOLVED_decision',
  'SHORTLIST_MAX_CANDIDATES=3',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0013', 'SHA256_PLACEHOLDER_log-syn02-0012',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'All 3 candidates declined — HITL re-escalation for terminal state decision');

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0014', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 14, '2026-04-16T08:50:14Z', 30000,
  'log-syn02-0014', '2026-04-16T08:50:14.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'HITL_REQUESTED', 'HITL_PENDING', 'HITL_PENDING',
  'escalate_to_hitl tier=1; all_carers_declined; await_coordinator_decision; sla_min=30',
  0.995, 'claude-haiku-4-5-20251001', 'matching_engine', NULL,
  'COORDINATOR_APPROVAL_SLA_MIN=30', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0014', 'SHA256_PLACEHOLDER_log-syn02-0013',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Second HITL request after all carers declined; 30-min SLA starts');

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0015', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 15, '2026-04-16T09:20:14Z', 30000,
  'log-syn02-0015', '2026-04-16T09:20:14.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'HITL_TIMEOUT', 'HITL_PENDING', 'HITL_PENDING',
  'primary_coordinator_sla_expired; hitl_response_ms=1800000; escalate_to_backup',
  0.999, 'NO_LLM', 'sla_timer', 'elapsed_ms=1800000; coordinator_id=c00rd001',
  'COORDINATOR_APPROVAL_SLA_MIN=30',
  'TIMEOUT', 1800000, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0015', 'SHA256_PLACEHOLDER_log-syn02-0014',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Primary coordinator (c00rd001) did not respond within 30 min');

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0016', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 16, '2026-04-16T09:20:15Z', 30000,
  'log-syn02-0016', '2026-04-16T09:20:15.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, 'c00rd002-0000-0000-0000-000000000002', 'CARE_COORDINATOR',
  'HITL_TIER_ESCALATED', 'HITL_PENDING', 'HITL_PENDING',
  'escalate_to_backup_coordinator; backup_id=c00rd002; sla_min=15',
  0.999, 'NO_LLM', 'sla_timer',
  'from_coordinator=c00rd001; to_coordinator=c00rd002; backup_sla_min=15',
  'BACKUP_COORDINATOR_SLA_MIN=15', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0016', 'SHA256_PLACEHOLDER_log-syn02-0015',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Escalated to backup coordinator (c00rd002); 15-min SLA starts');

INSERT INTO synthetic_expected_audit_events VALUES
('syn02-aud-0017', 'SYN-02', '1nc00002-5c4d-7e3f-0000-000000000002', 17, '2026-04-16T09:35:15Z', 30000,
  'log-syn02-0017', '2026-04-16T09:35:15.000Z', 'sess-syn02-inc0002', 'case-inc0002',
  'c1a30002-4a2d-8f3c-0000-000000000002', NULL, 'c00rd002-0000-0000-0000-000000000002', 'CARE_COORDINATOR',
  'HITL_DOUBLE_TIMEOUT', 'HITL_PENDING', 'VACANCY_UNRESOLVED',
  'backup_coordinator_sla_expired; HITL_DOUBLE_TIMEOUT logged; vacancy_unresolved_state_entered; alert_pm_lead; sonnet_analysis_run',
  0.999, 'claude-sonnet-4-6', 'sla_timer',
  'backup_coordinator_id=c00rd002; elapsed_ms=900000; all_carers_declined=true; no_human_response',
  'BACKUP_COORDINATOR_SLA_MIN=15; MODEL_L3=claude-sonnet-4-6; TOKEN_BUDGET_L3=3500',
  'TIMEOUT', 900000, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn02-0017', 'SHA256_PLACEHOLDER_log-syn02-0016',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
  'CRITICAL: HITL_DOUBLE_TIMEOUT — both coordinators unresponsive. VACANCY_UNRESOLVED is terminal. MUST use claude-sonnet-4-6. No auto-assignment. alert_pm_lead() fires. token_budget MUST NOT exceed 3500.');


-- ============================================================
-- SCENARIO SYN-03: KNOWN_CARERS_ONLY + empty visit history (Dorothy Kumar)
-- Case: case-inc0003 | Session: sess-syn03-inc0003
-- Expected terminal state: VACANCY_UNRESOLVED
-- Total events: 3
-- ============================================================

INSERT INTO synthetic_expected_audit_events VALUES
('syn03-aud-0001', 'SYN-03', '1nc00003-5c4d-7e3f-0000-000000000003', 1, '2026-04-17T12:00:00Z', 30000,
  'log-syn03-0001', '2026-04-17T12:00:00.000Z', 'sess-syn03-inc0003', 'case-inc0003',
  'c1a30003-4a2d-8f3c-0000-000000000003', NULL, NULL, 'SYSTEM',
  'VACANCY_DETECTED', 'NORMAL', 'VACANCY_DETECTED',
  'trigger_matching_engine; vacancy_id=inc0003',
  0.999, 'NO_LLM', 'alayacare_absence_api',
  'shift_date=2026-04-17; client_id=c1a30003',
  'VACANCY_UNRESOLVED_ALERT_THRESHOLD=0.10',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn03-0001', 'CHAIN_GENESIS_syn03',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn03-aud-0002', 'SYN-03', '1nc00003-5c4d-7e3f-0000-000000000003', 2, '2026-04-17T12:00:10Z', 30000,
  'log-syn03-0002', '2026-04-17T12:00:10.000Z', 'sess-syn03-inc0003', 'case-inc0003',
  'c1a30003-4a2d-8f3c-0000-000000000003', NULL, NULL, 'SYSTEM',
  'SHORTLIST_GENERATED', 'VACANCY_DETECTED', 'SHORTLIST_READY',
  'generate_shortlist; gate4_applied; shortlist_size=0; G-DS-05 guard triggered',
  0.999, 'claude-haiku-4-5-20251001', 'matching_engine',
  'P-3=KNOWN_CARERS_ONLY; P-7_visit_history=empty; candidates_before_gate4=3; candidates_after_gate4=0',
  'SCORING_WEIGHT_FAMILIARITY=0.60,SCORING_WEIGHT_PROXIMITY=0.40,IS-03:POSTCODE_CENTROID_FALLBACK',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn03-0002', 'SHA256_PLACEHOLDER_log-syn03-0001',
  FALSE, NULL, NULL, NULL, 'G-DS-05', FALSE,
  'P-3=KNOWN_CARERS_ONLY: no familiar carers in qualified pool (P-7_visit_history is empty). All 3 candidates removed by Gate 4.',
  TRUE, 'CRITICAL TEST: guard_id=G-DS-05, guard_passed=FALSE, guard_block_reason must reference KNOWN_CARERS_ONLY');

INSERT INTO synthetic_expected_audit_events VALUES
('syn03-aud-0003', 'SYN-03', '1nc00003-5c4d-7e3f-0000-000000000003', 3, '2026-04-17T12:00:11Z', 30000,
  'log-syn03-0003', '2026-04-17T12:00:11.000Z', 'sess-syn03-inc0003', 'case-inc0003',
  'c1a30003-4a2d-8f3c-0000-000000000003', NULL, NULL, 'SYSTEM',
  'VACANCY_UNRESOLVED', 'SHORTLIST_READY', 'VACANCY_UNRESOLVED',
  'vacancy_unresolved; reason=empty_shortlist_after_gate4; alert_pm_lead; no_carers_contacted',
  0.999, 'claude-sonnet-4-6', 'matching_engine',
  'shortlist_size=0; P-3=KNOWN_CARERS_ONLY; no_familiar_carers; no_hitl_required',
  'MODEL_L3=claude-sonnet-4-6; VACANCY_UNRESOLVED_ALERT_THRESHOLD=0.10',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn03-0003', 'SHA256_PLACEHOLDER_log-syn03-0002',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
  'CRITICAL: No CARER_NOTIFIED event must have occurred. No HITL_REQUESTED. VACANCY_UNRESOLVED fires directly from empty shortlist.');


-- ============================================================
-- SCENARIO SYN-04a: SPP decay baseline T=0 (Evelyn Nguyen)
-- Case: case-inc004a | Session: sess-syn04a-inc004a
-- Expected terminal state: RESOLVED (Michael Santos #1 due to familiarity)
-- Total events: 10
-- ============================================================

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0001', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 1, '2026-04-18T06:00:00Z', 30000,
  'log-syn4a-0001', '2026-04-18T06:00:00.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'VACANCY_DETECTED', 'NORMAL', 'VACANCY_DETECTED',
  'trigger_matching_engine; spp_snapshot=T0; P-10=0.55',
  0.999, 'NO_LLM', 'alayacare_absence_api', 'P-10=0.55; spp_available=true',
  'VACANCY_UNRESOLVED_ALERT_THRESHOLD=0.10', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0001', 'CHAIN_GENESIS_syn4a',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'SYN-04a baseline — SPP populated');

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0002', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 2, '2026-04-18T06:00:15Z', 30000,
  'log-syn4a-0002', '2026-04-18T06:00:15.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'SHORTLIST_GENERATED', 'VACANCY_DETECTED', 'SHORTLIST_READY',
  'generate_shortlist; shortlist[0]=ca3e0005; composite=0.622; familiarity_used=true',
  0.997, 'claude-haiku-4-5-20251001', 'matching_engine',
  'shortlist[0].carer_id=ca3e0005; shortlist[0].composite_score=0.622; familiarity_score=0.40; spp_cold_start=false',
  'SCORING_WEIGHT_FAMILIARITY=0.60,SCORING_WEIGHT_PROXIMITY=0.40,IS-03:POSTCODE_CENTROID_FALLBACK',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0002', 'SHA256_PLACEHOLDER_log-syn4a-0001',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Michael Santos #1 with familiarity boost (2 visits, score=0.622)');

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0003', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 3, '2026-04-18T06:00:16Z', 30000,
  'log-syn4a-0003', '2026-04-18T06:00:16.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'HITL_REQUESTED', 'SHORTLIST_READY', 'HITL_PENDING',
  'escalate_to_hitl; coordinator_id=c00rd001; sla_min=30',
  0.995, 'claude-haiku-4-5-20251001', 'matching_engine', NULL,
  'COORDINATOR_APPROVAL_SLA_MIN=30', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0003', 'SHA256_PLACEHOLDER_log-syn4a-0002',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0004', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 4, '2026-04-18T06:08:00Z', 30000,
  'log-syn4a-0004', '2026-04-18T06:08:00.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', 'c00rd001-0000-0000-0000-000000000001', 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'COORDINATOR_APPROVED', 'HITL_PENDING', 'COORDINATOR_APPROVED',
  'coordinator_approved; selected_carer=ca3e0005; hitl_response_ms=464000',
  0.999, 'NO_LLM', 'coordinator_dashboard', 'approved=ca3e0005',
  'COORDINATOR_APPROVAL_SLA_MIN=30', 'CONFIRM_ASSIGNMENT', 464000, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0004', 'SHA256_PLACEHOLDER_log-syn4a-0003',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0005', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 5, '2026-04-18T06:08:02Z', 5000,
  'log-syn4a-0005', '2026-04-18T06:08:02.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'CC8_FIELD_STRIPPED', 'COORDINATOR_APPROVED', 'COORDINATOR_APPROVED',
  'compliance_guard CC-8: strip PHI before carer SMS',
  0.999, 'NO_LLM', 'compliance_guard', 'carer_id=ca3e0005',
  'CC-8:PHI_FIELDS_STRIPPED_BEFORE_CARER_SMS', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0005', 'SHA256_PLACEHOLDER_log-syn4a-0004',
  FALSE, NULL, NULL, NULL, 'CC-8', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0006', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 6, '2026-04-18T06:08:05Z', 30000,
  'log-syn4a-0006', '2026-04-18T06:08:05.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'CARER_NOTIFIED', 'COORDINATOR_APPROVED', 'CARER_NOTIFIED',
  'send_sms ACT-C-01; carer_id=ca3e0005',
  0.999, 'NO_LLM', 'sms_gateway', 'carer_id=ca3e0005; template=ACT-C-01',
  'CARER_REPLY_GRACE_MIN=15', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0006', 'SHA256_PLACEHOLDER_log-syn4a-0005',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0007', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 7, '2026-04-18T06:15:00Z', 60000,
  'log-syn4a-0007', '2026-04-18T06:15:00.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'BRIEFING_SENT', 'CARER_NOTIFIED', 'BRIEFING_SENT',
  'send_briefing ACT-C-02; mode=STANDARD; CC-6 applied',
  0.999, 'NO_LLM', 'briefing_assembly', 'template=ACT-C-02; mode=STANDARD; cc6_guard=APPLIED',
  'CC-6:NO_MATCH_EXPLANATION_IN_BRIEFING', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0007', 'SHA256_PLACEHOLDER_log-syn4a-0006',
  FALSE, NULL, NULL, NULL, 'CC-6', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0008', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 8, '2026-04-18T06:15:30Z', 30000,
  'log-syn4a-0008', '2026-04-18T06:15:30.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'CLIENT_NOTIFIED', 'BRIEFING_SENT', 'CLIENT_NOTIFIED',
  'send_sms ACT-P-01; E-3 Gate 2 prerequisite set',
  0.999, 'NO_LLM', 'sms_gateway', 'template=ACT-P-01; client_notified=true',
  'G-E3-1:E3_GATE2_CLIENT_NOTIFIED_REQUIRED', NULL, NULL, NULL, 'Treatment', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0008', 'SHA256_PLACEHOLDER_log-syn4a-0007',
  FALSE, NULL, NULL, NULL, 'G-E3-1', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0009', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 9, '2026-04-18T06:15:45Z', 30000,
  'log-syn4a-0009', '2026-04-18T06:15:45.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'FAMILY_NOTIFIED', 'CLIENT_NOTIFIED', 'FAMILY_NOTIFIED',
  'send_sms ACT-F-01; E-3 Gate 2 passed',
  0.999, 'NO_LLM', 'sms_gateway', 'template=ACT-F-01; e3_gate2_passed=true',
  'G-E3-1:E3_GATE2_CLIENT_NOTIFIED_REQUIRED', NULL, NULL, NULL, 'Treatment', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0009', 'SHA256_PLACEHOLDER_log-syn4a-0008',
  FALSE, NULL, NULL, NULL, 'G-E3-1', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4a-aud-0010', 'SYN-04a', '1nc0004a-5c4d-7e3f-0000-00000000004a', 10, '2026-04-18T06:16:00Z', 30000,
  'log-syn4a-0010', '2026-04-18T06:16:00.000Z', 'sess-syn04a-inc004a', 'case-inc004a',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'INCIDENT_RESOLVED', 'FAMILY_NOTIFIED', 'RESOLVED',
  'incident_closed; spp_snapshot=T0; familiarity_scoring_used=true',
  0.999, 'NO_LLM', 'matching_engine', 'fill_time_min=16; resolution=CARER_ACCEPTED',
  'OKR-1:FILL_TIME_TARGET_MIN=5', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4a-0010', 'SHA256_PLACEHOLDER_log-syn4a-0009',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'SYN-04a RESOLVED — baseline for comparison with SYN-04b ranking change');


-- ============================================================
-- SCENARIO SYN-04b: SPP decay T+30 (Evelyn Nguyen — same client)
-- Case: case-inc004b | Session: sess-syn04b-inc004b
-- Expected terminal state: RESOLVED (Emma Davies now #1 — RANKING CHANGE)
-- Total events: 11
-- ============================================================

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0001', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 1, '2026-05-18T06:00:00Z', 30000,
  'log-syn4b-0001', '2026-05-18T06:00:00.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'VACANCY_DETECTED', 'NORMAL', 'VACANCY_DETECTED',
  'trigger_matching_engine; spp_snapshot=T30; P-10=0.0',
  0.999, 'NO_LLM', 'alayacare_absence_api', 'P-10=0.0; spp_decayed=true',
  'VACANCY_UNRESOLVED_ALERT_THRESHOLD=0.10', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0001', 'CHAIN_GENESIS_syn4b',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'SYN-04b — same client, 30 days later, SPP decayed');

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0002', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 2, '2026-05-18T06:00:05Z', 15000,
  'log-syn4b-0002', '2026-05-18T06:00:05.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'SPP_COLD_START', 'VACANCY_DETECTED', 'VACANCY_DETECTED',
  'spp_cold_start_detected; P-10=0.0; set_proximity_only_mode; set_briefing_mode=STANDARD; trigger=SPP_DECAY',
  0.999, 'claude-haiku-4-5-20251001', 'spp_validation_check',
  'P-10=0.0; spp_decay=true; all_spp_fields=null; proximity_only_mode=ACTIVATED',
  'SPP_COMPLETENESS_THRESHOLD=0.0',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0002', 'SHA256_PLACEHOLDER_log-syn4b-0001',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
  'CRITICAL: SPP_COLD_START fires due to decay (not new client). familiarity_score forced=0.0 for all candidates. Coordinator card must NOT show visit count.');

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0003', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 3, '2026-05-18T06:00:20Z', 30000,
  'log-syn4b-0003', '2026-05-18T06:00:20.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'SHORTLIST_GENERATED', 'VACANCY_DETECTED', 'SHORTLIST_READY',
  'generate_shortlist; scoring_mode=PROXIMITY_ONLY; shortlist[0]=ca3e0006; composite=0.395',
  0.997, 'claude-haiku-4-5-20251001', 'matching_engine',
  'shortlist[0].carer_id=ca3e0006; composite=0.395; all_familiarity_scores=0.0; RANKING_CHANGED_vs_T0=true',
  'SCORING_WEIGHT_FAMILIARITY=0.60,SCORING_WEIGHT_PROXIMITY=0.40,IS-03:POSTCODE_CENTROID_FALLBACK',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0003', 'SHA256_PLACEHOLDER_log-syn4b-0002',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
  'CRITICAL ASSERTION: Emma Davies (ca3e0006) now #1, NOT Michael Santos — ranking change from SYN-04a due to SPP decay');

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0004', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 4, '2026-05-18T06:00:21Z', 30000,
  'log-syn4b-0004', '2026-05-18T06:00:21.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'HITL_REQUESTED', 'SHORTLIST_READY', 'HITL_PENDING',
  'escalate_to_hitl; coordinator card shows SPP unavailable — proximity only',
  0.995, 'claude-haiku-4-5-20251001', 'matching_engine', 'spp_cold_start=true; proximity_only_mode=true',
  'COORDINATOR_APPROVAL_SLA_MIN=30', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0004', 'SHA256_PLACEHOLDER_log-syn4b-0003',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Coordinator card must NOT show visit counts or familiarity labels');

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0005', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 5, '2026-05-18T06:09:00Z', 30000,
  'log-syn4b-0005', '2026-05-18T06:09:00.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', 'c00rd001-0000-0000-0000-000000000001', 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'COORDINATOR_APPROVED', 'HITL_PENDING', 'COORDINATOR_APPROVED',
  'coordinator_approved; selected_carer=ca3e0006',
  0.999, 'NO_LLM', 'coordinator_dashboard', 'approved=ca3e0006',
  'COORDINATOR_APPROVAL_SLA_MIN=30', 'CONFIRM_ASSIGNMENT', 519000, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0005', 'SHA256_PLACEHOLDER_log-syn4b-0004',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0006', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 6, '2026-05-18T06:09:02Z', 5000,
  'log-syn4b-0006', '2026-05-18T06:09:02.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'CC8_FIELD_STRIPPED', 'COORDINATOR_APPROVED', 'COORDINATOR_APPROVED',
  'compliance_guard CC-8: strip PHI; carer_id=ca3e0006',
  0.999, 'NO_LLM', 'compliance_guard', 'carer_id=ca3e0006',
  'CC-8:PHI_FIELDS_STRIPPED_BEFORE_CARER_SMS', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0006', 'SHA256_PLACEHOLDER_log-syn4b-0005',
  FALSE, NULL, NULL, NULL, 'CC-8', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0007', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 7, '2026-05-18T06:09:05Z', 30000,
  'log-syn4b-0007', '2026-05-18T06:09:05.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'CARER_NOTIFIED', 'COORDINATOR_APPROVED', 'CARER_NOTIFIED',
  'send_sms ACT-C-01; carer_id=ca3e0006',
  0.999, 'NO_LLM', 'sms_gateway', 'carer_id=ca3e0006; template=ACT-C-01',
  'CARER_REPLY_GRACE_MIN=15', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0007', 'SHA256_PLACEHOLDER_log-syn4b-0006',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0008', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 8, '2026-05-18T06:16:00Z', 60000,
  'log-syn4b-0008', '2026-05-18T06:16:00.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'BRIEFING_SENT', 'CARER_NOTIFIED', 'BRIEFING_SENT',
  'send_briefing ACT-C-02; mode=STANDARD; CC-6 applied',
  0.999, 'NO_LLM', 'briefing_assembly', 'mode=STANDARD; cc6_guard=APPLIED',
  'CC-6:NO_MATCH_EXPLANATION_IN_BRIEFING', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0008', 'SHA256_PLACEHOLDER_log-syn4b-0007',
  FALSE, NULL, NULL, NULL, 'CC-6', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0009', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 9, '2026-05-18T06:16:30Z', 30000,
  'log-syn4b-0009', '2026-05-18T06:16:30.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'CLIENT_NOTIFIED', 'BRIEFING_SENT', 'CLIENT_NOTIFIED',
  'send_sms ACT-P-01; E-3 Gate 2 prereq set',
  0.999, 'NO_LLM', 'sms_gateway', 'template=ACT-P-01; client_notified=true',
  'G-E3-1:E3_GATE2_CLIENT_NOTIFIED_REQUIRED', NULL, NULL, NULL, 'Treatment', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0009', 'SHA256_PLACEHOLDER_log-syn4b-0008',
  FALSE, NULL, NULL, NULL, 'G-E3-1', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0010', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 10, '2026-05-18T06:16:45Z', 30000,
  'log-syn4b-0010', '2026-05-18T06:16:45.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'FAMILY_NOTIFIED', 'CLIENT_NOTIFIED', 'FAMILY_NOTIFIED',
  'send_sms ACT-F-01; E-3 Gate 2 passed',
  0.999, 'NO_LLM', 'sms_gateway', 'template=ACT-F-01; e3_gate2_passed=true',
  'G-E3-1:E3_GATE2_CLIENT_NOTIFIED_REQUIRED', NULL, NULL, NULL, 'Treatment', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0010', 'SHA256_PLACEHOLDER_log-syn4b-0009',
  FALSE, NULL, NULL, NULL, 'G-E3-1', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn4b-aud-0011', 'SYN-04b', '1nc0004b-5c4d-7e3f-0000-00000000004b', 11, '2026-05-18T06:17:00Z', 30000,
  'log-syn4b-0011', '2026-05-18T06:17:00.000Z', 'sess-syn04b-inc004b', 'case-inc004b',
  'c1a30004-4a2d-8f3c-0000-000000000004', NULL, NULL, 'SYSTEM',
  'INCIDENT_RESOLVED', 'FAMILY_NOTIFIED', 'RESOLVED',
  'incident_closed; spp_cold_start_was_active=true; ranking_changed_from_T0=true',
  0.999, 'NO_LLM', 'matching_engine', 'fill_time_min=17; spp_decay_scenario_passed',
  'OKR-1:FILL_TIME_TARGET_MIN=5', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn4b-0011', 'SHA256_PLACEHOLDER_log-syn4b-0010',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'SYN-04b RESOLVED — SPP decay scenario complete; Emma Davies was #1 (not Michael)');


-- ============================================================
-- SCENARIO SYN-05: New client EC-04 path, MINIMAL briefing (Jean Morrison)
-- Case: case-inc0005 | Session: sess-syn05-inc0005
-- Expected terminal state: RESOLVED (Anna Fitzgerald #1, briefing_mode=MINIMAL)
-- Total events: 11
-- ============================================================

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0001', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 1, '2026-04-19T08:00:00Z', 30000,
  'log-syn05-0001', '2026-04-19T08:00:00.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, NULL, 'SYSTEM',
  'VACANCY_DETECTED', 'NORMAL', 'VACANCY_DETECTED',
  'trigger_matching_engine; new_client=true; P-10=0.0',
  0.999, 'NO_LLM', 'alayacare_absence_api', 'P-10=0.0; new_client=true',
  'VACANCY_UNRESOLVED_ALERT_THRESHOLD=0.10', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0001', 'CHAIN_GENESIS_syn05',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'New client — Jean Morrison, first service engagement');

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0002', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 2, '2026-04-19T08:00:05Z', 15000,
  'log-syn05-0002', '2026-04-19T08:00:05.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, NULL, 'SYSTEM',
  'SPP_COLD_START', 'VACANCY_DETECTED', 'VACANCY_DETECTED',
  'spp_cold_start_detected; P-10=0.0; new_client=true; set_briefing_mode=MINIMAL; set_spp_invitation=true',
  0.999, 'claude-haiku-4-5-20251001', 'spp_validation_check',
  'P-10=0.0; new_client=true; ec04_path=ACTIVATED; briefing_mode=MINIMAL; spp_invitation_link_generated=true',
  'SPP_COMPLETENESS_THRESHOLD=0.0',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0002', 'SHA256_PLACEHOLDER_log-syn05-0001',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
  'CRITICAL: EC-04 path activated (new client). DISTINCT from EC-02 (all carers decline). briefing_mode=MINIMAL. spp_invitation_url must appear on coordinator card.');

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0003', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 3, '2026-04-19T08:00:20Z', 30000,
  'log-syn05-0003', '2026-04-19T08:00:20.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, NULL, 'SYSTEM',
  'SHORTLIST_GENERATED', 'VACANCY_DETECTED', 'SHORTLIST_READY',
  'generate_shortlist; scoring_mode=PROXIMITY_ONLY; briefing_mode=MINIMAL; shortlist[0]=ca3e0008; composite=0.392',
  0.997, 'claude-haiku-4-5-20251001', 'matching_engine',
  'shortlist[0].carer_id=ca3e0008; composite=0.392; briefing_mode=MINIMAL; all_familiarity_scores=0.0',
  'SCORING_WEIGHT_FAMILIARITY=0.60,SCORING_WEIGHT_PROXIMITY=0.40,IS-03:POSTCODE_CENTROID_FALLBACK',
  NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0003', 'SHA256_PLACEHOLDER_log-syn05-0002',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'Anna Fitzgerald #1 by proximity (0.50km, score=0.392)');

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0004', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 4, '2026-04-19T08:00:21Z', 30000,
  'log-syn05-0004', '2026-04-19T08:00:21.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'HITL_REQUESTED', 'SHORTLIST_READY', 'HITL_PENDING',
  'escalate_to_hitl; coordinator card includes spp_invitation_url and Add preferences prompt',
  0.995, 'claude-haiku-4-5-20251001', 'matching_engine',
  'new_client=true; spp_invitation_url_in_card=true; add_preferences_prompt=true',
  'COORDINATOR_APPROVAL_SLA_MIN=30', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0004', 'SHA256_PLACEHOLDER_log-syn05-0003',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
  'CRITICAL: Coordinator card MUST contain spp_invitation_url field AND "Add preferences" text');

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0005', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 5, '2026-04-19T08:10:00Z', 30000,
  'log-syn05-0005', '2026-04-19T08:10:00.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', 'c00rd001-0000-0000-0000-000000000001', 'c00rd001-0000-0000-0000-000000000001', 'CARE_COORDINATOR',
  'COORDINATOR_APPROVED', 'HITL_PENDING', 'COORDINATOR_APPROVED',
  'coordinator_approved; selected_carer=ca3e0008',
  0.999, 'NO_LLM', 'coordinator_dashboard', 'approved=ca3e0008',
  'COORDINATOR_APPROVAL_SLA_MIN=30', 'CONFIRM_ASSIGNMENT', 579000, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0005', 'SHA256_PLACEHOLDER_log-syn05-0004',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0006', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 6, '2026-04-19T08:10:02Z', 5000,
  'log-syn05-0006', '2026-04-19T08:10:02.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, NULL, 'SYSTEM',
  'CC8_FIELD_STRIPPED', 'COORDINATOR_APPROVED', 'COORDINATOR_APPROVED',
  'compliance_guard CC-8: strip PHI; carer_id=ca3e0008',
  0.999, 'NO_LLM', 'compliance_guard', 'carer_id=ca3e0008',
  'CC-8:PHI_FIELDS_STRIPPED_BEFORE_CARER_SMS', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0006', 'SHA256_PLACEHOLDER_log-syn05-0005',
  FALSE, NULL, NULL, NULL, 'CC-8', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0007', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 7, '2026-04-19T08:10:05Z', 30000,
  'log-syn05-0007', '2026-04-19T08:10:05.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, NULL, 'SYSTEM',
  'CARER_NOTIFIED', 'COORDINATOR_APPROVED', 'CARER_NOTIFIED',
  'send_sms ACT-C-01; carer_id=ca3e0008',
  0.999, 'NO_LLM', 'sms_gateway', 'carer_id=ca3e0008; template=ACT-C-01',
  'CARER_REPLY_GRACE_MIN=15', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0007', 'SHA256_PLACEHOLDER_log-syn05-0006',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0008', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 8, '2026-04-19T08:17:00Z', 60000,
  'log-syn05-0008', '2026-04-19T08:17:00.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, NULL, 'SYSTEM',
  'BRIEFING_SENT', 'CARER_NOTIFIED', 'BRIEFING_SENT',
  'send_briefing ACT-C-02 Variant A; mode=MINIMAL; CC-6 applied; no_client_history',
  0.999, 'NO_LLM', 'briefing_assembly',
  'template=ACT-C-02; variant=A; mode=MINIMAL; cc6_guard=APPLIED; new_client_no_history=true',
  'CC-6:NO_MATCH_EXPLANATION_IN_BRIEFING', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0008', 'SHA256_PLACEHOLDER_log-syn05-0007',
  FALSE, NULL, NULL, NULL, 'CC-6', TRUE, NULL, TRUE,
  'CRITICAL: trigger_value must contain "MINIMAL". Briefing uses ACT-C-02 Variant A (minimal). No client history included.');

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0009', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 9, '2026-04-19T08:17:30Z', 30000,
  'log-syn05-0009', '2026-04-19T08:17:30.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, NULL, 'SYSTEM',
  'CLIENT_NOTIFIED', 'BRIEFING_SENT', 'CLIENT_NOTIFIED',
  'send_sms ACT-P-01; E-3 Gate 2 prerequisite set; new_client_first_notification',
  0.999, 'NO_LLM', 'sms_gateway', 'template=ACT-P-01; client_notified=true; new_client=true',
  'G-E3-1:E3_GATE2_CLIENT_NOTIFIED_REQUIRED', NULL, NULL, NULL, 'Treatment', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0009', 'SHA256_PLACEHOLDER_log-syn05-0008',
  FALSE, NULL, NULL, NULL, 'G-E3-1', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0010', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 10, '2026-04-19T08:17:45Z', 30000,
  'log-syn05-0010', '2026-04-19T08:17:45.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, NULL, 'SYSTEM',
  'FAMILY_NOTIFIED', 'CLIENT_NOTIFIED', 'FAMILY_NOTIFIED',
  'send_sms ACT-F-01; E-3 Gate 2 passed; family=Carol Morrison-Blake',
  0.999, 'NO_LLM', 'sms_gateway', 'template=ACT-F-01; e3_gate2_passed=true',
  'G-E3-1:E3_GATE2_CLIENT_NOTIFIED_REQUIRED', NULL, NULL, NULL, 'Treatment', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0010', 'SHA256_PLACEHOLDER_log-syn05-0009',
  FALSE, NULL, NULL, NULL, 'G-E3-1', TRUE, NULL, TRUE, NULL);

INSERT INTO synthetic_expected_audit_events VALUES
('syn05-aud-0011', 'SYN-05', '1nc00005-5c4d-7e3f-0000-000000000005', 11, '2026-04-19T08:18:00Z', 30000,
  'log-syn05-0011', '2026-04-19T08:18:00.000Z', 'sess-syn05-inc0005', 'case-inc0005',
  'c1a30005-4a2d-8f3c-0000-000000000005', NULL, NULL, 'SYSTEM',
  'INCIDENT_RESOLVED', 'FAMILY_NOTIFIED', 'RESOLVED',
  'incident_closed; new_client_ec04_path=true; briefing_mode=MINIMAL; spp_invitation_triggered=true',
  0.999, 'NO_LLM', 'matching_engine', 'fill_time_min=18; ec04_path=complete',
  'OKR-1:FILL_TIME_TARGET_MIN=5', NULL, NULL, NULL, 'Operations', 'OPERATIONAL',
  'SHA256_PLACEHOLDER_log-syn05-0011', 'SHA256_PLACEHOLDER_log-syn05-0010',
  FALSE, NULL, NULL, NULL, NULL, NULL, NULL, TRUE, 'SYN-05 RESOLVED — new client EC-04 path complete with MINIMAL briefing');


-- =============================================================================
-- VALIDATION QUERY: SD-01B compliance check — compute detection accuracy
-- Run this after ECC populates synthetic_detected_audit_events
-- =============================================================================

SELECT
  e.scenario_id,
  COUNT(e.audit_id)                                                   AS total_expected_events,
  COUNT(d.detected_id)                                                AS total_detected,
  ROUND(COUNT(d.detected_id)::DECIMAL / COUNT(e.audit_id) * 100, 1) AS detection_rate_pct,
  COUNT(CASE WHEN d.sequence_matched IS NOT NULL THEN 1 END)         AS sequence_correct,
  COUNT(CASE WHEN d.guard_id_correct = TRUE THEN 1 END)              AS guard_id_correct,
  COUNT(CASE WHEN d.guard_passed_correct = TRUE THEN 1 END)          AS guard_passed_correct,
  COUNT(CASE WHEN d.hash_chain_valid = TRUE THEN 1 END)              AS hash_chain_valid,
  COUNT(CASE WHEN d.model_id_correct = TRUE THEN 1 END)              AS model_id_correct,
  COUNT(CASE WHEN d.non_nullable_complete = FALSE THEN 1 END)        AS missing_non_nullable_fields,
  COUNT(CASE WHEN d.phi_in_plaintext = TRUE THEN 1 END)              AS phi_violations_CRITICAL,
  COUNT(CASE WHEN d.false_positive = TRUE THEN 1 END)                AS false_positives
FROM synthetic_expected_audit_events e
LEFT JOIN synthetic_detected_audit_events d ON e.audit_id = d.expected_audit_id
GROUP BY e.scenario_id
ORDER BY e.scenario_id;

-- =============================================================================
-- MERGE GATE QUERY: SD-01B — Must return 0 rows to pass
-- Any row returned = CRITICAL finding that blocks merge
-- =============================================================================

SELECT
  d.detected_id,
  e.scenario_id,
  e.event_type,
  e.sequence_order,
  CASE WHEN d.non_nullable_complete = FALSE THEN 'MISSING_NON_NULLABLE_FIELDS' END AS defect_type
FROM synthetic_expected_audit_events e
JOIN synthetic_detected_audit_events d ON e.audit_id = d.expected_audit_id
WHERE
  d.non_nullable_complete = FALSE
  OR d.phi_in_plaintext = TRUE
  OR d.hash_chain_valid = FALSE
  OR (e.event_type = 'HITL_DOUBLE_TIMEOUT' AND d.model_id_correct = FALSE)
  OR (e.event_type IN ('CC8_FIELD_STRIPPED', 'SHORTLIST_GENERATED') AND d.guard_id_correct = FALSE)
ORDER BY e.scenario_id, e.sequence_order;

-- Verdict: If merge gate query returns 0 rows → SD-01B PASS → eligible for production deploy
-- Verdict: If merge gate query returns any rows → SD-01B FAIL → Agent Fix Queue required

-- =============================================================================
-- GAP RESOLUTION AMENDMENTS (Amendment 3-B)
-- =============================================================================

-- MERGE GATE EXTENSION: IS-03 postcode fallback guard
-- Fires if SHORTLIST_GENERATED was logged without IS-03 in threshold_applied
-- (indicates system attempted Maps API call with SC07 blocked — data sovereignty violation)

SELECT
  d.detected_id,
  e.scenario_id,
  e.event_type,
  e.sequence_order,
  'IS03_MAPS_API_CALLED_WITHOUT_APP8_BASIS' AS defect_type,
  'CRITICAL' AS severity
FROM synthetic_expected_audit_events e
JOIN synthetic_detected_audit_events d ON e.audit_id = d.expected_audit_id
WHERE
  e.event_type = 'SHORTLIST_GENERATED'
  AND d.notes NOT LIKE '%IS-03:POSTCODE_CENTROID_FALLBACK%';
-- Note: grader checks actual detected entry threshold_applied field, not d.notes
-- d.notes used here as proxy — production grader queries the actual APPAuditLogEntry table

-- AX-02 TRIGGER SOURCE FALSE PASS GUARD
-- Fires if trigger_sensor does not match the confirmed AX-02 integration state
-- This query requires AX02_STATUS to be set as a session variable or parameter before running

SELECT
  d.detected_id,
  e.scenario_id,
  e.event_type,
  e.sequence_order,
  'AX02_TRIGGER_SOURCE_MISMATCH_FALSE_PASS' AS defect_type,
  'CRITICAL' AS severity,
  'Test ran against incorrect AX-02 integration state — result is invalid' AS notes
FROM synthetic_expected_audit_events e
JOIN synthetic_detected_audit_events d ON e.audit_id = d.expected_audit_id
WHERE
  e.event_type = 'VACANCY_DETECTED'
  AND (
    -- If AX-02 confirmed: trigger must be alayacare_absence_api
    -- If AX-02 unavailable: trigger must be MANUAL_COORDINATOR_ENTRY
    -- Detected mismatch = false pass
    d.notes LIKE '%trigger_sensor_mismatch%'
  );
-- Note: production grader substitutes correct expected trigger_sensor per AX02_STATUS env var
-- and compares against the actual APPAuditLogEntry.trigger_sensor field

-- SMS COPY APPROVAL ADVISORY CHECK (non-blocking — does not prevent merge)
-- Reports which SMS body assertions are advisory-only pending B1-B sign-off
SELECT
  e.scenario_id,
  e.event_type,
  e.sequence_order,
  'SMS_BODY_ADVISORY_PENDING_B1B' AS advisory_type,
  'ADVISORY — does not block merge; resolve before go-live' AS severity
FROM synthetic_expected_audit_events e
WHERE
  e.event_type IN ('CARER_NOTIFIED', 'CLIENT_NOTIFIED', 'FAMILY_NOTIFIED', 'BRIEFING_SENT')
ORDER BY e.scenario_id, e.sequence_order;

-- =============================================================================
-- SCENARIO COVERAGE SUMMARY
-- =============================================================================
-- SYN-01: 10 events — happy path, familiarity ranking, G-DS-05, CC-8, E-3 Gate 2
-- SYN-02: 17 events — 3 carers decline, HITL double timeout, VACANCY_UNRESOLVED, Sonnet
-- SYN-03:  3 events — KNOWN_CARERS_ONLY + empty P-7, Gate 4 empties shortlist, G-DS-05 block
-- SYN-04a: 10 events — SPP T=0 baseline, Michael Santos #1 (familiarity)
-- SYN-04b: 11 events — SPP decay T+30, SPP_COLD_START, Emma Davies now #1 (ranking change)
-- SYN-05: 11 events — new client EC-04, SPP_COLD_START, MINIMAL briefing, spp_invitation_url
-- TOTAL:  62 expected audit events
-- =============================================================================

```
