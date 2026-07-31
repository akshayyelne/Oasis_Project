# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Execution/Artifact_25_Synthetic_PHI_Generator.md
# Generated: 2026-07-31T00:49:45.162Z

**Pipeline Stage:** Execution Plugin — Stage C (Validation Environment)
**Skill:** `synthetic-phi-generator`
**Date:** 2026-03-28
**Input:** Artifact 23 (Agentic Logic Spec) § 3 Threshold Constants + §8 Canonical Event Registry + §9 Integration Test Scenarios
**Outputs:** `clients.json`, `incidents.json`, `expected_audit.sql`
**Instruction to ECC:** "Build this feature so it passes the tests in `incidents.json`, including the SPP decay scenarios (SYN-04). All 62 ground truth events in `expected_audit.sql` must be produced with correct structure. The SD-01B merge gate query must return 0 rows."



All data in these files is entirely fictitious. No real client, carer, or agency data was used or referenced. All identifiers are deterministic UUIDs chosen for test reproducibility, not randomly generated. Data is statistically plausible for Australian home care operations but non-attributable.

**Regulatory frame:** Australian Privacy Act 1988 (APP). HIPAA architecture applied as design floor only. Cross-border disclosure (APP 8): `WHATSAPP_APP8_CONFIRMED=false` and `SC07_GOOGLE_MAPS_APPROVED=false` — both features remain blocked until legal confirmation.

**P-9 absence:** The P-9 SPP field (disability/medical condition detail) is explicitly absent from all records per AX-01 pre-sprint gate. It must not appear in any schema, audit log, or matching logic.



| File | Analogous to (Skill Template) | Purpose |
|------|-------------------------------|---------|
| `synthetic-data/clients.json` | `patients.json` | 5 fictitious client SPP profiles + 9 carer roster records |
| `synthetic-data/incidents.json` | `sensors.json` | 6 vacancy incident scenario traces with expected state transitions |
| `synthetic-data/expected_audit.sql` | `alerts.sql` | Ground truth APPAuditLogEntry events (62 total) + SD-01B merge gate query |



| Scenario | Client | Event Type | Injection Window | Expected Terminal State | Key Assertion | Detection SLA |
|----------|--------|-----------|-----------------|------------------------|---------------|---------------|
| **SYN-01** | Margaret Chen (cli-0001) | Familiarity ranking — happy path | 2026-04-15 07:30 | RESOLVED | David Okafor rank 1; composite=0.726; phrasing='who has visited you before' | 30 sec |
| **SYN-02** | Patricia Williams (cli-0002) | All 3 carers decline + HITL double timeout | 2026-04-16 08:00 | VACANCY_UNRESOLVED | 3× CARER_DECLINED; Sonnet invoked; no auto-assign; alert_pm_lead | 30 sec |
| **SYN-03** | Dorothy Kumar (cli-0003) | KNOWN_CARERS_ONLY + empty P-7 → empty shortlist | 2026-04-17 12:00 | VACANCY_UNRESOLVED | shortlist_size=0; G-DS-05 guard_passed=false; no carer contacted | 30 sec |
| **SYN-04a** | Evelyn Nguyen (cli-0004) | SPP T=0 baseline — familiarity active | 2026-04-18 06:00 | RESOLVED | Michael Santos rank 1; composite=0.622; no SPP_COLD_START event | 30 sec |
| **SYN-04b** | Evelyn Nguyen (cli-0004) | SPP decay T+30 → proximity-only | 2026-05-18 06:00 | RESOLVED | SPP_COLD_START fires; Emma Davies now rank 1; ranking change confirmed | 30 sec |
| **SYN-05** | Jean Morrison (cli-0005) | New client EC-04 → MINIMAL briefing | 2026-04-19 08:00 | RESOLVED | SPP_COLD_START; briefing_mode=MINIMAL; spp_invitation_url on card | 30 sec |



All composite scores use constants from Artifact 23 §3:
- `SCORING_WEIGHT_FAMILIARITY = 0.60`
- `SCORING_WEIGHT_PROXIMITY = 0.40`
- `PROXIMITY_MAX_KM = 25`
- `familiarity_score = min(visit_count × 0.20, 0.60)`
- `proximity_score = 1 − (distance_km / PROXIMITY_MAX_KM)`
- `composite_score = (familiarity_score × 0.60) + (proximity_score × 0.40)`

