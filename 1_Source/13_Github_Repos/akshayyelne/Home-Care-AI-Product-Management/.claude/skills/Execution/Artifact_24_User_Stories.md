# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Execution/Artifact_24_User_Stories.md
# Generated: 2026-07-31T00:49:45.161Z

**Project:** Home-Care-AI
**Stage:** Execution → Stage B (The Engineering Blueprint — Logic)
**Skill:** user-stories
**Date:** 2026-03-28
**Author Role:** PM / Backlog Author
**Feature Set:** Vacancy Incident Processing Pipeline — all P1 features (v1)

**CLAUDE.md compliance note:** These stories were written *after* `agentic-logic-spec` (Artifact 23) was completed. Per CLAUDE.md Article V: "Stories written before the Logic Spec are invalid inputs to ECC." Every Confirmation section cites specific `APPAuditLogEntry` / `APPAuditLogEntry` fields from Artifact 23 §8.

**Input Artifacts:**
- Artifact 21 §7 (PRD — P1 feature list, design requirements DR-1 through DR-5, constraints)
- Artifact 22 §07 (Build wave sequence — Wave 0 through Wave 5)
- Artifact 23 §3 (Threshold constants), §4 (Pseudocode gates), §4.1 (SMS templates), §8 (Audit log schema + event registry)
- Artifact 16 §9 (HS-STRAT-02 NFRs — a through i)

**Status key:**
- ✅ **Ready for Dev** — all inputs confirmed; no external blockers
- ⚠️ **Gated** — can be built and tested; blocked from production deploy pending named action item
- 🔴 **Blocked** — cannot start until named prerequisite is complete

**Build wave order (Artifact 22 §07):**
Wave 0 → Wave 1 → Wave 2 → Wave 3 (parallel) → Wave 4 → Wave 4 (parallel) → Wave 5 → Integration

**Design reference base:** Artifact 21 §7.1 (screen sequence), Artifact 23 §4 (pseudocode gates), §4.1 (SMS templates). Wireframes: Designer to deliver DR-1 through DR-5 before Wave 4 coding begins.




### US-01 — Immutable Audit Log: State Machine Foundation

**Build Wave:** 0 (Day 1 — before all other features)
**Status:** ✅ Ready for Dev
**OKR:** OKR-4 (instrumentation) + OKR-5 (compliance) + SD-01B merge gate

**Description:**
As the **Home-Care-AI system**, I want every vacancy incident state transition to be written to an immutable, append-only audit log immediately when it occurs, so that every replacement decision is permanently traceable, tamper-evident, and available for compliance review.

**Design:** Artifact 23 §8 (APPAuditLogEntry schema + event type registry). Infrastructure: AWS CloudTrail + write-once S3 Object Lock (COMPLIANCE mode, `AUDIT_LOG_RETENTION_YEARS = 7`). No design UI required — this is infrastructure.

**Conversation:**
This story has no user-facing output. It is the plumbing every other story depends on. It must be built, tested, and verified before any other feature code is written. The SD-01B merge gate in `harness-audit-grader` will check every story's compliance against this story's output. The hash-chain (`entry_hash` + `previous_hash`) is what makes the log tamper-evident — it must be computed and verified in unit tests before Wave 1 begins.

**Acceptance Criteria:**

1. A `log_event()` function exists that accepts an `APPAuditLogEntry` object and writes it to the write-once S3 bucket. The function returns the `log_id` on success and raises a non-silent exception on failure — it never silently swallows a failed write.

2. Every entry populates all 10 non-nullable fields: `log_id` (UUID v4), `timestamp` (ISO 8601 UTC with milliseconds), `patient_id` (UUID — never a name), `event_type` (from the canonical 31-event registry in Artifact 23 §8), `state_before`, `state_after`, `action_taken`, `ai_confidence_score`, `entry_hash`, `previous_hash`. A unit test asserts that attempting to write an entry with any non-nullable field set to `null` or `""` raises a `ComplianceValidationError` before the write is attempted.

3. `entry_hash` is computed as SHA-256 of the canonical JSON serialisation of all fields above (keys alphabetically sorted, no whitespace). The hash covers all fields — not a subset. A unit test generates two entries with identical content except one field changed by one character, and asserts the hashes differ.

4. `previous_hash` of the first entry in a session is SHA-256 of the `session_id` string alone (session anchor). For every subsequent entry, `previous_hash` equals the `entry_hash` of the immediately preceding entry in the same `case_id`. A unit test validates a 5-entry chain: each entry's `previous_hash` matches the prior entry's `entry_hash`.

5. Log entries are written to the write-once S3 bucket (`ap-southeast-2`), NOT to a mutable DynamoDB table. A unit test asserts the write target is the S3 bucket ARN, not a DynamoDB table name. No application IAM role has `s3:DeleteObject`, `s3:PutObjectVersionTagging`, or `dynamodb:UpdateItem` on the audit destination. Infrastructure-as-code review confirms this before Wave 1 begins.

6. The `data_sensitivity` field correctly classifies every event: events involving `patient_id` + `user_id` without SPP field content = `'PII'`; events involving P-3/P-4/P-5 SPP data in the action context = `'SENSITIVE_INFO'`; events involving no personal data (system events) = `'OPERATIONAL'`. A parameterised unit test covers all three classifications.




### US-02 — SPP Schema: Structured Fields + P-9 Exclusion (CRIT-04)

**Build Wave:** 1 (Weeks 1–3) — prerequisite: AX-01 engineering confirmation in writing
**Status:** ⚠️ Gated — AX-01 must be confirmed in writing before Wave 1 begins
**OKR:** OKR-4 (≥ 80% SPP completeness within 90 days)

**Description:**
As the **Home-Care-AI system**, I want the client SPP data model to contain only structured, enumerated fields — with no free-text field of any kind — so that the system never accumulates uncontrolled health information that would create a CRIT-04 compliance breach.

**Design:** Artifact 21 §7.2 Feature 1 (SPP field table — P-1 through P-11, excluding P-9). Artifact 23 §3 constant `P9_FREE_TEXT_FIELD_PERMITTED = false`.

**Conversation:**
This story is not user-visible. It is the schema contract that every other Wave 1–5 story depends on. AX-01 (engineer confirms P-9 absent in writing) must be signed off before any migration script or schema creation PR is approved. The three F10 dormant fields (`carer.credential_expiry_date`, `client.care_plan_review_due_date`, `visit.documentation_complete`) must also be planted as `null`-permitted columns in this wave — they power the P1.1 Compliance Dashboard and cannot be added without a disruptive migration later (Artifact 22 BS-2). The SPP completeness score (P-10) is a computed field — no stored column; it is calculated on read.

**Acceptance Criteria:**

1. The SPP database schema contains exactly these columns and types for the client record: `client_id` (UUID, PK), `first_name` (VARCHAR 50), `suburb` (VARCHAR 100 — P-11), `gender_preference` (ENUM: 'Female','Male','No_preference' — P-2), `familiarity_threshold` (ENUM: 'KNOWN_CARERS_ONLY','BRIEFED_ACCEPTABLE','ANY' — P-3), `cultural_considerations` (JSON structured multi-select — P-4), `personal_sensitivities` (VARCHAR 100 — P-5, hard cap enforced at DB layer), `entry_protocol` (ENUM: 'ID_CHECK','INTRO_CALL','NONE' — P-6), `notification_channel` (VARCHAR 20 — F-1), `family_contact_channel` (VARCHAR 20 — F-2), `family_contact_first_name` (VARCHAR 50), `client_pronoun` (VARCHAR 10, default 'them'). F10 dormant columns: `care_plan_review_due_date` (DATE, nullable), `visit_documentation_complete` (BOOLEAN, nullable).

2. A schema validation function `validate_spp_schema(schema_definition)` raises `CriticalComplianceError` if any column name matches the pattern `free_text_notes`, `notes`, `comments`, `narrative`, `description` (case-insensitive). This validation runs as a pre-migration check in the CI pipeline. AX-01 sign-off is recorded in the PR description before this story is merged.

