# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Discovery/Artifact_5_OST.md
# Generated: 2026-07-31T00:49:45.128Z

**Project:** Home-Care-AI
**Stage:** Discovery → Stage 3 (Opportunity Mapping)
**Skill:** opportunity-solution-tree
**Date:** 2026-03-26
**Methodology:** Teresa Torres, *Continuous Discovery Habits* — 4-level OST
**Beachhead Segment:** Care Coordinator (CC)
**Input Artifacts:** 2a (HCN), 2b (FC), 2c (CC), 2d (SR), 3 (Competitive Gap Analysis, amended), 4 (Market Segmentation)
**Feeds into:** Artifact 6 — Brainstorm Ideas (New Product)



> **"Care coordinators confidently fill every vacant visit with the right person for that patient — one approval click, zero phone calls, no father sitting in a chair — while maintaining full institutional knowledge of every client's preferences, continuity history, and trust relationships."**
> — Synthesised from Angela (CC-001) and Tom (CC-002)

### Measurable Success Metrics

| Metric | Baseline (Current) | Target |
|---|---|---|
| Vacant visit cancellation rate | ~20% (Tom, CC-002 — estimated 1–2/week at 25 clients) | < 2% |
| Coordinator time-to-fill per incident | 30–60 min (11 phone calls) | < 5 min (one approval action) |
| Client soft preference documentation coverage | ~0% (sticky notes / coordinator memory) | ≥ 95% of active clients |
| Family notification rate on schedule change | Ad hoc / manual (often zero) | 100% automated on confirmed change |
| Compliance gap visibility | None — "vague anxiety, no list" | Live prioritised dashboard, 0 audit surprises |

### Rationale for Beachhead Selection

CC was selected as Beachhead over higher raw-composite segments (FC: 648, HCN: 567) because:
1. **Purchasing authority** — CC is the agency's operational buyer. CC adoption is the agency acquisition event. HCN and FC value is downstream of CC adoption.
2. **Right to Win** — CC has no dedicated AI smart-matching competitor. AlayaCare's Vacant Visit Agent exists but lacks soft preference logic (trust, continuity, patient-specific protocols).
3. **Network unlock** — solving for CC creates the structured data (SPP, visit records, continuity history) that unlocks HCN clinical intelligence and FC family communication features.

*Per CLAUDE.md Article III: only CC enters the OST as the primary segment. HCN, FC, SR opportunities are logged at Level 2 but receive no solution branches until the Beachhead is validated.*



### Scoring Formula

**Opportunity Score = Importance_norm × (1 − Satisfaction_norm)**

Where Importance and Satisfaction are normalised to 0–1 (raw score ÷ 10). Evidence source: Artifacts 2a–2d verbatim.


### 2A — Primary CC Opportunities (Solution Branches Generated)


#### O1 — Vacancy Cascade: No Matching Logic

**"When a carer calls in sick, I'm making eleven phone calls. I find a replacement for two of the three visits. The third has to be cancelled."** — Angela, CC-001

| Scoring Dimension | Raw Score | Normalised | Workings |
|---|---|---|---|
| Importance | 9 / 10 | 0.90 | Critical — each cancellation = missed care + reputational risk + potential client loss. ~3 incidents/week at Angela's scale. |
| Satisfaction | 1 / 10 | 0.10 | Entirely manual (11 calls, 30–60 min). 20% of incidents end in cancellation. Zero matching logic in any tool used. |
| **Opportunity Score** | — | **0.81** | 0.90 × (1 − 0.10) = **0.81** |

**Capability:** #5 — Vacant Visit Smart Matching
**Frequency:** ~3 incidents/week (Angela); ~1–2/week (Tom) — daily operational problem
**Cost of failure:** Tom's Henderson family loss; Angela's three-cancelled-visit week; clinical risk from missed care; revenue loss (unbillable visit)


#### O2 — Soft Preference Knowledge Fragility

**"None of this is documented anywhere. If I get hit by a bus tomorrow, half the knowledge about our clients walks out the door with me. Actually, that scares me."** — Angela, CC-001