| Scenario | Carer | Distance | Familiarity | Proximity | Composite | Rank |
|----------|-------|----------|-------------|-----------|-----------|------|
| SYN-01 | David Okafor | 2.11 km | 0.60 (3 visits) | 0.916 | **0.726** | #1 |
| SYN-01 | Thomas Patel | 2.56 km | 0.00 | 0.898 | 0.359 | #2 |
| SYN-01 | Sarah Brennan | 3.56 km | 0.00 | 0.858 | 0.343 | #3 |
| SYN-02 | Robert Kim | 2.22 km | 0.00 | 0.911 | 0.364 | #1 |
| SYN-02 | Lisa Wong | 2.53 km | 0.00 | 0.899 | 0.360 | #2 |
| SYN-02 | James Sullivan | 2.71 km | 0.00 | 0.892 | 0.357 | #3 |
| SYN-04a | Michael Santos | 1.13 km | 0.40 (2 visits) | 0.955 | **0.622** | #1 |
| SYN-04a | Emma Davies | 0.33 km | 0.00 | 0.987 | 0.395 | #2 |
| SYN-04a | Anna Fitzgerald | 1.94 km | 0.00 | 0.922 | 0.369 | #3 |
| SYN-04b | Emma Davies | 0.33 km | **0.00** (SPP null) | 0.987 | **0.395** | **#1** ← ranking change |
| SYN-04b | Michael Santos | 1.13 km | **0.00** (SPP null) | 0.955 | 0.382 | **#2** ← demoted |
| SYN-04b | Anna Fitzgerald | 1.94 km | 0.00 | 0.922 | 0.369 | #3 |
| SYN-05 | Anna Fitzgerald | 0.50 km | 0.00 | 0.980 | 0.392 | #1 |
| SYN-05 | Emma Davies | 2.41 km | 0.00 | 0.904 | 0.362 | #2 |
| SYN-05 | Michael Santos | 3.28 km | 0.00 | 0.869 | 0.348 | #3 |

**SYN-04 ranking change is the primary SPP decay test:** Michael Santos has a genuine visit history (`P-7={ca3e0005: 2}`) but when `P-10=0.0` his familiarity advantage is suppressed. Emma Davies, who is 0.33 km from Evelyn, takes the top spot purely on proximity.



Every scenario exercises one or more compliance guards. ECC must log these guards correctly:

| Guard ID | Event Type Logged | Scenario(s) | guard_passed | Critical Assertion |
|----------|-------------------|-------------|-------------|-------------------|
| `CC-8` | `CC8_FIELD_STRIPPED` | All (every CARER_NOTIFIED preceded by this) | TRUE | PHI fields stripped from SMS body before send |
| `CC-6` | `BRIEFING_SENT` | All (briefing events) | TRUE | No match explanation in briefing content |
| `G-DS-05` | `SHORTLIST_GENERATED` | SYN-01 (pass), SYN-03 (block) | TRUE / FALSE | SYN-01: familiarity phrasing applied. SYN-03: guard_passed=FALSE, block_reason contains 'KNOWN_CARERS_ONLY' |
| `G-E3-1` | `CLIENT_NOTIFIED`, `FAMILY_NOTIFIED` | SYN-01, 04a, 04b, 05 | TRUE | CLIENT_NOTIFIED event must precede FAMILY_NOTIFIED in every resolved scenario |
| `CC-4` | (not an event — field exclusion) | All scenarios | n/a | P-2/P-4/P-5 fields must never appear in `matching_criteria` or any scored output |



Per Artifact 23 §3 and HS-STRAT-03:

| Event | Required Model | Scenarios |
|-------|---------------|-----------|
| VACANCY_DETECTED, SHORTLIST_GENERATED, HITL_REQUESTED | `NO_LLM` or `claude-haiku-4-5-20251001` | All |
| SPP_COLD_START, SHORTLIST_GENERATED (scored) | `claude-haiku-4-5-20251001` | SYN-04b, SYN-05 |
| HITL_DOUBLE_TIMEOUT, VACANCY_UNRESOLVED | **`claude-sonnet-4-6`** | SYN-02, SYN-03 |
| BRIEFING_SENT, CLIENT_NOTIFIED, FAMILY_NOTIFIED, CC8_FIELD_STRIPPED | `NO_LLM` | All |

**Critical:** `syn02-aud-0017` (HITL_DOUBLE_TIMEOUT) and `syn03-aud-0003` (VACANCY_UNRESOLVED) must record `model_id='claude-sonnet-4-6'`. Token budget must not exceed `TOKEN_BUDGET_L3=3500`. ECC must assert this at runtime.



Every `APPAuditLogEntry` must carry:
- `entry_hash`: `SHA-256(CONCAT(all_field_values_above_this_field))`
- `previous_hash`: `entry_hash` value of the immediately preceding entry in the same `case_id`
- First entry in a case uses genesis sentinel: `'CHAIN_GENESIS_{scenario}'` (as per expected_audit.sql)

The SD-01B merge gate query checks `hash_chain_valid` in `synthetic_detected_audit_events`. A broken hash chain is a CRITICAL finding that blocks merge.



### Step 1 — Load test fixtures into local database

```bash
psql -d homecare_test -f Execution/synthetic-data/expected_audit.sql

sqlite3 homecare_test.db < Execution/synthetic-data/expected_audit.sql
```

### Step 2 — Run ECC against test scenarios

```bash
export HOMECARE_AI_TEST_MODE=true
export HOMECARE_AI_CLIENTS_FIXTURE=Execution/synthetic-data/clients.json
export HOMECARE_AI_INCIDENTS_FIXTURE=Execution/synthetic-data/incidents.json

python -m homecare_ai.test_harness --scenarios SYN-01,SYN-02,SYN-03,SYN-04a,SYN-04b,SYN-05
```

ECC reads each incident from `incidents.json`, simulates the stimulus events (vacancy trigger, carer declines, HITL timeouts) in the order specified by `event_timestamps`, and writes `APPAuditLogEntry` records to `synthetic_detected_audit_events`.

### Step 3 — Run the SD-01B merge gate query

```sql
-- Run against your test database after ECC populates detected_audit_events
\i Execution/synthetic-data/expected_audit.sql  -- loads DDL + ground truth

-- Then run the merge gate check:
-- (The query is included at the bottom of expected_audit.sql)
-- Expected result: 0 rows returned = PASS
```

### Step 4 — Check the detection accuracy summary

Run the first validation query (also at the bottom of `expected_audit.sql`). Expected pass criteria:

| Metric | Target |
|--------|--------|
| `detection_rate_pct` | 100% for all scenarios |
| `phi_violations_CRITICAL` | 0 (any value > 0 = hard block) |
| `hash_chain_valid` | 100% |
| `model_id_correct` | 100% (especially SYN-02 HITL_DOUBLE_TIMEOUT = Sonnet) |
| `guard_id_correct` | 100% for CC-8, G-DS-05, CC-6, G-E3-1 events |
| `missing_non_nullable_fields` | 0 |

### Step 5 — Interpret results

| Merge Gate Result | Action |
|---|---|
| 0 rows — PASS | Eligible for code review and production deploy gate |
| Rows returned | Review defect_type column; create Agent Fix Queue items (Artifact 26); fix and re-run from Step 2 |

### Step 6 — Hand off to harness-audit-grader (Artifact 26)

After SD-01B PASS:
1. Export detected audit events: `COPY synthetic_detected_audit_events TO 'detected_audit_export.csv'`
2. Pass `clients.json`, `incidents.json`, `expected_audit.sql`, `detected_audit_export.csv`, and ECC source code to `harness-audit-grader`
3. Grader runs Security Debt (8 check groups) and Requirement Drift (6 check groups) checks
4. Fix any CRITICAL or HIGH findings; re-run until `OVERALL VERDICT = PASS`



These items must be resolved before any real-data test run. Synthetic data tests are not affected.