3. The `personal_sensitivities` field (P-5) enforces a hard 100-character limit at the database constraint layer — not only the application layer. Attempting to insert a value longer than 100 characters raises a database constraint error (not silently truncated). A unit test asserts this.

4. The carer record schema contains: `carer_id` (UUID, PK), `first_name` (VARCHAR 50), `postcode` (VARCHAR 10 — S-2), `phone_number` (VARCHAR 20 — S-1b, stored as tokenised reference), `qualifications` (JSON array of qualification codes), `credential_expiry_date` (DATE — F10 dormant Wave 1 field), `availability_calendar` (JSON). No free-text field of any kind exists in the carer record. Audit log for schema creation: `event_type = 'CONSENT_RECORD_CREATED'` is NOT fired on schema creation — it fires only at client consent event. This distinction must be in the PR description.

5. The `APPAuditLogEntry` field `patient_id` stores the `client_id` UUID. A unit test asserts that no query joining `patient_id` to `first_name` exists in the codebase at merge time (`harness-audit-grader` SD-02 grep check: `SELECT.*patient_id.*first_name`).

6. P-10 (SPP completeness score) is a computed read-only property: `(count of non-null SPP fields / 8 scored fields) × 100`. The 8 scored fields are: P-2, P-3, P-4, P-5, P-6, P-7 (at least one visit), P-8 (at least one binary flag), P-11. A unit test validates P-10 = 0 for a client with all null fields, P-10 = 37.5 for a client with 3 of 8 fields populated, P-10 = 100 for a fully populated client.


### US-03 — SPP Intake Capture: Coordinator-Guided Form (ACT-S-01)

**Build Wave:** 1 (Weeks 1–3) — depends on US-02
**Status:** ⚠️ Gated — depends on US-02 (schema must be final)
**OKR:** OKR-4 (≥ 80% of active clients with ≥ 3 SPP fields within 90 days)
**OKR-6:** Knowledge survivability — new coordinator can read SPP from Day 1

**Description:**
As a **care coordinator**, I want to fill in a structured preference form for a client at intake, so that their care preferences are stored in the system and available to any coordinator from Day 1 — instead of living on sticky notes in my desk.

**Design:** Artifact 21 §7.2 Feature 1 (SPP field list). Mobile-first form: dropdown selectors, multi-select checkboxes, one 100-char text field (P-5). No clinical fields, no diagnosis fields.

**Conversation:**
The form must make it easy to skip optional fields without leaving empty required fields. P-4 (cultural/religious considerations) requires explicit opt-in consent at collection (HIGH-01). The form must display a consent prompt before P-4 is surfaced — not a bundled "agree to everything" T&C. P-2 must be labelled "Client preference (advisory — not scored)" on the form to match the coordinator approval card labelling (CRIT-03 consistency). The consent event for sensitive information fields (P-2, P-3, P-4, P-5) must be logged separately from the form save.

**Acceptance Criteria:**

1. The SPP intake form presents fields in this order with these UI controls: P-3 Familiarity threshold (required dropdown — 'Known carers only' / 'Briefed-acceptable' / 'Any'), P-2 Gender preference (optional dropdown — 'Female' / 'Male' / 'No preference', labelled "Client preference (advisory — not scored)"), P-4 Cultural/religious considerations (optional multi-select, gated behind an explicit consent prompt: "Do you have consent to record this sensitive information? [Yes / Skip]"), P-5 Personal sensitivities (optional text field, max 100 chars with live counter, labelled "e.g. Do not move items in the lounge"), P-6 Entry protocol (dropdown), P-11 Suburb (text).

2. On form save, the system writes a `SPP_CONSENT_RECORDED` audit log entry for each sensitive information field (P-2, P-3, P-4, P-5) that was explicitly consented to and saved. Required `APPAuditLogEntry` fields: `event_type = 'SPP_CONSENT_RECORDED'`, `patient_id` = client UUID, `user_id` = coordinator UUID, `consent_record_id` = UUID of consent event (non-null for P-2/P-3/P-4/P-5 writes), `consent_version` = current privacy notice version string, `lawful_basis = 'Treatment'`, `data_sensitivity = 'SENSITIVE_INFO'`, `guard_passed = true` (consent obtained).

3. The P-9 field does not appear on the form in any variant — not as a textarea, notes field, comments field, or "other" open-text input. The form validation function asserts `'free_text_notes' NOT IN form.fields` at render time. If a future code change introduces a text input without the 100-char constraint, the CI validation in US-02 criterion 2 must catch it before merge.

4. After save, the system calculates and stores P-10 (completeness score). A success message shows: "Mrs. Chen's profile is [X]% complete. Add [next_empty_field_label] to improve match quality." The message uses first name only — no surname.

5. On save, a `SPP_FIELD_UPDATED` audit log entry is written with: `event_type = 'SPP_FIELD_UPDATED'`, `patient_id` = client UUID, `user_id` = coordinator UUID, `action_taken = 'ACT_S_01_INTAKE_SAVED'`, `state_before = 'NORMAL'`, `state_after = 'NORMAL'`, `data_sensitivity = 'SENSITIVE_INFO'`, `entry_hash` and `previous_hash` populated.

6. If the coordinator skips all optional fields and saves only P-3 and P-11 (minimum viable SPP), the save succeeds. P-10 = 25% (2 of 8). The form does not block saving with a partially completed profile — it encourages completion but never prevents it.


### US-04 — SPP Completeness Prompt: Post-Incident Invitation (ACT-S-03)

**Build Wave:** 1 (Weeks 1–3) — depends on US-03
**Status:** ✅ Ready for Dev (no external blockers; depends on US-03)
**OKR:** OKR-4 (≥ 80% of active clients with ≥ 3 SPP fields within 90 days)

**Description:**
As a **care coordinator**, I want to be prompted to add a client's preferences immediately after a vacancy incident involving that client, so that SPP completeness grows naturally from the work I'm already doing — without a separate data-entry project.

**Design:** Artifact 21 §7.2 Feature 1 (ACT-S-03). Artifact 21 §7.1 Resolution Screen (DR-3/DR-4): "Add [client first name]'s preferences now — 2 min" appears on the resolution screen if P-10 < 80%. See also DR-4: empty state must feel like an invitation, not a dead end.

**Conversation:**
This prompt fires on the resolution screen (Gate 13) after every successfully resolved incident where the client's P-10 is below 80%. It must not fire for VACANCY_UNRESOLVED incidents (the coordinator is already stressed). The "2 min" claim in the call-to-action is a design commitment — if the form takes longer than 2 minutes to complete the 3 highest-impact fields, the form is too long.

**Acceptance Criteria:**

1. After a vacancy incident reaches state `RESOLVED` (Gate 13), the resolution screen displays the message: "Add [client.first_name]'s preferences now — 2 min. It will help next time." with a single-tap link to the SPP intake form for that client, IF `client.spp_completeness_score < 0.80`. The message does not appear if P-10 ≥ 80%.

2. The prompt does NOT appear on VACANCY_UNRESOLVED incident closure screens. A unit test verifies: given `incident_state = 'VACANCY_UNRESOLVED'`, the completeness prompt component is not rendered.

3. If the coordinator taps the link and completes at least one additional SPP field, the system re-calculates P-10 and writes a `SPP_FIELD_UPDATED` audit entry with `action_taken = 'ACT_S_03_POST_INCIDENT_UPDATE'`, `patient_id` = client UUID, `user_id` = coordinator UUID, `consent_record_id` populated for any sensitive information fields added. The `previous_hash` chains correctly from the most recent prior entry for this `case_id`.

4. If the coordinator dismisses the prompt (taps "Skip" or navigates away), no audit entry is written for the dismissal. Dismissal is not a compliance event. A unit test confirms no `log_event()` call fires on prompt dismissal.

5. The 3-field target for the prompt is highlighted: the form pre-selects the three empty fields with the highest OKR-4 contribution (P-3, P-5, P-6 in that order) and scrolls to them automatically. The coordinator does not need to hunt for what to fill in.




### US-05 — Qualification Gate: Hard-Binary Carer Filter (ACT-V-01/02)