| Scoring Dimension | Raw Score | Normalised | Workings |
|---|---|---|---|
| Importance | 9 / 10 | 0.90 | Critical — incorrect match → client distress (Mrs. Henderson), visit refusal (Lin Chen), client loss. This is a business continuity risk and a care quality risk simultaneously. |
| Satisfaction | 1 / 10 | 0.10 | Knowledge lives in sticky notes (Angela) or implicit in Google Sheets workflow (Tom). Not queryable, not transferable, not survivable. |
| **Opportunity Score** | — | **0.81** | 0.90 × (1 − 0.10) = **0.81** |

**Capability:** #5 — Vacant Visit Smart Matching (preference layer) + #2 — AI-Assisted Care Plan Recommendation
**Frequency:** Latent — every replacement decision draws on this knowledge gap
**Cost of failure:** Henderson family ($2,400–4,800 annual revenue + reputation); Lin Chen refusal (visit not delivered); Arthur Kovacs distress (escalation required)


#### O3 — Family Notification Gap

**"Sometimes they find out because nobody shows up. A family called me at nine AM asking why nobody came for their father's eight AM visit."** — Tom, CC-002

| Scoring Dimension | Raw Score | Normalised | Workings |
|---|---|---|---|
| Importance | 8 / 10 | 0.80 | High — family discovers cancellation when client is already sitting in a chair, dressed, waiting. Triggers fury, distress, reputation damage. Direct churn driver. |
| Satisfaction | 1 / 10 | 0.10 | Notification is coordinator-manual only. When coordinator is managing a crisis (the exact moment notification is most needed), notification is the first thing dropped. |
| **Opportunity Score** | — | **0.72** | 0.80 × (1 − 0.10) = **0.72** |

**Capability:** #4 — Clinically-Interpreted Family / Patient Communication
**Frequency:** Every vacancy incident that reaches cancellation or replacement — same ~3/week frequency as O1
**Cost of failure:** Client sitting alone waiting; family loss of trust; agency reputation damage; downstream churn


#### O4 — Compliance Drift Without Visibility

**"I know there are care plans overdue for review. I can feel it. But I can't quantify them because the system doesn't flag overdue items."** — Angela, CC-001

**"I have a calendar reminder that I snooze more often than I act on. I can feel things slipping through but I can't see them. It's a vague anxiety with no specifics."** — Tom, CC-002