| Gate | Status | Due | Impact |
|------|--------|-----|--------|
| AX-01 | Pending engineer confirmation | Before Sprint 1 | P-9 field absent from schema |
| AX-02 | Result due 2026-04-01 | 2026-04-01 | If write-back unavailable → US-14 (Manual Absence) enters Sprint 2 |
| SC-07 | Legal review pending | 2026-04-01 | Google Maps DPA vs APP 8; postcode fallback IS-03 active until confirmed |
| Copy Approval (B1-B) | Pending Privacy Counsel | Before Sprint 1 | All 4 SMS templates require APP compliance sign-off |
| Sketch-gate | Pending designer | Before Sprint 1 | US-10 coordinator card wireframe required |




Three gaps identified post-generation. Each is resolved below with a binding status.


### Gap 1 — SMS Template Copy Approval (B1-B)

**Risk:** The 4 SMS templates (ACT-C-01, ACT-C-02, ACT-P-01, ACT-F-01) are verbatim in `Artifact 23 §4.1` but not yet reviewed by Privacy Counsel. Synthetic tests pass on template-name assertions only. A test passing on placeholder text is not evidence of APP compliance.

**Resolution:** All SMS body content assertions in `incidents.json` are marked **ADVISORY** until B1-B is cleared. The binding gate is not in the test harness — it is in `config/sms_templates.py`:

```python
SMS_TEMPLATES_VERSION     = "1.0.0"
SMS_TEMPLATES_APPROVED_BY = None  # ← BLOCKS go-live until Privacy Counsel signs
SMS_TEMPLATES_APPROVED_DATE = None  # ← BLOCKS go-live until Privacy Counsel signs
```

`harness-audit-grader` (Artifact 26) check group **CP-01** must assert:
- `config/sms_templates.py.approved_by IS NOT NULL`
- `config/sms_templates.py.approved_date IS NOT NULL`

If either is null: CP-01 finding = **HIGH** (not CRITICAL — synthetic tests can still run; go-live is blocked).

**What ECC must not do:** Treat a passing test as proof that the SMS text is APP-compliant. The only proof is Privacy Counsel sign-off in `approved_by`.


### Gap 2 — Google Maps / IS-03 Postcode Fallback (SC-07)

**Risk:** `SC07_GOOGLE_MAPS_APPROVED=false`. All 6 incidents include client/carer `lat`/`lng` coordinates derived from ABS postcode centroids (`data/au_postcode_centroids.csv`). If ECC calls the Google Maps API to resolve coordinates instead of reading the centroid file, it sends postcodes to a third-party US-hosted service without an APP 8 cross-border disclosure basis — a **CRITICAL** data sovereignty violation.

**Resolution:** Two binding assertions are now encoded in the test files:

1. **`incidents.json` `global_validation_assertions[GLOBAL-IS03]`:** Every `SHORTLIST_GENERATED` audit entry must contain `IS-03:POSTCODE_CENTROID_FALLBACK` in `threshold_applied` when `SC07_GOOGLE_MAPS_APPROVED=false`.

2. **`expected_audit.sql` SHORTLIST_GENERATED events:** All 6 `threshold_applied` fields now include `IS-03:POSTCODE_CENTROID_FALLBACK`. If ECC uses the Maps API, the centroid flag will be absent and the SD-01B merge gate extension query will fire.

**What ECC must implement:**

```python
if not SC07_GOOGLE_MAPS_APPROVED:
    # IS-03: Use ABS postcode centroids — never call Maps API
    centroid = lookup_centroid(postcode, "data/au_postcode_centroids_seed.csv")
    distance_km = haversine(client.lat, client.lng, centroid.lat, centroid.lng)
    audit_entry.threshold_applied += ",IS-03:POSTCODE_CENTROID_FALLBACK"
else:
    # SC-07 confirmed — Maps API permitted
    distance_km = google_maps_distance(client_address, carer_address)
```

**Data file — now exists in repo:**

`data/au_postcode_centroids_seed.csv` — 13 rows covering all postcodes in the 6 test scenarios. ECC can run the full harness against this seed file without the full ABS dataset.