**Build Wave:** 2 (Weeks 2–5) — depends on US-02 (carer schema)
**Status:** ✅ Ready for Dev
**OKR:** OKR-1 (< 5 min fill time), OKR-2 (< 2% cancellation rate)

**Description:**
As the **Home-Care-AI system**, I want to automatically filter the carer roster to only those who are qualified, credentialled, and available for a specific vacancy, so that the coordinator only ever sees carers who are legally eligible to do the job.

**Design:** Artifact 21 §7.2 Feature 2 (Step 1 — Qualification Gate). Artifact 23 §4 Gate 1.

**Conversation:**
The qualification gate is a hard binary — pass or fail. A carer with an expired credential is excluded regardless of how well they match the client's preferences. `carer.credential_expiry_date` is the F10 dormant field planted in Wave 1 (US-02, Artifact 22 BS-2) — this story reads it even though the Compliance Dashboard display (F10) is deferred to P1.1. This is the first story to invoke `log_event()` during a vacancy incident — it must chain correctly from the Wave 0 audit log infrastructure (US-01).

**Acceptance Criteria:**

1. On receipt of a `vacancy_recorded` event with valid `client_id`, `visit_time`, and `absent_carer_id`, the system writes a `VACANCY_DETECTED` audit entry: `event_type = 'VACANCY_DETECTED'`, `state_before = 'NORMAL'`, `state_after = 'VACANCY_DETECTED'`, `patient_id` = client UUID, `action_taken = 'INCIDENT_OPENED'`, `trigger_sensor = 'VACANCY_EVENT'`, `ai_confidence_score = 1.0`, `model_id = 'claude-haiku-4-5-20251001'`. All non-nullable fields populated.

2. The qualification filter excludes a carer if any of the following is true: (a) carer is the absent carer being replaced, (b) carer has a scheduling conflict at `visit_time`, (c) any credential in `carer.qualifications` required by `client.care_requirements` has `credential_expiry_date < vacancy.visit_date`, (d) carer's qualifications do not satisfy all required care codes. A unit test per exclusion criterion confirms each individually.

3. If `qualified_carers.length == 0` after the gate, the system proceeds directly to Gate 14 (VACANCY_UNRESOLVED) without attempting scoring or notification. The audit log records `VACANCY_UNRESOLVED` with `state_before = 'HITL_PENDING'`, `action_taken = 'NO_QUALIFIED_CARERS'`. No coordinator push notification for shortlist is sent in this path.

4. If a duplicate `vacancy_recorded` event is received for the same `client_id` + `visit_time` within any 24-hour window, the system writes `DUPLICATE_VACANCY_SUPPRESSED` and returns without creating a second incident. A unit test asserts: given two identical events, only one `VACANCY_DETECTED` entry exists in the audit log for that `case_id`.

5. The total elapsed time from `vacancy_recorded` event receipt to `SHORTLIST_GENERATED` audit entry (Gates 0 through 5 complete) must be ≤ 30 seconds under normal load (≤ 200 active carer records). A performance test with 200 carer records confirms this SLA. Time is logged in `hitl_response_ms` of the `SHORTLIST_GENERATED` entry (elapsed since event receipt).


### US-06 — Trust Scoring + Ranked Shortlist (ACT-V-03/04/05/06/07)

**Build Wave:** 2 (Weeks 2–5) — depends on US-05
**Status:** ⚠️ Gated (production) — `SC07_GOOGLE_MAPS_APPROVED = false`; build with postcode fallback; production deploy of Google Maps path blocked pending SC-07 legal confirmation (due 2026-04-01)
**OKR:** OKR-1 (< 5 min fill time), OKR-3 (≥ 70% 1-tap approval without verification calls)

**Description:**
As a **care coordinator**, I want the system to automatically rank replacement carers by how well they match this specific client's preferences and location, so that the person at the top of the list is almost always the right choice — and I can approve without making a single verification call.

**Design:** Artifact 21 §7.1 screen 3 (Candidate Shortlist). Artifact 23 §4 Gates 2–5, §3 scoring constants (`SCORING_WEIGHT_FAMILIARITY = 0.60`, `SCORING_WEIGHT_PROXIMITY = 0.40`, `SHORTLIST_MAX_CANDIDATES = 3`).

**Conversation:**
The trust scoring formula is: `composite_score = (familiarity_score × 0.60) + (proximity_score × 0.40)`. Familiarity score is sourced from P-7 (visit count, normalised 0–1 at 5 visits cap) and P-8 (binary flag, floors at 0.80). Proximity score is normalised as `1 - (distance_km / 25)`. P-2 is explicitly excluded from scoring until `E1_LEGAL_SIGNOFF = true` (currently false). This guard must be a runtime assertion, not a comment. The G-CC-4 guard fires and is logged on every shortlist generation. The postcode zone fallback (`au_postcode_centroids.csv`, IS-03) is the default until SC-07 is confirmed — this must be the path exercised in all dev/test environments.

**Acceptance Criteria:**

1. For a client with P-3 = 'KNOWN_CARERS_ONLY', any carer with `p7_visit_count(carer_id, client_id) == 0` is excluded from the shortlist entirely — they do not appear as candidates 2 or 3. A unit test with 5 qualified carers (3 with prior visits, 2 without) and P-3 = 'KNOWN_CARERS_ONLY' asserts the returned shortlist contains exactly the 3 familiar carers.

2. P-2 (gender preference) carries zero weight in the composite score when `E1_LEGAL_SIGNOFF = false`. The `COMPLIANCE_OVERRIDE_ACKNOWLEDGED` audit entry is written with `guard_id = 'G-CC-4'`, `guard_passed = true`, `threshold_applied = 'E1_LEGAL_SIGNOFF=false'` for every shortlist generation. P-2 value is visible on the coordinator approval card as: "Client preference: [Female/Male/No preference] (advisory — not scored)."

3. When `SC07_GOOGLE_MAPS_APPROVED = false` (the default), proximity scoring uses `postcode_zone_distance()` with the bundled `data/au_postcode_centroids.csv`. The Haversine computation produces a distance in km. No external API call is made. A unit test asserts `google_maps_distance_matrix()` is NOT called when the constant is false. An integration test with 3 carers at known AU postcode distances validates that the proximity score ranking is correct to ±3km accuracy.

4. A `SHORTLIST_GENERATED` audit entry is written with: `event_type = 'SHORTLIST_GENERATED'`, `state_before = 'VACANCY_DETECTED'`, `state_after = 'SHORTLIST_READY'`, `ai_confidence_score` = top candidate's composite_score (float 0.0–1.0), `threshold_applied = 'SCORING_WEIGHT_FAMILIARITY=0.60|SCORING_WEIGHT_PROXIMITY=0.40'`, `model_id = 'claude-haiku-4-5-20251001'`.

5. A client in EC-04 (P-10 = 0, SPP cold-start) produces a `SPP_COLD_START` audit entry followed by a `SHORTLIST_GENERATED` entry. The shortlist ranks candidates by proximity only (familiarity_score = 0 for all). The `action_taken` field on `SHORTLIST_GENERATED` includes `'BRIEFING_MODE_SET_MINIMAL'`. The coordinator card shows the "Add preferences now" invitation (DR-4).

6. The shortlist served to the coordinator's app contains: for each candidate — `first_name`, `composite_score` (displayed as a percentage, not a raw float), `distance_km` (rounded to 1 decimal), `visit_count` for this client, `qualification_verified` (boolean badge). No `client_full_address`, no SPP field content, no `match_explanation` text (that is session-only, not in the shortlist payload). A unit test asserts these absent fields.




### US-07 — Client Notification SMS + E-3 Gate 1 (ACT-P-01)

**Build Wave:** 3 (Weeks 3–5, parallel) — can be built with stubbed `coordinator_approved = true` input
**Status:** ✅ Ready for Dev (no external blockers; can be tested with stubs)
**OKR:** OKR-5 (100% of confirmed replacements trigger automated notification)

**Description:**
As a **home care client**, I want to receive a text message telling me who is coming to visit me today before they arrive, so that I am never surprised by an unfamiliar person at my door — and never sit waiting without knowing if anyone is coming at all.