| Scoring Dimension | Raw Score | Normalised | Workings |
|---|---|---|---|
| Importance | 7 / 10 | 0.70 | High — compliance failures create regulatory risk (Angela's audit in 6 weeks) and clinical risk (care plan gaps → missed deterioration). Chronic exposure becomes acute at audit time. |
| Satisfaction | 1 / 10 | 0.10 | No coordinator has a system that flags overdue items. Both rely on memory and snoozed reminders. Zero proactive compliance management. |
| **Opportunity Score** | — | **0.63** | 0.70 × (1 − 0.10) = **0.63** |

**Capability:** #1 — Predictive Risk / Longitudinal Pattern Detection (compliance dimension) + #2 — AI-Assisted Care Plan Recommendation
**Urgency signal:** Angela's compliance audit ~2026-05-12 (6 weeks from discovery interview)
**Cost of failure:** Regulatory finding → corrective action plan → potential registration impact; clinical gap → adverse event


### 2B — Secondary Segment Opportunities (Logged — No Solution Branches at This Stage)

*Per CLAUDE.md Article III: secondary segment opportunities are logged here and enter the OST as future nodes once the Beachhead is validated. Opportunity Scores are calculated for sequencing reference.*

| ID | Segment | Opportunity | Importance | Satisfaction | Score | Capability | Entry Condition |
|---|---|---|---|---|---|---|---|
| O5 | HCN | Longitudinal pattern detection impossible at scale — "I catch sixty percent of meaningful trends. Margaret was in the forty percent." (Priya, HCN-003) | 9/10 | 2/10 | **0.72** | #1 | After CC Beachhead validated — HCN agency adoption unlocks clinical data volume needed for pattern engine |
| O6 | FC | Family receives raw data, not a clinical verdict — "A verdict. Not a graph." (Sarah, FC-001) | 9/10 | 1/10 | **0.81** | #4 | After CC + HCN adoption — FC value depends on clinical triage being in place (HCN HITL verdict before family notification) |
| O7 | HCN | Field documentation requires 2–3 hrs post-visit reconstruction — "I sit at my kitchen table at 10 PM trying to remember what I observed at 2 PM." (Maria, HCN-001) | 8/10 | 2/10 | **0.64** | #3 | After CC Beachhead — HCN champions tool adoption; requires agency purchase decision |
| O8 | HCN | Care plans blank — no clinical guidance — "Copy forward or start from scratch. Neither is good." (David, HCN-002) | 7/10 | 2/10 | **0.56** | #2 | Same as O7 — HCN segment entry after Beachhead validation |
| O9 | SR | Patient is last to know about AI inferences — "He didn't find out about the AI flag from me. He found out because his son phoned him in a panic." (Arthur, SR-002) | 9/10 | 0/10 | **0.90** | Cross-cutting (AI Trust) | Hard design constraint, not a solution node — see AI Trust Architecture section below |

> **Note on O9:** Arthur Kovacs' "performing wellness" incident is not a solvable opportunity — it is a design constraint that governs notification routing architecture across all capabilities. It is documented in Artifact 3 Section 6 (Cross-Cutting Design Constraint) and must appear in `agentic-logic-spec` as a structural requirement, not a backlog item.


### 2C — Opportunity Priority Ranking (CC Primary)

| Rank | ID | Opportunity | Score | Capability | Action |
|---|---|---|---|---|---|
| 1 (tied) | O1 | Vacancy Cascade — No Matching Logic | **0.81** | #5 | ✅ Solutions + Experiments in this artifact |
| 1 (tied) | O2 | Soft Preference Knowledge Fragility | **0.81** | #5 + #2 | ✅ Solutions + Experiments in this artifact |
| 3 | O3 | Family Notification Gap | **0.72** | #4 | ✅ Solutions in this artifact; Experiment deferred to post-O1/O2 validation |
| 4 | O4 | Compliance Drift Without Visibility | **0.63** | #1 + #2 | Solutions in this artifact; Experiments after O1/O2/O3 |

*O1 and O2 are treated as a single integrated cluster because O2 (preference knowledge) is a prerequisite for O1 (matching quality). The system that finds replacements is only as good as the preference data it draws on.*



### O1 + O2 Cluster — Smart Replacement Matching + Preference Knowledge Engine

*These two opportunities are architected as one integrated solution set. The matching engine (O1) draws on the preference knowledge graph (O2). Solutions are generated from all three Product Trio perspectives.*


#### S1 — Automated Vacancy Detection + Smart Replacement Proposal Engine [PM Lens]

**What it does:** On absence_recorded event, system automatically queries staff availability, qualification match, proximity, and Soft Preference Profile (SPP) score. Surfaces ranked shortlist of 3 replacement candidates to coordinator within 60 seconds. Coordinator reviews and approves. System notifies replacement carer, client, and family in one action.

**Why it addresses O1 + O2:** Reduces 11 phone calls to 1 approval tap. Embeds preference matching (O2) as a first-class ranking parameter — not an afterthought.

**Critical requirement:** Must support coordinator override — coordinator judgment on any ranked candidate must be possible without friction. System proposes; human decides.

**Assumptions to test:**
- Staff availability is queryable in near-real-time (requires availability data to be structured and current)
- SPP completeness is sufficient to differentiate candidates (requires O2 data capture first)
- Coordinator trusts a machine-ranked shortlist enough to approve without calling each candidate directly


#### S2 — Soft Preference Profile (SPP) per Client [PM Lens]

**What it does:** Structured per-client record capturing: carer gender preference, familiarity threshold (known-only / briefed-acceptable / any), dementia briefing requirements, personal triggers (do not move Arthur's things), refusal conditions (Lin Chen refuses unrecognised entry), continuity history (who has visited before + outcome rating), and free-text notes.

**Why it addresses O2:** Converts Angela's sticky-note knowledge from a fragile single-point-of-failure into a queryable, transferable, version-controlled institutional asset. Survives coordinator turnover.

**Version control requirement:** SPP must be append-only for audit purposes — changes are logged with timestamp and editor_id, not overwritten.

**Assumptions to test:**
- Angela can articulate her sticky-note knowledge in a structured form (not just narrative)
- Coordinators will maintain SPPs over time, not just at onboarding
- SPP completeness is achievable within first 30 days without dedicated migration effort


#### S3 — One-Click Approval Card UI [Designer Lens]

**What it does:** Coordinator receives a push notification: "Jenny called in sick. Here are 3 replacements for her 8 AM visit." Each candidate displayed as a card: match score, distance, familiarity flag ("Has met Mrs. Kim before — 2 prior visits"), qualifications badge, availability window. Single "Approve" tap triggers notification to all parties.

**Why it addresses O1:** Reduces coordinator cognitive load from "find → qualify → match → call → confirm → notify" to "review → approve." Estimated reduction: 45 min → <3 min.

**Hesitation design:** If no candidate is above 70% match score, card shows a "Review manually" option — the system acknowledges uncertainty rather than forcing a low-confidence recommendation.

**Assumptions to test:**
- Coordinators will trust the match score enough to approve top-ranked candidates without independent verification
- Card UI with 3 candidates is the right decision surface — not 1 (too prescriptive) or 10 (too overwhelming)
- Push notification at 6:30 AM is an acceptable interruption (vs. SMS, email, in-app only)


#### S4 — Preference Capture Wizard [Designer Lens]

**What it does:** Guided conversational interface — "Tell me about [client's name]." Coordinator narrates (or speaks via voice input). System extracts structured fields from natural language: "Mrs. Kim only wants female carers" → gender_preference: female. "Arthur doesn't like new people but will accept them if they're briefed about not moving his things" → familiarity_threshold: briefed-acceptable; briefing_note: "Do not move Arthur's belongings."

**Why it addresses O2:** Removes the friction of filling structured form fields. Coordinator tells stories; system creates structure. Reduces blank-field anxiety.

**Design constraint:** Must present a "review before saving" step — coordinator must confirm extracted fields before they enter the SPP. AI extraction is a draft, not a fait accompli.

**Assumptions to test:**
- Coordinator narrative input is sufficiently structured for NLP extraction (vs. requiring a human editor)
- Voice input is acceptable in a coordination office environment (Angela) vs. uncomfortable (Tom — sole operator, open office)
- 90-minute migration session with Angela is enough to populate SPP for all 60+ clients


#### S5 — Event-Driven Matching Pipeline [Engineer Lens]

**What it does:** AWS Lambda function triggered by `absence_recorded` event. Queries staff availability index (maintained as a live document, updated by staff via mobile app). Scores candidates against: credential_match (boolean gate), proximity_score (distance API), SPP_match_score (preference graph cosine similarity). Returns ranked list. Push via FCM/APNs to coordinator device. Entire flow: < 30 seconds.

**Why it addresses O1:** Replaces 11 sequential phone calls with one parallel background computation. Availability index must be kept current — this is a data freshness dependency.

**Proven infrastructure:** Lambda + DynamoDB availability index + preference graph (Neo4j or DynamoDB document). No exotic ML required for v1 — rule-based scoring is sufficient. Reserve ML for recommendation refinement in v2.

**Assumptions to test:**
- Staff will update their availability in the app reliably (vs. calling the coordinator — old habit)
- Proximity scoring via Google Maps Distance Matrix API is accurate enough for 30-minute response-window matching
- DynamoDB document model is sufficient for SPP graph queries at 60-client scale, or Neo4j is required from day 1


### O3 — Family Notification Gap


#### S6 — Automated Multi-Channel Family Notification [PM Lens]

**What it does:** On `visit_status_changed` event (cancelled, replaced, delayed), system composes and sends a notification to the registered family contact. Message uses agency-configured template. Delivered via SMS (primary), email (secondary), in-app (optional). Triggered by schedule confirmation — not by coordinator action.

**Key rule:** Notification goes to family *after* coordinator has approved replacement (or confirmed cancellation) — not before. Coordinator is not bypassed; coordinator action triggers the automation.

**Audit requirement:** Every sent notification is logged with `timestamp`, `recipient_id`, `message_template_id`, `delivery_status` — audit trail per HIPAA compliance.

**Assumptions to test:**
- Agencies will configure a notification template once and trust the system to send without review each time
- Family contacts will accept SMS notifications from the agency system (vs. "who is this number?")
- Per-family channel preference (SMS vs. email) is capturable at intake


#### S7 — Notification Preview in Approval Flow [Designer Lens]

**What it does:** When coordinator taps "Approve" on a replacement candidate, they see a preview: "This message will be sent to Margaret Chen (daughter): 'Your mother's scheduled visit on Tuesday at 8:00 AM will be covered by David Kim, who has visited Mrs. Chen before.'" Coordinator confirms with one tap. Message sends. No separate notification management step.

**Why it addresses O3:** Gives coordinator oversight of family communication without making it a separate manual task. Communication quality is preserved; coordinator effort is near-zero.

**Assumptions to test:**
- Coordinator will read the preview before confirming (vs. tapping through)
- Message template is specific enough to feel personal, not generic


#### S8 — Notification Preference Capture at Client Intake [Engineer Lens]

**What it does:** During client onboarding, intake form captures: family contact name, relationship, preferred channel (SMS / email / app), preferred language, notification preferences (all changes vs. cancellations only). Stored per `client_id`. Feeds notification worker at `visit_status_changed` event.

**Assumptions to test:**
- Coordinators will collect and enter notification preferences during intake (vs. retrofitting for existing clients)
- SMS is universally accessible to family contacts across age groups (Rachel's brother in London, James's wife Adama)


### O4 — Compliance Drift Without Visibility


#### S9 — Live Compliance Gap Dashboard [PM Lens]

**What it does:** Real-time dashboard showing: overdue care plan reviews (QA framework: 8-week cycle), expired or expiring credentials (<30 days), visit documentation gaps (visit completed but no clinical note within 24h). Items ranked by severity: Clinical (patient risk) > Regulatory (audit exposure) > Administrative (documentation gap).

**Angela's exact spec:** *"Here are the seventeen things that are out of compliance. Here are the five that are critical."* — the dashboard is this list, live, with one-tap remediation.

**Assumptions to test:**
- Care plan review cycle (8 weeks) is the correct cadence for the QA framework — verify against Angela's specific framework requirements
- Coordinators will act on a ranked list vs. requiring a workflow to be prescribed


#### S10 — Compliance Traffic Light on Client Profile [Designer Lens]

**What it does:** Every client profile shows a compliance status badge — Green (all current), Amber (item due within 14 days), Red (overdue). Dashboard sorts by status. Coordinator taps any Red badge to see the specific overdue item and the remediation path (e.g., "Care plan review overdue — last reviewed 2025-11-14. Schedule review now?").

**Assumptions to test:**
- Red/Amber/Green is intuitive across coordinator experience levels
- Coordinators prefer per-client compliance context (traffic light on profile) over a central list — or do they want both?


#### S11 — Compliance Rule Engine [Engineer Lens]

**What it does:** Cron job (daily, 06:00 UTC) queries: `care_plan_review_date` (flag if > 56 days ago), `credential_expiry_date` (flag if < 30 days), `visit_documentation_status` (flag if visit completed > 24h without note). Generates `compliance_alert` events per client. Pushes to coordinator dashboard. All checks logged to audit trail.

**Proven approach:** Rule engine with configurable thresholds — no ML required. Threshold constants must be named and versioned (e.g., `CARE_PLAN_REVIEW_CYCLE_DAYS = 56`) so `harness-audit-grader` can validate them.

**Assumptions to test:**
- Compliance rules are stable enough to be hardcoded (vs. needing per-agency configuration)
- Daily cron is sufficient frequency — or does Angela need real-time compliance flagging given audit proximity?



*Experiments are prioritised for the O1 + O2 cluster (tied highest Opportunity Score: 0.81). O3 and O4 experiments are scoped but deferred until O1/O2 validation returns data.*


### E1 — Concierge Pretotype: Manual Matching Service

**Validates:** S1 (matching engine), S3 (approval card), S5 (pipeline)

**XYZ Hypothesis:**
We believe that [care coordinators] will [reduce time-to-fill from 30–60 min to <10 min and cancellation rate to <5%] if [we run replacement matching manually on their behalf using a structured shortlist delivered via WhatsApp].

**Method:**
Run a 2-week concierge service for 2 agencies (Angela + Tom). On absence notification (WhatsApp or call), team manually identifies top 3 replacement candidates using a spreadsheet model: qualification match (from agency roster), proximity (Google Maps), familiarity flag (from a quick call with coordinator on day 1 to capture basic preference knowledge). Return ranked shortlist to coordinator via WhatsApp within 15 minutes. Coordinator approves and notifies.

**Metric:** Time-to-fill per incident (vs. coordinator's stated 30–60 min baseline). Cancellation rate over 2 weeks (vs. Tom's 20% estimate).

**Skin-in-the-game signal:** Ask Angela and Tom on day 7: "If this service cost $50/month per coordinator, would you pay to keep it?" (Alberto Savoia's willingness-to-pay signal.)

**Success threshold:**
- Time-to-fill < 10 min on ≥ 70% of incidents
- Cancellation rate < 5% over 2-week window
- ≥ 1 of 2 coordinators confirms WTP at $50/mo

**Risk if it fails:** Matching quality is too low without structured SPP data — coordinator still calls to verify. This would validate O2 (SPP capture) as a prerequisite, not a nice-to-have.


### E2 — Preference Extraction Session (SPP Migration)

**Validates:** S2 (SPP structure), S4 (preference capture wizard concept)

**XYZ Hypothesis:**
We believe that [an experienced care coordinator] will [be able to fully articulate their sticky-note client preference knowledge in a structured format within 90 minutes] if [presented with a structured template and a skilled interviewer using guided prompts].

**Method:**
Schedule a 90-minute session with Angela (CC-001). Use a paper SPP template (6 fields: gender preference, familiarity threshold, dementia protocols, personal triggers, refusal conditions, continuity history). Interviewer guides: "Walk me through Mrs. Kim's preferences." Populate template for 10 clients (sampled: 5 high-risk, 5 routine).

**Metric:**
- SPP completeness: % of clients with ≥ 3 populated fields from narrative session
- Coordinator confidence: "How confident are you that a new coordinator could use this to make a good replacement decision?" (1–10 scale, pre and post session)
- Extraction fidelity: Interviewer cross-checks 3 extracted SPPs with Angela post-session — are they correct?

**Success threshold:**
- ≥ 80% of sampled clients with ≥ 3 populated fields
- Coordinator confidence score > 7/10 post-session (vs. pre-session baseline)
- Extraction fidelity: 0 material errors on cross-check

**Risk if it fails:** Angela's knowledge is narrative and contextual — cannot be reduced to structured fields without losing clinical nuance. Would require free-text notes as the primary store, with search, rather than structured matching parameters.


### E3 — Fake Door: Approval Card Prototype

**Validates:** S3 (approval card UI), coordinator trust in ranked shortlist

**XYZ Hypothesis:**
We believe that [care coordinators] will [accept the top-ranked replacement candidate without making additional verification calls in ≥ 70% of scenarios] if [the candidate card shows match score + familiarity flag + qualifications badge in a single-screen view].

**Method:**
Build a Figma prototype of the Smart Match approval card. Present 5 vacancy scenarios to Angela and Tom individually (each with 3 candidate cards, varied match scores and familiarity flags). Observe: which card do they tap first? What do they read? Where do they hesitate? Do they accept the top candidate or override?

**Metric:**
- Top-candidate acceptance rate: % of scenarios where coordinator approves the top-ranked card
- Hesitation rate: % of scenarios where coordinator requests additional information before approving
- Trust trigger: which field on the card is looked at first? (Eye-tracking or verbal report)

**Success threshold:**
- Top-candidate acceptance rate > 70%
- Hesitation rate < 30% on scenarios where familiarity flag is populated
- Coordinator verbalises trust in at least 1 familiarity-related field ("I trust this because it says she's met this client before")

**Risk if it fails:** Coordinators trust their own judgment over any machine ranking — approval card creates friction rather than reducing it. Would indicate UX needs to show coordinator's own logic reflected back to them, not a system-generated score.


### E4 — Deferred: Family Notification Template Test (O3)

**Scope:** Send 5 test notifications to real family contacts (with permission) using three template variants: formal agency tone, warm conversational tone, minimal factual. Measure: response rate, opt-out rate, follow-up call rate.

**Deferred until:** E1 yields real vacancy incidents for which notifications would be sent. Cannot test notification experience in isolation from a real schedule-change event.


### E5 — Deferred: Compliance Dashboard Clickthrough (O4)

**Scope:** Present Angela with a static mockup of the compliance gap list (17 items, 5 critical). Measure: time to first action, items addressed within 48 hours.

**Deferred until:** E1/E2 validation is complete (2 weeks). Angela's audit date (~2026-05-12) creates a natural urgency window for this experiment in April.



```
DESIRED OUTCOME
└── Reduce vacant visit cancellation rate to <2%, time-to-fill <5 min,
    100% client soft preferences documented, 100% family notification on change
    ───────────────────────────────────────────────────────────────────────────

OPPORTUNITIES (CC Primary — with solution branches)
│
├── O1 [0.81] — Vacancy Cascade: No Matching Logic [Cap#5]
│   ├── S1  Automated vacancy detection + smart replacement proposal engine [PM]
│   ├── S3  One-click approval card UI — ranked candidates + familiarity flags [Designer]
│   └── S5  Event-driven matching pipeline — Lambda + availability index + SPP graph [Engineer]
│       ├── E1  Concierge pretotype — manual matching via WhatsApp (2 weeks, 2 agencies)
│       └── E3  Fake door — Figma approval card prototype (5 scenarios, 2 coordinators)
│
├── O2 [0.81] — Soft Preference Knowledge Fragility [Cap#5 + #2]
│   ├── S2  Structured Soft Preference Profile (SPP) per client [PM]
│   ├── S4  Preference capture wizard — narrative-to-structured extraction [Designer]
│   └── S5  SPP as a matching parameter in event-driven pipeline [Engineer] (shared with O1)
│       ├── E2  Preference extraction session — 90 min with Angela, 10 clients, paper template
│       └── E3  (shared with O1)
│
├── O3 [0.72] — Family Notification Gap [Cap#4]
│   ├── S6  Automated multi-channel notification — triggered by visit_status_changed event [PM]
│   ├── S7  Notification preview in approval flow — coordinator confirms before send [Designer]
│   └── S8  Notification preference capture at intake — channel + language per family [Engineer]
│       └── E4  Family notification template test — deferred until E1 yields real incidents
│
└── O4 [0.63] — Compliance Drift Without Visibility [Cap#1 + #2]
    ├── S9   Live compliance gap dashboard — ranked by severity [PM]
    ├── S10  Compliance traffic light on client profile [Designer]
    └── S11  Compliance rule engine — cron + named threshold constants [Engineer]
        └── E5  Compliance dashboard clickthrough with Angela — deferred (target April 2026)

SECONDARY SEGMENT OPPORTUNITIES (Logged — No Solution Branches Until Beachhead Validated)
│
├── O5 [0.72] — HCN: Longitudinal pattern detection impossible at scale [Cap#1]
│   Entry condition: CC Beachhead validated → HCN agency adoption
│
├── O6 [0.81] — FC: Family receives raw data, not clinical verdict [Cap#4]
│   Entry condition: CC + HCN adoption — FC value is downstream of clinical triage
│
├── O7 [0.64] — HCN: Field documentation requires post-visit reconstruction [Cap#3]
│   Entry condition: CC Beachhead validated → HCN segment entry
│
└── O8 [0.56] — HCN: Care plans blank — no clinical guidance [Cap#2]
    Entry condition: Same as O7

AI TRUST ARCHITECTURE — CROSS-CUTTING DESIGN CONSTRAINT (NOT AN OST NODE)
│   Source: Arthur Kovacs (SR-002) — "performing wellness" incident
│   Rule: Clinical review precedes any family notification. Patient is first to know.
│   Applies to: S6 (family notification), O6 (FC verdict), all Level 3 Escalator actions
│   Documented in: Artifact 3 Section 6; must appear in agentic-logic-spec as structural gate
```



All 5 product capabilities must have at least one OST opportunity node before proceeding to Skill 6 (Brainstorm Ideas).

| Capability | OST Opportunity Node(s) | Status |
|---|---|---|
| #1 — Predictive Risk / Longitudinal Pattern Detection | O4 (compliance dimension — CC primary) + O5 (HCN — logged) | ✅ Covered |
| #2 — AI-Assisted Care Plan Recommendation | O2 (SPP / care plan) + O4 (care plan review) + O8 (HCN — logged) | ✅ Covered |
| #3 — Voice-to-Structured Documentation | O7 (HCN — logged) | ✅ Covered (secondary — activates at HCN entry) |
| #4 — Clinically-Interpreted Family / Patient Communication | O3 (CC primary) + O6 (FC — logged) | ✅ Covered |
| #5 — Vacant Visit Smart Matching | O1 + O2 (CC primary — tied highest priority) | ✅ Covered |

**All 5 capabilities covered. OST is valid input to Skill 6.**



*Not an opportunity node. Applied as a structural constraint across all solutions that involve patient data or family-facing communication.*

| Constraint | Source | Applies To | Required Action |
|---|---|---|---|
| Clinical review precedes family notification | Arthur (SR-002): notified son + GP before Arthur knew | S6 (family notification), O6 (FC verdict), all Level 3 actions | `agentic-logic-spec` must gate family notification on nurse_reviewed = true OR coordinator_approved = true |
| Patient is first to know | Arthur (SR-002): "I found out because my son phoned me in a panic" | All notification pipelines | Notification order: Patient/Coordinator → Family (never Family before Patient) |
| No AI inference without consent | SR cohort: AI monitoring triggered anxiety, gaming | Any AI anomaly detection | Consent flag per patient required before any inference-based alert is generated |
| Passive/ambient design (no surveillance framing) | Lin Chen (SR-001): "She senses the surveillance and performs for it" | All sensor-based features | No always-on camera, no continuous audio monitoring — event-triggered passive sensors only |
| SPP is coordinator-editable, not AI-generated | Both CC coordinators: trust and continuity is judgment, not a statistic | S2 (SPP), S4 (preference wizard) | AI extracts a draft from narrative; coordinator must confirm before SPP fields are saved |



| ID | From Artifact | To Next Skill | What Transfers |
|---|---|---|---|
| HS-DISC-OST-01 | Artifact 5 — O1 + O2 cluster (0.81) | `brainstorm-ideas-new` (Skill 6) | Top 2 opportunity nodes + solution S1/S2/S3/S4/S5 as seeds for ideation |
| HS-DISC-OST-02 | Artifact 5 — O3 (0.72) | `brainstorm-ideas-new` (Skill 6) | Family notification gap as third opportunity for idea generation |
| HS-DISC-OST-03 | Artifact 5 — E1/E2/E3 experiment designs | `brainstorm-experiments-new` (Skill 11) | XYZ hypotheses + pretotype methods — ready for experiment design skill |
| HS-DISC-OST-04 | Artifact 5 — AI Trust Constraint Register | `agentic-logic-spec` (Execution Plugin) | 5 design constraints must appear as structural gates in pseudocode and Mermaid diagram |
| HS-DISC-OST-05 | Artifact 5 — Secondary opportunities O5–O8 | `market-segmentation-deep-dive` (next cycle) | HCN and FC opportunity nodes held for activation after CC Beachhead validation returns data |
| HS-DISC-OST-06 | Artifact 5 — Capability Coverage Verification | `brainstorm-ideas-new` (Skill 6) | Confirms all 5 capabilities have OST coverage — no blank capability nodes entering ideation |



| Date | Owner | Action |
|---|---|---|
| 2026-03-27 | PM Lead | Recruit Angela (CC-001) and Tom (CC-002) for E1 concierge pretotype — obtain consent, brief on process |
| 2026-03-27 | PM Lead | Schedule E2 preference extraction session with Angela (90 min — within 2 weeks of discovery close) |
| 2026-03-28 | Designer | Build Figma prototype for E3 — approval card UI with 5 vacancy scenarios and varied match/familiarity data |
| 2026-03-28 | PM Lead | Run Skill 6 (brainstorm-ideas-new) using O1 + O2 + O3 as inputs — generate 5 ideas per PM/Designer/Engineer perspective |
| 2026-04-07 | PM Lead | E1 + E2 results review — update OST Opportunity Scores based on experiment outcomes |
| 2026-04-14 | PM Lead | If E1 validates matching concept, advance to `identify-assumptions-new` (Skill 7) |
| 2026-05-01 | PM Lead | Target E5 (compliance dashboard) with Angela before her audit (~2026-05-12) |


*OST note: This tree is a living document. If E1 returns a cancellation rate > 5% despite matching, revisit O1 Importance score — the problem may be less solvable than the pain score suggests. If E2 returns SPP completeness < 80%, O2 satisfaction score may need upward revision (current sticky-note + memory tools may be more sufficient than coordinators report). In both cases: update, do not discard. The tree improves with each experiment cycle.*

*Handshake note: The desired outcome metric ("reduce cancellation rate to < 2%") becomes the SMART OKR in the PRD (HS-STRAT-04). The AI Trust Constraint Register (Section 7) feeds directly into `agentic-logic-spec` NFRs (HS-STRAT-02). Secondary opportunities O5–O8 hold their Opportunity Scores and are re-activated, not re-scored, at HCN/FC segment entry.*