For production: replace with the full ABS Postal Areas ASGS Edition 3 file (~2.8 MB, ~18,000 rows). Download URL is in the seed file header comment. Pre-load into Lambda `/tmp` on cold start.

**Merge gate:** `expected_audit.sql` IS-03 guard query (bottom of file) — must return 0 rows.


### Gap 3 — AX-02 Trigger Source Guard (AlayaCare Write-Back)

**Risk:** All 6 incidents specify `trigger_source: "alayacare_absence_api"`. AX-02 result is due 2026-04-01. If the AlayaCare write-back is unavailable, the vacancy detection trigger changes to `MANUAL_COORDINATOR_ENTRY` (US-14). Running the test harness against `alayacare_absence_api` when write-back is unavailable produces a **false pass** — the feature appears to work but the integration path is wrong.

**Resolution:** The test harness must read `HOMECARE_AI_AX02_STATUS` before executing any scenario:

```bash
export HOMECARE_AI_AX02_STATUS=CONFIRMED    # AlayaCare write-back available
export HOMECARE_AI_AX02_STATUS=UNAVAILABLE  # Write-back unavailable → US-14 path
```

**Harness behaviour by AX-02 status:**

| `AX02_STATUS` | Expected `VACANCY_DETECTED.trigger_sensor` | What changes |
|---|---|---|
| `CONFIRMED` | `alayacare_absence_api` | All incidents run as written |
| `UNAVAILABLE` | `MANUAL_COORDINATOR_ENTRY` | Harness substitutes trigger_source; US-14 flow tested instead |
| *unset* | — | **Harness aborts with exit code 2: `AX02_NOT_CONFIRMED`** |

```python
ax02_status = os.environ.get("HOMECARE_AI_AX02_STATUS")
if ax02_status not in ("CONFIRMED", "UNAVAILABLE"):
    sys.exit(2)  # AX02_NOT_CONFIRMED — ambiguous test state; do not run
```

**If `AX02_STATUS=UNAVAILABLE`:** US-14 (Manual Absence Record) stories enter Sprint 2. SYN-01 through SYN-05 `vacancy_details.trigger_source` is overridden to `manual_coordinator_entry` at harness runtime. The `VACANCY_DETECTED` audit entry must then log `trigger_sensor='MANUAL_COORDINATOR_ENTRY'` per US-14 AC-2 (Artifact 24).

**Merge gate:** `expected_audit.sql` AX-02 false-pass guard query (bottom of file) — must return 0 rows. A mismatch between `trigger_sensor` in the detected audit entry and the expected value for the confirmed `AX02_STATUS` is a CRITICAL finding.




| File | Lines | Created By | Purpose |
|------|-------|-----------|---------|
| [data/au_postcode_centroids_seed.csv](../data/au_postcode_centroids_seed.csv) | 14 + header | Amendment 4-A | IS-03 lookup data for 13 test postcodes; replace with full ABS file for production |
| [config/sms_templates.py](../config/sms_templates.py) | ~190 | Amendment 5-A | Verbatim SMS templates (all 4 actions, 8 variants); `approved_by=None` blocks production; test harness bypasses in advisory mode |

### How `config/sms_templates.py` moves from advisory to binding

```
Now:
  APPROVED_BY  = None   → harness runs in advisory mode
  APPROVED_DATE = None  → harness runs in advisory mode
  harness-audit-grader CP-01 → ADVISORY (non-blocking)

After Privacy Counsel review (B1-B):
  APPROVED_BY  = "Privacy Counsel — [Name]"
  APPROVED_DATE = "2026-XX-XX"
  harness-audit-grader CP-01 → PASS (binding)
  incidents.json SYN01-A9 through SYN01-A12 → advisory flag removed → BINDING assertions
```

No code changes required — only the two fields in `config/sms_templates.py` change. All template strings are already final (verbatim from Artifact 23 §4.1). ECC must not inline these strings anywhere else in the codebase.


*Artifact 25 is the final Stage C artifact. Stage D begins: hand PRD (Artifact 21) + Logic Spec (Artifact 23) + User Stories (Artifact 24) + Synthetic Data (Artifact 25) to ECC. Run harness-audit-grader (Artifact 26) until OVERALL VERDICT = PASS.*