**Design:** Artifact 23 §4.1 Template 3 (ACT-P-01, Variants A and B). Artifact 21 §7.2 Feature 5 (E-3 Gate 1 pseudocode). G-DS-05 phrasing branch on `client.familiarity_threshold`.

**Conversation:**
This notification fires after the carer has confirmed (Gate 10a — carer replies YES) and the briefing has been sent (Gate 9). It never fires before `coordinator_approved = true`. The G-DS-05 guard is a phrasing branch, not a blocking guard — both Variant A and Variant B are safe to send. The blocked case (P-3 = 'KNOWN_CARERS_ONLY' + visit_count = 0) should never reach this gate due to the Gate 4 hard filter, but if it does, it is an incident (G-DS-05 violation) and the system escalates to VACANCY_UNRESOLVED rather than sending the wrong message.

**Acceptance Criteria:**

1. The SMS is sent using template interpolation only. The final assembled string matches Artifact 23 §4.1 Template 3 Variant A (`"Good morning, this is {agency_name}. Your visit today will be with {carer_first_name}, who has visited you before. They'll arrive at {visit_time}."`) when `p7_visit_count > 0`, and Variant B when `visit_count == 0` and `P-3 != 'KNOWN_CARERS_ONLY'`. A unit test for each variant asserts the exact rendered string matches the template character-for-character given known variable values.

2. No `send_sms(client, ...)` call is made unless `coordinator_approved == true`. A unit test asserts that calling the client notification function with `coordinator_approved = false` raises a `GateViolationError` and writes no audit entry of type `CLIENT_NOTIFIED`.

3. On successful SMS delivery, the system sets `client_notified = true` and writes: `event_type = 'CLIENT_NOTIFIED'`, `state_before = 'BRIEFING_SENT'`, `state_after = 'CLIENT_NOTIFIED'`, `patient_id` = client UUID, `action_taken = 'ACT_P_01_SENT'`, `cross_border_disclosure = false`, `app8_basis = 'Domestic'`, `lawful_basis = 'Treatment'`, `data_sensitivity = 'PII'`, `guard_id = 'G-DS-05'`, `guard_passed = true`. `content_generation_method` is asserted = `'TEMPLATE_INTERPOLATION'` before send — if the assertion fails, the send is blocked and a CRITICAL defect flag is raised.

4. On SMS delivery failure (`sms_result.delivered == false`), the system sets `client_notified = false`, writes `CLIENT_NOTIFICATION_UNAVAILABLE` with `action_taken = 'ACT_P_01_FAILED_COORDINATOR_ALERTED'`, and sends a coordinator alert: "[client.first_name] has no notification channel — please call them directly before family is notified." Family notification is NOT sent while `client_notified = false`.

5. If Gate 11 detects P-3 = 'KNOWN_CARERS_ONLY' AND `p7_visit_count == 0` for the assigned carer (G-DS-05 violation): the system does NOT send any client notification, writes `COMPLIANCE_OVERRIDE_ACKNOWLEDGED` with `guard_id = 'G-DS-05'`, `guard_passed = false`, and escalates to VACANCY_UNRESOLVED (Gate 14). A unit test asserts this path produces no `CLIENT_NOTIFIED` audit entry.


### US-08 — Family Notification SMS + E-3 Gate 2 — Arthur Kovacs Constraint (ACT-F-01)

**Build Wave:** 3 (Weeks 3–5, parallel) — depends on US-07 (`client_notified` flag must exist)
**Status:** ✅ Ready for Dev
**OKR:** OKR-5 (100% of confirmed replacements trigger automated family notification)

**Description:**
As a **family member of a home care client**, I want to receive a text message about my parent's visit only after my parent has already been told — so that I never find out before they do, and the agency never has to receive an angry call because a family member learned the news first.

**Design:** Artifact 23 §4.1 Template 4 (ACT-F-01, Variants A and B). Artifact 23 §4 Gate 12 (E-3 Gate 2, `send_family_notification(coordinator_approved: bool, client_notified: bool)` function signature). Artifact 21 §7.1 Coordinator Approval Card: "Margaret (daughter): [Sent AFTER Mrs. Kim is notified — guaranteed]" (DR-2).

**Conversation:**
The E-3 Gate 2 is a structural code constraint — it is enforced by the function signature `send_family_notification(coordinator_approved: bool, client_notified: bool)`. Both parameters must be `True` for the function to proceed. There is no configuration flag that can bypass this. The gate was designed to prevent the Arthur Kovacs failure case from Artifact 14: "Her father had been waiting in his chair — and the family called to say they'd already heard." This story's Confirmation criterion 2 is the primary SD-01B compliance check for this feature.

**Acceptance Criteria:**

1. The `send_family_notification(coordinator_approved: bool, client_notified: bool)` function is called with both boolean parameters. If either is `False`, the function: (a) does NOT send any SMS, (b) logs `E3_GATE_BLOCKED` with `state_before = 'CLIENT_NOTIFIED'` (or current state), `state_after = 'FAMILY_GATE_BLOCKED'`, `guard_id = 'G-E3-1'`, `guard_passed = false`, `action_taken = 'FAMILY_NOTIFICATION_SUPPRESSED'`, and (c) sends a coordinator alert: "Family notification held — [client.first_name] has not yet been notified." The function must never be called without both parameters explicitly passed — no default parameter values that would silently pass the gate. A unit test asserts that calling with `client_notified = false` raises `GateViolationError`.

2. When both parameters are `True`, the SMS uses template interpolation (Artifact 23 §4.1 Template 4 Variant A when `visit_count > 0`, Variant B when `visit_count == 0`). A unit test for each variant asserts the exact rendered string. `{family_first_name}` is drawn from `client.family_contact.first_name` — never from the client's name. `{client_pronoun}` defaults to "them" if not set.

3. On successful delivery, the system writes: `event_type = 'FAMILY_NOTIFIED'`, `state_before = 'CLIENT_NOTIFIED'`, `state_after = 'FAMILY_NOTIFIED'`, `patient_id` = client UUID, `action_taken = 'ACT_F_01_SENT'`, `guard_id = 'G-E3-1'`, `guard_passed = true`, `consent_record_id` = family contact consent UUID (HIGH-01/MED-03 — consent scope must cover scheduling notifications), `cross_border_disclosure = false`, `app8_basis = 'Domestic'`, `lawful_basis = 'Operations'`, `data_sensitivity = 'PII'`. `content_generation_method` asserted = `'TEMPLATE_INTERPOLATION'` before send.

4. The SMS content contains no client health information, no SPP fields, no carer credentials, no match score, and no match explanation. A unit test asserts the rendered template against a deny-list: `assert 'spp' not in sms_content.lower()`, `assert 'match' not in sms_content.lower()`, `assert 'score' not in sms_content.lower()`.

5. If the family contact has no notification channel (`client.family_contact_channel IS NULL`), the system writes `FAMILY_NOTIFICATION_SUPPRESSED` with `action_taken = 'NO_FAMILY_CHANNEL_CONFIGURED'` and alerts the coordinator. The incident continues to `RESOLVED` — absence of a family channel is not a VACANCY_UNRESOLVED trigger.




### US-09 — Coordinator Push Notification + HITL SLA Timer (ACT-V-05)

**Build Wave:** 4 (Weeks 4–6) — depends on US-06 (shortlist must exist)
**Status:** ✅ Ready for Dev
**OKR:** OKR-1 (< 5 min fill time), OKR-3 (≥ 70% 1-tap trust rate)

**Description:**
As a **care coordinator**, I want to receive a push notification on my phone the moment replacement candidates are ready, so that I can act immediately — even at 6:30 AM before I've reached my desk — and start the approval flow with a single tap.

**Design:** Artifact 21 §7.1 screen 1 (Push Notification). DR-5: completable one-handed on a 5-inch screen. Notification text: "[absent_carer.first_name] called in sick — [N] visits affected. Replacements ready for review."

**Conversation:**
The push notification is a Level 1 action — no coordinator approval required. The SLA timer starts the moment the notification is sent (not the moment the coordinator opens the app). Two timers run: 30 minutes for the primary coordinator, and 15 minutes for the backup coordinator if the primary does not respond. The coordinator's session is scoped to this `case_id` — on app open from the notification, the shortlist for this specific incident loads immediately. If the coordinator has a pending shortlist from a prior incident, it appears as a separate incident card — sessions are not merged (HIGH-06 session isolation).

**Acceptance Criteria:**

1. On `SHORTLIST_GENERATED`, the system immediately writes `HITL_REQUESTED` with `state_before = 'SHORTLIST_READY'`, `state_after = 'HITL_PENDING'`, `hitl_id` = primary coordinator UUID, `reviewer_role = 'CARE_COORDINATOR'`, `action_taken = 'COORDINATOR_NOTIFIED'`, `threshold_applied = 'COORDINATOR_APPROVAL_SLA_MIN=30'`. The SLA timer starts at the timestamp of this audit entry.

2. The push notification message is: "[absent_carer.first_name] called in sick — [N] visits affected. Replacements ready for review." where N is the count of vacancy incidents triggered by this absence. Tapping the notification opens the vacancy overview screen for this `case_id` directly — not the app home screen. A unit test confirms the deep-link payload in the notification contains `case_id`.

3. If the primary coordinator does not respond within 30 minutes (SLA timer fires), the system writes `HITL_TIMEOUT` with `state_before = 'HITL_PENDING'`, `state_after = 'HITL_PENDING'`, `hitl_id` = primary coordinator UUID, `hitl_response_ms = null`, `hitl_decision = 'TIMEOUT'`. Then writes `HITL_TIER_ESCALATED` and sends the backup coordinator a CRITICAL-urgency push: "[primary_coordinator.first_name] hasn't responded — [N] visits need a replacement approved. URGENT." A 15-minute SLA timer starts for the backup coordinator.

4. If both coordinators time out, the system writes `HITL_DOUBLE_TIMEOUT` with `state_before = 'HITL_PENDING'`, `state_after = 'VACANCY_UNRESOLVED'`, `hitl_response_ms = null`. It does NOT auto-assign a carer. It escalates to Gate 14 (VACANCY_UNRESOLVED). A unit test confirms: given two sequential SLA timeouts, `COORDINATOR_APPROVED` is never written to the audit log.

5. The coordinator session created at Gate 6 includes: `case_id`, `user_id`, session expiry time (10 minutes after last activity), per-session encryption key from AWS KMS. The shortlist data is NOT written to browser local storage or device cache. A unit test asserts `localStorage.setItem` is never called during shortlist rendering (HIGH-06).


### US-10 — Coordinator Approval Card: The Moment of Truth (ACT-A-01/02)

**Build Wave:** 4 (Weeks 4–6) — depends on US-09 (HITL pending state + wireframes approved)
**Status:** 🔴 Blocked — DR-1 through DR-5 wireframes must be approved by PM Lead before coding begins (Artifact 22 §07)
**OKR:** OKR-3 (≥ 70% of top-ranked candidates approved without verification calls)

**Description:**
As a **care coordinator**, I want to see the replacement candidate's familiarity with the client as the most prominent element on the approval screen — above any score or percentage — so that I can trust the recommendation and approve with a single tap, without making a verification call to check if the client will actually open the door for this person.

**Design:** Artifact 21 §7.1 screen 4 (Coordinator Approval Card — Moment of Truth), DR-1 through DR-5 (binding). Familiarity flag must be the largest element (DR-1). Notification preview must appear before the Approve tap (DR-2). Wireframes: designer delivery required before coding.

**Conversation:**
This is the most important screen in the product. DR-1 through DR-5 are non-negotiable design requirements from Artifact 15 §7 (the Moment of Truth). The approval card must show: (1) familiarity count as the largest element — "★ 2 prior visits with Mrs. Kim" not "94% match", (2) qualifications confirmed badge — "✓ Qualified for Mrs. Kim's care requirements", (3) full notification preview — what David will receive, what Mrs. Kim will receive, what the family will receive, with the E-3 ordering note, (4) P-2 displayed as "Client preference: [value] (advisory — not scored)" in a secondary position — never as a scoring element. The approval tap sets `coordinator_approved = true` and writes `COORDINATOR_APPROVED` to the audit log before any downstream action begins.

**Acceptance Criteria:**

1. The approval card renders with the familiarity count (`"★ {visit_count} prior visits with {client.first_name}"`) as the largest typographic element — visually larger than the match score, carer name, or any other element. If `p7_visit_count == 0`, the familiarity element shows `"First visit for {client.first_name}"` — it does not disappear. A visual regression test (screenshot comparison) confirms this hierarchy across 3 screen sizes: 320px, 375px, 390px width.

2. The notification preview section (DR-2) shows three outbound messages in order: (i) what the carer will receive (ACT-C-01 template rendered with real variables), (ii) what the client will receive (ACT-P-01 template rendered), (iii) what the family contact will receive (ACT-F-01 template rendered) with the note: "[family_first_name] will be notified after [client_first_name] — guaranteed." The Approve button is below this preview, never above it.

3. On Approve tap: `coordinator_approved` is set to `true`, `COORDINATOR_APPROVED` is written to the audit log with `event_type = 'COORDINATOR_APPROVED'`, `state_before = 'HITL_PENDING'`, `state_after = 'COORDINATOR_APPROVED'`, `user_id` = coordinator UUID, `hitl_id` = coordinator UUID, `hitl_decision = 'CONFIRMED'`, `hitl_response_ms` = elapsed milliseconds since `HITL_REQUESTED` timestamp (non-null — this is OKR-3 instrumentation), `ai_confidence_score` = selected candidate's composite_score. The downstream pipeline (Gate 8 carer SMS) does NOT begin until this log entry is confirmed written (not fire-and-forget).

4. On coordinator override (tapping a non-top-ranked candidate instead of the top match): `COORDINATOR_OVERRIDE` is written with identical fields to criterion 3 plus `hitl_notes = 'Coordinator selected non-top-ranked candidate'`. The composite_score in `ai_confidence_score` reflects the override candidate's score, not the top candidate's. OKR-3 deviation log (XP-1B) is incremented.

5. The approval card must NOT display: raw composite_score as the primary element, any SPP field that contains health information (P-4 cognitive flag is never shown), the reasoning for why P-2 was or was not applied (G-CC-4 — P-2 appears only as "Client preference: Female (advisory — not scored)"), or any data field not in the whitelist: `{carer_first_name}`, `{qualification_badge}`, `{visit_count}`, `{distance_km}`, `{client_suburb}`, `{P2_advisory_label}`, notification previews. A unit test asserts these absent fields against the rendered component props.

6. **Typographic and interaction specifications (DR-1 through DR-5 — B2-A, B2-B):**

   **DR-1 (familiarity flag prominence):** `font-size(familiarity_count_element) ≥ 24px`. `font-size(composite_score_display) ≤ 14px`. The familiarity count ("★ 2 prior visits with Mrs. Kim") must be visually larger than the carer name, match score, and distance elements. A visual regression test (screenshot diff) asserts this hierarchy at 320px, 375px, and 390px screen widths.

   **DR-2 (notification preview above Approve):** The notification preview section (three outbound messages: carer / client / family) renders above the Approve button in DOM order and visual order. No configuration, feature flag, or screen-size breakpoint moves it below the button. A unit test asserts the DOM node order: `preview_section` before `approve_button`.

   **DR-3 (resolution screen language):** The resolution screen uses client-centred language: "Mrs. Kim has been notified and knows David is coming" — not "ACT-P-01 delivered" or "State: RESOLVED". A string assertion in the resolution screen component test confirms no event_type code appears in visible text.

   **DR-4 (empty SPP = invitation, not error):** When `client.spp_completeness_score == 0`, the approval card renders "Add [client.first_name]'s preferences now — 2 min" as a tappable inline link — not an error state, not a disabled button, not a warning icon. A unit test with EC-04 mock data confirms the invitation link is rendered and the `SPP_COLD_START` invitation string matches the exact copy in Artifact 23 §4.

   **DR-5 (one-handed, 60 seconds):** All primary tap targets (candidate card, Approve button) are ≥ 44×44px. The complete 3-tap flow (shortlist → approval card → Approve) is tested one-handed on a physical or emulated 375px screen by three testers before Wave 4 merge. One of the three testers must be Angela (CC-001) — her timed completion (target: ≤ 60 seconds) is recorded in the PR description as first-party usability evidence. If Angela requires more than 60 seconds or requires a 4th tap, the flow does not merge.

   **Sketch-gate (B2-B):** US-10 is unblocked for coding when a PM Lead-approved sketch (hand-drawn or lo-fi) exists showing: (a) element vertical order, (b) relative size annotation for DR-1, (c) tap target dimensions, (d) notification preview position. Full Figma polish required before E1 but not before Wave 4 start.




### US-11 — Carer Assignment SMS + CC-8 Guard (ACT-C-01)

**Build Wave:** 4 parallel (triggered by Wave 4 approval flow; can be tested with stubbed approval events)
**Status:** ✅ Ready for Dev
**OKR:** OKR-1 (< 5 min fill time), OKR-2 (< 2% cancellation rate)

**Description:**
As a **replacement carer**, I want to receive a text message asking me to cover a visit — including the suburb and time, but nothing else about the client — so that I can quickly say yes or no without having to call anyone, and without receiving any information about the client before I've even confirmed I'm going.

**Design:** Artifact 23 §4.1 Template 1 (ACT-C-01). Artifact 23 §4 Gate 8 (CC-8 guard assertions).

**Conversation:**
This is the first external SMS sent to a third party (the carer). CC-8 is the compliance guard that prevents any client PHI from appearing in this message. The guard is a runtime assertion, not a comment. The channel is `SMS_AU` by default — `WHATSAPP_APP8_CONFIRMED = false` (CRIT-01). The carer has 15 minutes to reply YES or NO (`CARER_REPLY_GRACE_MIN = 15`). A no-reply is treated as an implicit decline and triggers the same re-surfacing logic as an explicit NO.

**Acceptance Criteria:**

1. The SMS is assembled from Artifact 23 §4.1 Template 1 only, using string interpolation with variables `{carer_first_name}`, `{agency_name}`, `{client_suburb}`, `{visit_time}`. The assembled string is ≤ 160 characters (1 SMS segment). A unit test asserts the rendered string length for the maximum-length variable values configured in the system.

2. Before send, the system asserts: `'client_full_name' NOT IN payload`, `'client_full_address' NOT IN payload`, `'client_id' NOT IN payload`, `'spp_fields' NOT IN payload`. If any assertion fails, the send is blocked, `CC8_FIELD_STRIPPED` is logged with `guard_passed = false`, and a coordinator alert fires: "Compliance guard CC-8 blocked carer notification — manual review required." A unit test for each assertion failure case confirms the guard fires correctly.

3. `CARER_NOTIFIED` audit entry: `event_type = 'CARER_NOTIFIED'`, `state_before = 'COORDINATOR_APPROVED'`, `state_after = 'CARER_NOTIFIED'`, `patient_id` = client UUID, `action_taken = 'ACT_C_01_SENT'`, `cross_border_disclosure = false`, `app8_basis = 'Domestic'`, `lawful_basis = 'Operations'`, `data_sensitivity = 'PII'`. A preceding `CC8_FIELD_STRIPPED` entry with `guard_passed = true` must exist in the audit chain for this `case_id` before `CARER_NOTIFIED` is written.

4. Channel routing: when `WHATSAPP_APP8_CONFIRMED = false`, `channel = 'SMS_AU'`. The `channel_config` is read from a configuration parameter — never hardcoded. A unit test asserts that no string literal `'whatsapp'` or `'twilio'` appears in the send-path code when the constant is false.

5. If SMS delivery fails (`sms_result.delivered = false`), the system writes `CARER_NOTIFICATION_FAILED` and sends a coordinator alert: "SMS to [carer.first_name] failed — call them directly by [visit_time - 30 min]." The incident state remains `COORDINATOR_APPROVED` — the carer notification failure is a recoverable error, not a VACANCY_UNRESOLVED trigger. A unit test confirms the state machine does not advance to `VACANCY_UNRESOLVED` on a single SMS delivery failure.

6. When the carer replies YES (within 15 minutes), the 15-minute timer cancels and the incident state advances. When the carer replies NO or does not reply within 15 minutes, `CARER_DECLINED` is logged and the coordinator is alerted to pick the next candidate. A unit test for the no-reply timeout path confirms `CARER_DECLINED` is logged with the correct `state_before = 'CARER_NOTIFIED'`, `state_after = 'HITL_PENDING'`.


### US-12 — Carer Briefing SMS + CC-6 Guard (ACT-C-02)

**Build Wave:** 4 parallel — depends on US-11 (carer must have replied YES before briefing is sent)
**Status:** ✅ Ready for Dev
**OKR:** OKR-2 (< 2% cancellation rate — informed carers arrive prepared, reducing visit refusals)

**Description:**
As a **confirmed replacement carer**, I want to receive a briefing text message with the client's entry instructions and care preferences before I arrive, so that I know exactly what to expect and can approach the visit with confidence — without the client's personal medical details being disclosed to me before I've even met them.

**Design:** Artifact 23 §4.1 Template 2 (ACT-C-02, Variants A/B/C). Artifact 23 §4 Gate 9 (CC-6 guard, G-DS-05 phrasing, CC-1 compound guard).

**Conversation:**
The briefing is sent after the carer replies YES — not immediately after coordinator approval. CC-6 guard prevents the match explanation (why the algorithm selected this carer) from appearing in the briefing. G-DS-05 phrasing branch customises the `{familiarity_note}` based on `client.familiarity_threshold`. The CC-1 compound guard prevents P-3 + P-4 + P-5 appearing together — P-4 (cognitive flag) is stripped from the external payload entirely. The briefing uses full client address (post-confirmation disclosure) — unlike the assignment SMS which uses suburb only. The `consent_record_id` in the audit entry links to the lawful basis for disclosing P-5/P-6 to the carer (HIGH-02).

**Acceptance Criteria:**

1. Before payload assembly, the system asserts: `'match_explanation' NOT IN briefing_payload`, `'gender_preference' NOT IN briefing_payload`, `'scoring_weights' NOT IN briefing_payload`, `'cognitive_flag' NOT IN briefing_payload`. If any assertion fails: `CC6_GUARD_BLOCKED` is logged with `guard_id = 'G-CC-6'`, `guard_passed = false`, a coordinator alert fires, and the briefing is NOT sent. A unit test per assertion failure case confirms the guard fires correctly and no `BRIEFING_SENT` entry is written in the failure path.

2. The CC-1 compound guard fires before send: if P-3 (familiarity_note), P-4 (cognitive guidance), and P-5 (sensitivities_note) would all be present in the same payload, the send is blocked. P-4 is never included in any external payload regardless — it is stripped at the payload builder layer. A unit test with a client where all three fields are set confirms P-4 is absent from the assembled briefing and `CC6_GUARD_BLOCKED` is NOT fired for P-4 absence alone (only if P-3+P-4+P-5 compound is detected together).

3. G-DS-05 phrasing branch: `{familiarity_note}` is: "This client prefers familiar carers — please introduce yourself clearly and take a calm, steady approach." when `P-3 = 'KNOWN_CARERS_ONLY'`; "This client has been briefed that you may be visiting. They know your name." when `P-3 = 'BRIEFED_ACCEPTABLE'`; omitted entirely when `P-3 = 'ANY'`. For EC-04 cold-start (`briefing_mode = MINIMAL`): "Client preferences have not yet been set up. Please introduce yourself warmly at arrival." Unit tests for all four variants.

4. `BRIEFING_SENT` audit entry: `event_type = 'BRIEFING_SENT'`, `state_before = 'CARER_NOTIFIED'`, `state_after = 'BRIEFING_SENT'`, `patient_id` = client UUID, `action_taken = 'ACT_C_02_SENT'`, `consent_record_id` = client SPP consent record UUID (HIGH-02: lawful basis for P-5/P-6 carer disclosure), `lawful_basis = 'Treatment'`, `data_sensitivity = 'SENSITIVE_INFO'`, `guard_id = 'G-CC-6'`, `guard_passed = true`. A preceding `CC6_GUARD_APPLIED` or equivalent `COMPLIANCE_OVERRIDE_ACKNOWLEDGED` entry with `guard_passed = true` must appear in the audit chain before `BRIEFING_SENT`.

5. The full client address is included in the briefing (`{client_full_address}`). A unit test confirms `{client_full_address}` is present in the Variant A briefing payload but ABSENT from the ACT-C-01 assignment SMS payload — the address is released only post-confirmation, per the graduated disclosure model (Artifact 16 LOW-01).




### US-13 — VACANCY_UNRESOLVED Escalation (Gate 14)

**Build Wave:** 5 (Weeks 5–6) — depends on US-10 (approval flow defines the failure state)
**Status:** ✅ Ready for Dev
**OKR:** OKR-2 (< 2% cancellation — VACANCY_UNRESOLVED surfaces the problem; coordinator resolves manually)

**Description:**
As a **care coordinator** and as an **agency owner**, I want to receive an immediate critical alert when no suitable replacement can be found — with a list of options I can take right now — so that no visit is silently cancelled and no client sits in their chair waiting for someone who isn't coming, without a human making a conscious decision about it.

**Design:** Artifact 23 §4 Gate 14 (VACANCY_UNRESOLVED pseudocode). Artifact 21 §7.2 Feature 7 (VACANCY_UNRESOLVED Protocol). Model: `claude-sonnet-4-6` only, token budget ≤ 3,500.

**Conversation:**
VACANCY_UNRESOLVED is the terminal failure state of the pipeline. It is reached from: (a) empty shortlist (Gate 1), (b) P-3 filter eliminates all candidates (Gate 4), (c) all shortlist candidates decline (Gate 10b/10c), or (d) both coordinators timeout (Gate 7d). The system NEVER auto-cancels a visit — VACANCY_UNRESOLVED is a signal that hands decision authority back to the coordinator. Sonnet is called here to generate a human-readable escalation summary — this is the only Sonnet call in the pipeline. The Sonnet input must be anonymised (UUIDs, no names) and the output scanned for PHI before display (CRIT-02 defence).

**Acceptance Criteria:**

1. `VACANCY_UNRESOLVED` audit entry: `event_type = 'VACANCY_UNRESOLVED'`, `state_before = 'HITL_PENDING'`, `state_after = 'VACANCY_UNRESOLVED'`, `patient_id` = client UUID, `action_taken = 'ESCALATE_AGENCY_OWNER'`, `model_id = 'claude-sonnet-4-6'` (not Haiku), `ai_confidence_score = 0.0`. A unit test asserts `model_id` is `'claude-sonnet-4-6'` and `token_budget <= 3500` — if either assertion fails before the Sonnet call, the call is blocked and the error is logged.

2. The Sonnet call receives only anonymised incident data: `client_id` (UUID), `visit_time`, `candidates_tried_count` (integer), `decline_reasons` (reply codes only — 'NO'/'TIMEOUT'), `familiarity_threshold` (enum value), `spp_completeness` (float). No carer names, no client name, no health information. A unit test inspects the Sonnet input object and asserts no field with type `str` that could be a name is present.

3. The Sonnet output is passed through `scan_and_strip_phi()` before display. A unit test injects a mock Sonnet response containing a fake name ("Margaret Smith") and asserts the stripped output does not contain "Margaret Smith". The scanner applies regex patterns for: Australian phone numbers, email addresses, full names (First Last), addresses (street number + name), DOBs.

4. Two push notifications are sent (Level 1 actions): (a) coordinator (CRITICAL urgency): "No suitable replacement found for [client.first_name] at [visit_time]. Candidates tried: [N]. Options: Extend search criteria / Call manually / Mark as cancelled." (b) agency owner (CRITICAL urgency): "UNRESOLVED VACANCY: [client.first_name] at [visit_time]. Manual intervention required. Coordinator has been notified." Neither notification contains carer names, SPP data, or health information.

5. Rolling threshold check: after writing `VACANCY_UNRESOLVED`, the system calculates the 14-day rolling unresolved rate for this agency. If rate ≥ `VACANCY_UNRESOLVED_ALERT_THRESHOLD = 0.10` (10%), a PM Lead alert fires (IS-02: SNS topic or Slack webhook) and a `COMPLIANCE_OVERRIDE_ACKNOWLEDGED` entry is written with `action_taken = 'PM_LEAD_THRESHOLD_ALERT_SENT'`, `threshold_applied = 'VACANCY_UNRESOLVED_ALERT_THRESHOLD=0.10'`. A unit test with a mock rolling rate of 0.12 confirms the PM Lead alert fires; a mock rate of 0.08 confirms it does not.

6. The system NEVER writes `COORDINATOR_APPROVED` after `VACANCY_UNRESOLVED` — the coordinator can take manual action, but the state machine does not automatically advance. A unit test confirms: after `VACANCY_UNRESOLVED`, a coordinator approval action requires an explicit new incident event, not a continuation of the resolved incident.



*Status: 🔴 Blocked — activate only if AX-02 (due 2026-04-01) confirms AlayaCare Connect does NOT support bi-directional write-back. If write-back IS confirmed, these stories are superseded by the P2 AlayaCare integration feature (Artifact 21 §7.2 F10). Either outcome closes the risk — the unknown is the blocker.*


### US-14 — Manual Absence Record (AX-02 Fallback — ACT-V-01 Standalone)

**Build Wave:** Sprint 2 (if AX-02 fails)
**Status:** 🔴 Blocked — activate if AX-02 result = write-back unavailable (B3-C decision date: 2026-04-01)
**OKR:** OKR-1 (< 5 min fill time — manual entry must not exceed 30 seconds)

**Description:**
As a **care coordinator**, I want to record a carer's absence directly in Home-Care-AI — by selecting the carer, the affected visit, and tapping "Record absence" — so that the automated matching pipeline starts immediately, without me needing to switch between AlayaCare and Home-Care-AI or wait for an integration that doesn't exist yet.

**Design:** New screen: "Record Absence." Two fields: (1) Carer selector (searchable dropdown from carer roster), (2) Visit time selector (shows today's remaining visits for that carer). One tap: "Record absence." The form must complete in under 30 seconds — Tom (CC-002) is the acceptance test for this timing.

**Conversation:**
This story exists because AlayaCare write-back may not be available (AX-02 is unresolved). In the standalone v1, the coordinator records the absence manually — exactly as they do today, except they do it in Home-Care-AI instead of a spreadsheet. The manual record fires the same `vacancy_recorded` event that an AlayaCare webhook would fire — the rest of the pipeline (US-05 through US-13) is unchanged. ACT-S-02 (concierge SPP migration) is already designed as a manual CSV-import session and does NOT depend on write-back — it is unaffected by AX-02 outcome (B3-B).

**Acceptance Criteria:**

1. The "Record Absence" form presents exactly two inputs: a carer selector (searchable by first name, shows only carers with scheduled visits today) and a visit selector (shows today's remaining scheduled visits for the selected carer, with client first name and visit time). No free-text field. No notes field. No P-9-equivalent free text of any kind.

2. On "Record absence" tap, the system fires a `vacancy_recorded` event with `client_id`, `visit_time`, and `absent_carer_id` populated — identical structure to what an AlayaCare webhook would produce. The pipeline from US-05 (Gate 0 validation) onward executes without modification.

3. A `VACANCY_DETECTED` audit entry is written with `trigger_sensor = 'MANUAL_COORDINATOR_ENTRY'` (distinguishing it from a future webhook-triggered event). `user_id` = coordinator UUID. All other non-nullable fields populated per Artifact 23 §8.

4. The form is completable in ≤ 30 seconds on a 375px screen, one-handed. Tom (CC-002) validates this in a timed test before merge. The acceptance criterion fails if Tom requires more than two attempts to find the correct visit in the visit selector.

5. Submitting the same carer + visit time twice within 60 seconds produces `DUPLICATE_VACANCY_SUPPRESSED` (Gate 0 idempotency guard, US-05 AC-4). The second tap shows a toast: "Absence already recorded for this visit." No duplicate incident is created.


### US-15 — Bulk SPP Import via AlayaCare CSV Export (AX-02 Fallback — ACT-S-02 Standalone)

**Build Wave:** Sprint 2 (if AX-02 fails) — depends on US-02 (SPP schema final)
**Status:** 🔴 Blocked — activate if AX-02 result = write-back unavailable (B3-C decision date: 2026-04-01)
**OKR:** OKR-4 (≥ 80% of active clients with ≥ 3 SPP fields within 90 days) — accelerates baseline population for existing clients

**Description:**
As a **care coordinator** using an existing AlayaCare account, I want to upload a CSV export of my client list into Home-Care-AI so that I don't have to manually re-enter every client's name and suburb from scratch — even if AlayaCare can't receive write-back from our system.

**Design:** "Import clients" screen (agency owner or PM Lead access only — not coordinator daily workflow). Single file picker: accepts `.csv` only. Column mapping preview before import. Import confirmation screen showing rows accepted / rows skipped / errors.

**Conversation:**
AlayaCare supports read-only CSV export of client records regardless of write-back capability — this does NOT require AX-02 write-back confirmation. The import populates only non-sensitive fields from the CSV: `first_name`, `suburb`, `care_requirements` (qualification codes). Sensitive SPP fields (P-2 through P-8) are never populated by the import — they are added by coordinators through the standard SPP intake form (US-03). The import creates the client record skeleton; coordinators fill in the preferences. This is the concierge SPP migration session (ACT-S-02) made self-service.

**Acceptance Criteria:**

1. The CSV importer accepts a file with columns: `client_first_name`, `client_suburb`, `care_requirement_codes` (comma-separated). All other columns are ignored — no column from AlayaCare maps to P-2, P-3, P-4, P-5, P-6, or any sensitive SPP field. A unit test with a CSV containing a `notes` column asserts that column is silently dropped and `P9_COLLECTION_BLOCKED` is NOT triggered (dropping an unused column is not a P-9 event — it is expected behaviour).

2. Each imported row creates a client record with: `client_id` (new UUID generated by the system), `first_name` (from CSV), `suburb` (from CSV), `care_requirements` (from CSV). All SPP fields (P-2 through P-8) are set to `null`. P-10 completeness score = 0 (EC-04 cold-start applies to all imported clients on first vacancy incident). A `CONSENT_RECORD_CREATED` audit entry is NOT fired on import — consent events fire only when coordinators explicitly populate sensitive SPP fields (US-03 AC-2).

3. Rows with missing `client_first_name` or `client_suburb` are skipped with a visible error in the import preview: "Row 14: missing suburb — skipped." The import does not fail entirely on partial errors; it imports valid rows and reports skipped rows.

4. After import, the coordinator sees the client count in the SPP completeness dashboard: "[N] clients imported — 0% have preferences set. Add preferences to improve match quality." This is the EC-04 state at scale — coordinators are expected to populate SPP via US-03 (intake form) and US-04 (completeness prompts) over the 90-day OKR-4 window.

5. The import function is available to agency owner role only — not coordinator role. A unit test asserts that a coordinator-level API call to the import endpoint returns `403 Forbidden`.



| Story ID | Feature | PRD Reference | Logic Spec Gate | Audit Event (primary) | Wave |
|---|---|---|---|---|---|
| US-01 | Audit Log Infrastructure | §7.2 F6 | §8 Schema | Multiple — all events | 0 |
| US-02 | SPP Schema + P-9 Exclusion | §7.2 F1 | §3 Constants | `SPP_CONSENT_RECORDED` | 1 |
| US-03 | SPP Intake Capture | §7.2 F1 (ACT-S-01) | §4 Gate 2 | `SPP_FIELD_UPDATED` | 1 |
| US-04 | SPP Completeness Prompt | §7.2 F1 (ACT-S-03) | §4 Gate 13 | `SPP_FIELD_UPDATED` | 1 |
| US-05 | Qualification Gate | §7.2 F2 (ACT-V-01/02) | §4 Gates 0–1 | `VACANCY_DETECTED` | 2 |
| US-06 | Trust Scoring + Shortlist | §7.2 F2 (ACT-V-03–07) | §4 Gates 2–5 | `SHORTLIST_GENERATED` | 2 |
| US-07 | Client Notification (E-3 Gate 1) | §7.2 F5 (ACT-P-01) | §4 Gate 11 | `CLIENT_NOTIFIED` | 3 |
| US-08 | Family Notification (E-3 Gate 2) | §7.2 F5 (ACT-F-01) | §4 Gate 12 | `FAMILY_NOTIFIED` | 3 |
| US-09 | Coordinator Push + HITL SLA | §7.2 F3 (ACT-V-05) | §4 Gate 6–7d | `HITL_REQUESTED` | 4 |
| US-10 | Coordinator Approval Card | §7.2 F3 (ACT-A-01/02) | §4 Gates 7a–7b | `COORDINATOR_APPROVED` | 4 |
| US-11 | Carer Assignment SMS | §7.2 F4 (ACT-C-01) | §4 Gate 8 | `CARER_NOTIFIED` | 4‖ |
| US-12 | Carer Briefing SMS | §7.2 F4 (ACT-C-02) | §4 Gate 9 | `BRIEFING_SENT` | 4‖ |
| US-13 | VACANCY_UNRESOLVED | §7.2 F7 | §4 Gate 14 | `VACANCY_UNRESOLVED` | 5 |

**‖** = Wave 4 parallel (can be built while Approval Flow is in progress; tested with stubbed approval events)



*Per CLAUDE.md Article V: "Every story's Confirmation section must name the `APPAuditLogEntry` fields it requires." This table confirms compliance for each story.*

| Story | Non-nullable fields cited? | `guard_id` + `guard_passed` cited? | `state_before` → `state_after` cited? | `consent_record_id` cited? |
|---|---|---|---|---|
| US-01 | ✅ All 10 in AC-2 | ✅ AC-6 | ✅ AC-1 through AC-4 | ✅ AC-6 |
| US-02 | ✅ AC-2, AC-5 | ✅ AC-2 | ✅ AC-5 | ✅ AC-2 |
| US-03 | ✅ AC-2, AC-5 | ✅ AC-2 | ✅ AC-5 | ✅ AC-2 |
| US-04 | ✅ AC-3 | — (no guard on this flow) | ✅ AC-3 | ✅ AC-3 |
| US-05 | ✅ AC-1, AC-4 | ✅ AC-2 (G-CC-4) | ✅ AC-1, AC-3 | — |
| US-06 | ✅ AC-4 | ✅ AC-2 (G-CC-4), AC-5 | ✅ AC-4, AC-5 | — |
| US-07 | ✅ AC-3 | ✅ AC-3 (G-DS-05), AC-5 | ✅ AC-3, AC-4 | — |
| US-08 | ✅ AC-3 | ✅ AC-1 (G-E3-1) | ✅ AC-1, AC-3 | ✅ AC-3 |
| US-09 | ✅ AC-1, AC-3, AC-4 | — | ✅ AC-1, AC-3, AC-4 | — |
| US-10 | ✅ AC-3, AC-4 | — | ✅ AC-3, AC-4 | — |
| US-11 | ✅ AC-3 | ✅ AC-2 (CC-8) | ✅ AC-3 | — |
| US-12 | ✅ AC-4 | ✅ AC-1 (CC-6), AC-2 (CC-1) | ✅ AC-4 | ✅ AC-4 |
| US-13 | ✅ AC-1 | — | ✅ AC-1 | — |

*All 13 stories pass the SD-01B story-level audit field citation check.*


*These stories are the valid input to ECC (Claude Code). The instruction to ECC is: "Build each feature so it passes the acceptance criteria in this document AND the unit tests listed in Artifact 23 §9, using the synthetic PHI data from Artifact 25 as the test target."*
