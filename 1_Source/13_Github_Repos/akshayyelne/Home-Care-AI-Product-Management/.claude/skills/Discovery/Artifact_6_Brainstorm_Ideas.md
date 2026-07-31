# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Discovery/Artifact_6_Brainstorm_Ideas.md
# Generated: 2026-07-31T00:49:45.130Z

**Project:** Home-Care-AI
**Stage:** Discovery → Stage 3 (Opportunity Mapping)
**Skill:** brainstorm-ideas-new
**Date:** 2026-03-26
**Methodology:** Product Trio ideation — PM / Designer / Engineer perspectives (5 ideas each → top 5 prioritised)
**Input:** Artifact 5 — OST (O1 Vacancy Cascade, O2 Soft Preference Knowledge Fragility, O3 Family Notification Gap)
**Beachhead Segment:** Care Coordinator (CC)
**Feeds into:** Artifact 7 — Identify Assumptions (New Product)
**Amended:** 2026-03-26 — Regulatory context: A7 reframed from HIPAA/BAA to Australian Privacy Act APP 8 (cross-border disclosure); regulatory context note added throughout


> **Regulatory context:** This product operates under the Australian Privacy Act 1988 (Australian Privacy Principles — APP). References to HIPAA in architecture notes reflect a security design floor (HIPAA-grade controls satisfy APP security obligations and then some). The operative privacy law is APP, not HIPAA. Where CLAUDE.md references HIPAA Audit Log Schema and HIPAA compliance, treat these as the minimum security architecture — the compliance citations in downstream artifacts (Artifact 7+) should reference APP as the primary regulatory framework. No Business Associate Agreement (BAA) equivalent exists under APP; the relevant cross-border obligation is APP 8.



| Opportunity | Score | Capability | Core Pain |
|---|---|---|---|
| O1 — Vacancy Cascade: No Matching Logic | 0.81 | #5 | 11 phone calls → 30–60 min → 20% cancellation rate |
| O2 — Soft Preference Knowledge Fragility | 0.81 | #5 + #2 | All client trust/preference knowledge in one person's head or on sticky notes |
| O3 — Family Notification Gap | 0.72 | #4 | Families find out about cancellations when nobody shows up |

**Seed solutions from OST** (S1–S8) are used as starting points, not as constraints. Brainstorm explores the full possibility space before narrowing.




### 2A — Product Manager Perspective (5 Ideas)

*Focus: market fit, value creation, competitive advantage, monetisation anchor.*


#### PM-1 — Smart Match Engine: Qualified + Proximate + Trusted

**The idea:** When a carer calls in sick, the system detects the absence (via notification or coordinator entry), instantly computes a ranked shortlist of replacement candidates using three criteria weighted in order: qualification match (hard gate), proximity (distance score), and Soft Preference Profile match (trust/familiarity score). Coordinator sees the ranked list and approves in one tap. System notifies replacement carer, client, and family automatically.

**Why this creates competitive advantage:** AlayaCare has a Vacant Visit Scheduling Agent, but it matches on availability and qualifications only — no soft preference layer. The trust dimension (who does this patient accept?) is not in any competitor's system. This is the differentiator that produces a meaningfully better outcome, not just a faster one. A coordinator who gets a match score that includes "has met this client before" will trust the system in a way they will never trust a system that only returns "available and qualified."

**Market fit signal:** Both CC coordinators independently named the same desired outcome — "not just who's available, but who does this patient trust" (Angela, CC-001). This is not a nice-to-have; it is the definition of a good outcome.

**Monetisation anchor:** This is the primary value metric — vacancy incidents resolved. Pricing model candidate: per-incident (pay per match) or subscription with incident volume as the upgrade trigger.

**Assumptions to test:**
- Soft preference data can be captured at sufficient completeness to differentiate candidates (E2)
- Coordinator trusts a machine-generated match score enough to approve without calling (E3)
- The SPP match improves outcomes (lower client distress, lower churn) vs. availability-only matching


#### PM-2 — Soft Preference Profile (SPP): Institutional Memory as a Product

**The idea:** A structured, per-client record capturing the knowledge that currently exists only in the coordinator's head or on sticky notes: carer gender preference, familiarity threshold (known-only / briefed-acceptable / any), dementia briefing requirements, personal triggers, refusal conditions, continuity history, and free-text notes. The SPP is:
- Built during coordinator onboarding (30 min for 10 clients)
- Updated after every visit (single-field edit)
- Version-controlled (append-only — every change is attributed and dated)
- Queryable by the matching engine (PM-1) during replacement decisions

**The strategic insight:** The SPP is not just an input to the matching engine — it is the product's moat. Over time, every coordinator interaction enriches the SPP. An agency that has used the system for 6 months has a client preference record that no new entrant can replicate. Switching cost is the accumulated SPP data, not the software.

**Standalone value (before matching engine):** Even without automated matching, an agency that can hand a new coordinator a complete SPP for all 60 clients is orders of magnitude more resilient than one where the previous coordinator's sticky notes went to recycling. The SPP is the "coordinator handover package" — a product in itself.

**Assumptions to test:**
- Coordinators will maintain SPPs after initial capture (not just fill them in once and abandon)
- SPP completeness achieved in the first 30 days without dedicated migration effort
- Agencies value institutional knowledge transfer enough to pay for it independently of the matching feature


#### PM-3 — Agency Intelligence Dashboard: "Here Are the Seventeen Things"

**The idea:** A real-time operational dashboard giving coordinators a single-screen view of what needs attention across all clients and staff — right now. Three lanes:

- **Compliance lane:** Overdue care plan reviews, expiring credentials, documentation gaps — ranked by severity (Clinical > Regulatory > Administrative). Angela's exact spec: *"Here are the seventeen things out of compliance. Here are the five that are critical."*
- **Continuity lane:** Clients who have had more than 2 different carers in the last 30 days. Clients whose primary carer is due for extended leave. Proactive flag before the continuity failure happens.
- **Vacancy lane:** Predicted vacancies for the next 7 days (based on leave requests, shift patterns). Coordinator can pre-arrange replacements before the 6:30 AM call.

**Why this is a PM-level idea:** The dashboard converts the coordinator's chronic "vague anxiety" into actionable specifics. It does not add work — it surfaces the work that already needs doing, before it becomes a crisis. This is the difference between proactive and reactive coordination.

**Competitive gap:** No competitor offers a predictive compliance + continuity dashboard. AlayaCare flags individual compliance items but does not surface a prioritised, cross-client view. Lookout Way is family-facing, not coordinator-facing.

**Assumptions to test:**
- Coordinators will act on a ranked list vs. requiring a prescribed workflow
- Predicted vacancy (based on leave patterns) is accurate enough to be useful at 25–60 client scale
- Dashboard does not create "alert fatigue" — the ranking logic must surface the right 5 critical items, not 50 marginal ones


#### PM-4 — Coordinator Handover Package: "The Bus-Proof Knowledge Transfer"

**The idea:** On demand (or triggered by coordinator departure), the system auto-generates a complete client knowledge package: SPP for every active client, continuity history (who has visited, how often, client reaction), outstanding compliance items, family communication preferences, and care plan status. Delivered as a structured digital document + printable summary. Designed to bring a new or backup coordinator up to speed on all clients in 2 hours, not 2 weeks.

**Named after Angela's insight:** *"If I get hit by a bus tomorrow, half the knowledge about our clients walks out the door with me."* The Handover Package is the direct product response to this exact risk.

**Dual trigger:**
- Planned: coordinator goes on leave, changes role, leaves the agency
- Unplanned: emergency absence — the agency owner can generate the package for any coordinator at any time

**Commercial angle:** This is a risk management product for agency owners. The pitch is not "better software" — it is "your agency survives when your coordinator leaves." This reframes the buyer (agency owner, not coordinator) and the value (business continuity, not operational efficiency).

**Assumptions to test:**
- Agency owners perceive coordinator departure as a significant business risk (vs. just an inconvenience)
- A 2-hour onboarding time for a new coordinator (with SPP package) is achievable and compelling vs. the current 2–4 week informal knowledge transfer
- SPP data quality is sufficient to represent the departing coordinator's knowledge accurately


#### PM-5 — Continuity Score: Proactive Carer Consistency Monitoring

**The idea:** Each client has a Continuity Score: a rolling 30-day measure of carer consistency. Score is based on: number of distinct carers in the period, repeat visit rate (same carer returning to same client), and client familiarity index (proportion of visits by carers on the client's SPP "known" list). Coordinator receives a proactive alert when any client's Continuity Score drops below threshold — before the client or family complains.

**Evidence anchor:** Mrs. Henderson (Tom, CC-002) had 3 different carers in 2 weeks. The Continuity Score would have flagged this after carer 2 — giving Tom the opportunity to prioritise continuity in the third assignment. Instead, he found out when Mrs. Henderson's daughter called to cancel the service.

**The insight this creates:** Continuity risk is currently invisible. A coordinator managing 60 clients cannot track consistency manually. The Continuity Score makes invisible risk visible — and makes it actionable before it becomes a client loss event.

**Assumptions to test:**
- A 30-day rolling window is the right metric period (vs. 14 days or 60 days)
- Continuity Score threshold can be calibrated to produce meaningful alerts without over-alerting
- Coordinators will act on a proactive continuity flag (vs. treating it as noise)


### 2B — Product Designer Perspective (5 Ideas)

*Focus: user experience, onboarding friction, trust-building, moment-of-truth interaction design.*


#### DES-1 — Absence → Approval in 3 Taps (The 6:30 AM Flow)

**The idea:** The entire vacancy resolution flow is designed around one moment: 6:30 AM, Jenny calls in sick, Angela has three visits starting at 8:00. The product's job is to resolve this in under 60 seconds on a phone.

**The 3-tap flow:**
1. Coordinator opens notification: "Jenny Smith unavailable — 3 visits affected." → Tap to see matches for Visit 1.
2. Coordinator sees 3 candidate cards (each showing: name, match score, familiarity flag, distance, availability window). → Tap "Approve" on the top match.
3. Confirmation screen: "David Kim assigned. Mrs. Kim notified. David notified." → Tap "Done."

Coordinator returns to sleep, coffee, or the next fire. No login screen. No navigation. No form. No phone call.

**Design principles:**
- Notification-first: the product comes to the coordinator, not the other way around
- Cards, not lists: 3 candidates maximum per decision — not a scrollable roster
- Hesitation design: if no candidate exceeds 70% match score, card shows "Review manually" — the system acknowledges uncertainty rather than forcing a false-confidence recommendation
- One confirmation screen: shows the outcome (assigned, notified, done) — no ambiguity about what happened

**The design question this answers:** What does a coordinator need to see to make a confident decision in under 10 seconds? The answer from E3 (fake door prototype) will validate or challenge this design.

**Assumptions to test:**
- 3 candidates is the right decision surface — not 1 (too prescriptive) or 5 (too overwhelming)
- The familiarity flag ("has met this client before") is the field that produces coordinator trust
- Coordinator can complete the flow on a phone at 6:30 AM without reading instructions


#### DES-2 — Client Knowledge Card: The Soft Briefing Layer

**The idea:** Every client has a Knowledge Card — a compact, human-readable summary of the soft facts that determine whether a visit goes well or badly. Not a clinical care plan. Not a medication list. The things a coordinator currently delivers by phone:

> "Mrs. Kim only wants female carers."
> "Arthur doesn't like new people but will accept them if you don't move his things."
> "Lin Chen will refuse entry if she doesn't recognise you — show her your ID and mention Carol sent you."

The Knowledge Card is shown to:
- The coordinator during replacement matching (confirms SPP data as a sanity check)
- The replacement carer 30 minutes before the visit (pre-visit briefing push notification)
- The new coordinator during handover

**Design constraint (from SR cohort):** The Knowledge Card never shows clinical data (diagnoses, medications) — those live in the EMR. The Knowledge Card shows only the relational and contextual soft facts. It is not surveillance; it is introduction.

**The moment it changes:** The replacement carer walks through Mrs. Kim's door briefed on who she is and what she needs. Mrs. Kim recognises someone who understands her. The distress event (Mrs. Henderson) does not happen.

**Assumptions to test:**
- Replacement carers will read a pre-visit briefing notification 30 minutes before the visit (vs. ignoring it)
- 3–5 bullet points is the right length — long enough to be useful, short enough to actually read
- Coordinators will populate the Knowledge Card fields during onboarding vs. deferring indefinitely


#### DES-3 — Onboarding Wizard: "Tell Me About Your Clients"

**The idea:** The coordinator's first session in the product is not a form. It is a conversation. The screen shows one client name and asks: "Tell me about [Client Name]. What do I need to know about them?" Coordinator types or speaks naturally. System extracts structured SPP fields from the narrative.

**Example:**
- Input: "Mrs. Kim only wants female carers and gets very anxious if someone new comes without being properly introduced."
- Extracted: `gender_preference: female`, `familiarity_threshold: briefed-acceptable`, `anxiety_trigger: unintroduced new visitor`
- Review screen: "Is this right? [Edit]" — coordinator confirms before saving.

**Why this matters for adoption:** Form-filling fatigue is the primary reason onboarding flows fail. "Tell me about your client" is how coordinators already talk about their clients — with Maria, with Tom, with each other. The product speaks the coordinator's language rather than imposing a data entry paradigm.

**Voice note option (Engineer dependency):** If voice input is available (DES-3 depends on a transcription API), coordinator can record a voice note for each client during the initial session. This is the fastest possible capture method for an experienced coordinator like Angela who has 60 clients.

**Assumptions to test:**
- NLP extraction accuracy from coordinator narrative is sufficient to populate SPP fields without manual correction for >80% of inputs
- Coordinators prefer narrative input over structured fields — or do some coordinators prefer the form for precision?
- Voice note option is acceptable in the coordination office environment (Angela's open plan vs. Tom's solo operation)


#### DES-4 — The Compliance Wall: All Clients, One View

**The idea:** A full-screen dashboard where each client is represented as a tile. Tile colour reflects compliance status: green (all current), amber (review due within 14 days), red (overdue item). Tiles are sortable by status, last-visit date, care plan review date, and risk level.

**The key interaction:** Coordinator looks at the wall and immediately sees how many red tiles there are. Taps any red tile: "Mrs. Petrova — care plan review overdue by 14 days. Last reviewed: 2025-11-12. [Schedule review now]." One tap opens the care plan review workflow. Compliance item resolved.

**Angela's spec, delivered:** *"Here are the seventeen things out of compliance. Here are the five that are critical."* The Compliance Wall is not a list — it is a spatial overview. The "five critical" are visually obvious without reading a list.

**Design tension:** The wall must show enough clients to be useful (Angela: 60+) while keeping tiles readable. At 60 clients, tiles can be 2×2 cm each on a tablet — the overview is still scannable. At 200 clients, the wall needs grouping (by care worker, by region) rather than a flat grid.

**Assumptions to test:**
- Spatial tile view (wall) is more useful than a sorted list for coordinator working style — or does Angela prefer a list because she scans by client name, not by visual pattern?
- Amber tiles (14-day warning) are actionable — or do coordinators treat amber as background noise until it goes red?
- 60-client tile view is readable on a 10-inch tablet (primary coordinator device assumption)


#### DES-5 — Carer Briefing Notification: The Pre-Visit Soft Knowledge Push

**The idea:** 30 minutes before a replacement visit, the assigned replacement carer receives a push notification: their Knowledge Card for that client. Not a full care plan — just the 3–5 soft facts the coordinator would normally deliver by phone.

**What it replaces:** The last 2–3 of Angela's 11 phone calls — the calls she makes to brief the replacement carer on client preferences and access protocols. The pre-visit notification automates this briefing.

**Content of the notification:**
> "Visit reminder: Mrs. Helen Kim, 14 Rosewood Lane, 8:00 AM.
> Key notes from your coordinator:
> • Mrs. Kim prefers female carers — please introduce yourself clearly at the door.
> • She is familiar with the CareBridge uniform — wear it visibly.
> • Contact coordinator if she seems confused or agitated on arrival."

**Privacy design (from SR constraints):** The notification contains only the soft preference/protocol layer — no diagnoses, no medication details. Full clinical information remains in the EMR, accessible via a separate authenticated view. This is the minimum necessary data principle applied to carer briefing.

**Assumptions to test:**
- Replacement carers use smartphones and will accept push notifications from the agency app
- 30-minute lead time is enough for the carer to read and act on the briefing (vs. too close to visit time to change approach)
- The notification reduces the coordinator's post-assignment phone call rate (the coordination efficiency gain)


### 2C — Software Engineer Perspective (5 Ideas)

*Focus: proven cloud infrastructure, API integrations, platform capabilities. Per CLAUDE.md Article III: Engineer must prioritise proven cloud infrastructure.*


#### ENG-1 — Event-Driven Matching Pipeline (AWS Lambda + DynamoDB + SNS)

**The idea:** The entire vacancy-to-approval flow is built as an event-driven, serverless pipeline on proven AWS infrastructure. No standing servers. No ML training required in v1.

**Architecture:**
1. `absence_recorded` event → SNS topic → Lambda trigger
2. Lambda: query DynamoDB `staff_availability` table (coordinator-maintained, updated via mobile app or WhatsApp webhook) → filter by `qualified: true` and `available: true` for the visit window
3. Lambda: score filtered candidates against SPP match (DynamoDB `client_preferences` document) → rank by: qualification_match (boolean gate) → proximity_score (Google Maps Distance Matrix API, cached) → spp_match_score (cosine similarity on preference tags)
4. Return top 3 candidates → push to coordinator via FCM/APNs push notification
5. On coordinator approval (`candidate_approved` event): write assignment to `visits` table → trigger notification Lambda for carer + client + family

**Why proven infrastructure:** Lambda + DynamoDB + SNS is the standard AWS event-driven pattern. No exotic dependencies. DynamoDB handles 25–60 client scale with trivial cost (<$5/month). Google Maps Distance Matrix API is HIPAA-eligible with BAA. FCM/APNs push notifications are industry standard.

**v1 constraint:** No ML in v1. SPP match score in v1 is a rule-based tag overlap score — "how many of the client's required attributes does this carer satisfy?" ML-based recommendation engine is v2, trained on outcomes data (accepted/rejected matches, client satisfaction signals) once the data exists.

**Assumptions to test:**
- Staff will update their availability in the app reliably (vs. old habit of calling the coordinator)
- Google Maps Distance Matrix API is accurate enough for 30-minute-window matching in suburban/regional areas
- DynamoDB document model is sufficient for SPP graph queries at 60-client scale (vs. requiring Neo4j)


#### ENG-2 — WhatsApp Business API Integration (Twilio + Lambda Webhook)

**The idea:** Build the entire coordinator vacancy workflow inside WhatsApp — the tool both Angela and Tom already use for absence notifications. Coordinator receives a WhatsApp message: "Jenny Smith just notified sick. Here are 3 options for her 8 AM visit: [1] David Kim (95% match, 2.1 km) [2] Sarah O'Brien (82% match, 3.4 km) [3] Priya Ramesh (74% match, 1.8 km). Reply 1, 2, or 3 to approve." Coordinator replies "1". System assigns and notifies all parties.

**Why this matters for adoption:** No app download. No login. No context-switching. The product meets coordinators where they already are. This is the fastest possible path from concierge pretotype (E1, which already uses WhatsApp) to a real product interaction.

**Architecture:** Twilio WhatsApp Business API → webhook → Lambda → same matching pipeline as ENG-1 → outbound WhatsApp message via Twilio → coordinator reply → Lambda parses and processes.

**Privacy consideration (APP 8 — Cross-Border Disclosure):** WhatsApp messages transit Meta's infrastructure (US/Ireland servers). Under APP 8, this constitutes a cross-border disclosure of personal information, requiring the entity to take reasonable steps to ensure the overseas recipient does not breach the APPs — or to obtain explicit individual consent waiving APP 8 protections. This is not a binary blocker (no BAA equivalent is required under APP), but it is an operational design and disclosure obligation. The risk is managed by message content design: messages contain only staff names and a match score, never the combination of full name + DOB + address + health information that would constitute sensitive personal information under the Privacy Act. This is the same Minimum Necessary principle applied as a design floor in CLAUDE.md Article VII; it limits APP 8 exposure as a side effect. Before ENG-2 enters production, the agency's privacy notice must disclose that staff coordination messages transit Meta's infrastructure (US/Ireland). Full clinical data remains in the authenticated app and never enters the WhatsApp channel.

**Assumptions to test:**
- Both Angela and Tom use WhatsApp on their primary work device (confirmed in Artifact 2c)
- Agencies are willing to adopt WhatsApp Business API (requires a WhatsApp Business account — not a personal number)
- The character-limit and format constraints of WhatsApp are sufficient for the approval card content (vs. needing a richer UI)


#### ENG-3 — SPP Knowledge Graph (DynamoDB Document → Neo4j Migration Path)

**The idea:** Client preference knowledge is stored as a structured document per `client_id` in DynamoDB. At CC scale (25–60 clients), DynamoDB document queries handle SPP retrieval efficiently. As the platform scales (1,000+ clients), the data model migrates to Amazon Neptune (managed graph DB, AWS-native) without application-layer changes — only the data store changes.

**Data model (v1, DynamoDB):**
```json
{
  "client_id": "uuid",
  "preferences": {
    "gender_required": "female",
    "familiarity_threshold": "briefed-acceptable",
    "briefing_notes": "Do not move Arthur's belongings",
    "refusal_conditions": ["unrecognised visitor", "no ID presented"],
    "known_carers": ["uuid-carol", "uuid-david"],
    "continuity_history": [
      { "carer_id": "uuid-carol", "visit_count": 12, "last_visit": "2026-03-20", "outcome": "positive" }
    ]
  },
  "spp_completeness_score": 0.83,
  "last_updated": "2026-03-26T09:00:00Z",
  "updated_by": "coordinator-uuid"
}
```

**Version control:** DynamoDB Streams captures every SPP change → Lambda writes to `spp_audit_log` table (append-only). Every edit is attributed to a `user_id` and timestamped. Immutable SPP history.

**Migration path to graph:** When cosine similarity queries on the preference vector become slow at scale, Neptune graph traversal ("find all carers who have visited this client more than twice and are within 5 km") replaces the DynamoDB scan. Application code change: swap data access layer. No schema migration for the application tier.

**Assumptions to test:**
- DynamoDB document model handles SPP similarity queries efficiently at 60-client scale (benchmark query latency < 200ms)
- Coordinator devices support JSON document editing (for the SPP wizard DES-3) without performance issues
- Version-controlled SPP history is a requirement from the outset, not a v2 feature


#### ENG-4 — Notification Delivery Pipeline (FCM + APNs + Twilio SMS + SendGrid)

**The idea:** A single notification service handles all outbound communications — carer assignment, family notification, pre-visit briefing — with channel routing per recipient type and fallback on delivery failure.

**Channel routing:**
- Coordinator: FCM/APNs push (app) → SMS fallback if push fails
- Replacement carer: FCM/APNs push → SMS fallback
- Family contact: SMS (primary, per Artifact 2b FC research — Rachel's brother in London, James's wife Adama) → email fallback → in-app notification if app is installed
- Client (SR): in-app or SMS, per consent preference

**Delivery confirmation:** Every notification sends a delivery receipt webhook back to the service. Undelivered notifications after 5 minutes trigger an escalation event to the coordinator dashboard. Family notification failure is logged as a compliance event (notification_failed) — not silently dropped.

**HIPAA compliance:** All message content is reviewed at composition time to ensure no PHI in notification body. Client name in a notification is acceptable; DOB + diagnosis + address combination is not. PHI is accessible only via authenticated app, never in notification payload.

**Proven infrastructure:** Twilio (SMS, WhatsApp), SendGrid (email), FCM/APNs (push) — all HIPAA-eligible with BAA. All widely deployed in healthcare applications.

**Assumptions to test:**
- Family contacts have SMS capability (near-universal assumption — but Rachel's brother in London needs international SMS routing confirmed)
- Delivery receipt rate via Twilio SMS is sufficient for audit trail completeness (>99.5% delivery confirmation)
- Agency clients accept receiving SMS from the agency's registered Twilio number (vs. "who is this?")


#### ENG-5 — Compliance Rule Engine (CloudWatch Scheduled Events + Lambda + Parameter Store)

**The idea:** A serverless compliance monitoring engine runs on a daily schedule. All compliance rules are defined as named threshold constants stored in AWS Parameter Store — configurable without code deployment, versioned, auditable.

**Rules (v1):**
- `CARE_PLAN_REVIEW_CYCLE_DAYS = 56` — flag any client whose care plan review date is > 56 days ago
- `CREDENTIAL_EXPIRY_WARNING_DAYS = 30` — flag any staff credential expiring within 30 days
- `VISIT_DOCUMENTATION_MAX_HOURS = 24` — flag any completed visit with no clinical note after 24 hours
- `CONTINUITY_ALERT_THRESHOLD_CARERS = 3` — flag any client with > 3 distinct carers in 30 days (PM-5 Continuity Score)

**Execution flow:**
1. CloudWatch Scheduled Event (daily, 06:00 UTC) → Lambda
2. Lambda queries: `client_care_plans` table (review dates), `staff_credentials` table (expiry dates), `visits` table (documentation status)
3. For each rule violation: creates `compliance_alert` event → writes to `compliance_alerts` DynamoDB table → pushes to coordinator dashboard
4. All rule evaluations logged to audit trail: `rule_id`, `client_id_or_staff_id`, `threshold_applied`, `value_observed`, `alert_generated`, `timestamp`

**Why Parameter Store for thresholds:** Named constants in Parameter Store can be updated by an authorised admin without a code deployment. When Angela's quality framework changes its 8-week review cycle to 6 weeks, the update is a single Parameter Store change — not a code change and redeploy.

**Assumptions to test:**
- Daily cron frequency is sufficient — or does the compliance dashboard need real-time updates (e.g., Angela wants to see a new overdue item as soon as it becomes overdue, not the next morning)?
- Parameter Store threshold configuration is manageable by a non-technical agency admin, or does it require developer access?
- 4 compliance rules are sufficient for v1 — or does Angela's quality framework require additional rule types at launch?



*Prioritisation criteria (per CLAUDE.md Article III Stage 3 and skill instructions for a new product):*
1. **Core value delivery** — does it solve the primary problem (O1: vacancy cascade)?
2. **Speed to validate** — can it be tested quickly with existing experiment designs (E1, E2, E3)?
3. **Differentiation potential** — does it create an advantage no competitor currently has?

| Rank | Idea | Source Perspective | Core Value | Validate How? | Differentiator |
|---|---|---|---|---|---|
| 1 | Smart Match Engine: Qualified + Proximate + Trusted | PM-1 | Solves O1 directly — replaces 11 calls with 1 approval | E1 (concierge pretotype) | Soft preference layer — no competitor has this |
| 2 | Soft Preference Profile (SPP): Institutional Memory | PM-2 + ENG-3 | Solves O2 — converts fragile sticky-note knowledge into a transferable asset | E2 (extraction session) | Moat — accumulated SPP data = switching cost |
| 3 | Absence → Approval in 3 Taps (6:30 AM Flow) | DES-1 | UX execution of PM-1 — adoption depends on this working at 6:30 AM under stress | E3 (Figma prototype) | No competitor has a mobile-first, 3-tap vacancy approval flow |
| 4 | WhatsApp Business API Integration | ENG-2 | Fastest adoption path — meets coordinators where they already are | E1 (already using WhatsApp) | No app download required for v1 validation |
| 5 | Carer Briefing Notification: Pre-Visit Soft Knowledge Push | DES-5 | Closes the O1 loop from the carer side — removes Angela's last 2–3 calls | Observe in E1 (does Angela still call carers after we provide the briefing?) | No competitor sends a soft-knowledge briefing to replacement carers |




### Top 1 — Smart Match Engine: Qualified + Proximate + Trusted (PM-1)

**Why ranked first:** This is the product. If this does not work, nothing else matters. O1 is the highest-frequency, highest-consequence operational crisis in the CC segment. Every coordinator interaction with the product during the critical 6:30 AM window is an interaction with this feature. It is the core value delivery mechanism.

**Key integration point:** PM-1 depends on PM-2 (SPP data) to deliver differentiated results. Without SPP, it is just a faster way to find an available, qualified carer — which AlayaCare already does. With SPP, it becomes something no competitor can replicate: a match that includes trust.

**Critical assumptions to test:**
1. Soft preference data is complete enough to differentiate candidates (E2 validates SPP completeness)
2. Coordinator trusts the system's ranking enough to approve without verifying independently (E3 validates trust)
3. The matching engine reduces time-to-fill to < 10 min on ≥ 70% of incidents (E1 validates speed outcome)
4. Staff update their availability reliably enough for the availability index to be current (E1 will surface this as a blocker if it fails)


### Top 2 — Soft Preference Profile (SPP): Institutional Memory (PM-2 + ENG-3)

**Why ranked second:** SPP is both a standalone product (handover package, business continuity) and the prerequisite for Top 1 to be differentiated. Without SPP, the matching engine is a parity feature. With SPP, it is the moat.

**Strategic importance:** The SPP is the accumulation mechanism. Every time a coordinator updates a preference, adds a continuity history entry, or confirms an extracted briefing note, the SPP becomes more complete. After 6 months, the SPP is irreplaceable — it holds 6 months of relationship knowledge that cannot be re-created from scratch. This is the switching cost that makes retention structural, not contractual.

**Critical assumptions to test:**
1. Angela can articulate her 60-client sticky-note knowledge in structured form (E2 — 90 min extraction session with 10 clients)
2. Coordinators will maintain SPPs after initial capture — not just at onboarding
3. SPP completeness score (ENG-3: `spp_completeness_score` field) is a useful metric for coordinator adoption measurement
4. DynamoDB document model handles SPP queries efficiently at 60-client scale (ENG-3 benchmark test)


### Top 3 — Absence → Approval in 3 Taps (DES-1)

**Why ranked third:** Top 1 (PM-1) defines what the product does. Top 3 (DES-1) defines whether coordinators will use it. The 6:30 AM moment is the highest-stakes UX moment in the product — it must work on a phone, under stress, before coffee. If the flow has 6 steps instead of 3, or requires a login, or shows 10 candidates instead of 3, coordinators will revert to phone calls.

**The Figma prototype (E3) tests this before a single line of production code is written.** If coordinators reject the top-ranked candidate more than 30% of the time in prototype testing, it signals a trust design problem — not a matching algorithm problem. The E3 result changes the design brief, not the engineering architecture.

**Critical assumptions to test:**
1. 3 candidates is the right number — not 1 (too prescriptive) or 5 (too many)
2. Familiarity flag is the trust-producing field — coordinators look at it first and it drives the approval decision
3. The flow is completable in < 60 seconds on a phone with no prior training
4. "Review manually" escape hatch (when no candidate exceeds 70% match) is used rarely — not a regular occurrence


### Top 4 — WhatsApp Business API Integration (ENG-2)

**Why ranked fourth:** This is the fastest adoption path for v1. Both Angela and Tom already use WhatsApp for absence notifications — this is confirmed behaviour, not an assumption. Building the approval flow inside WhatsApp removes the single largest adoption barrier for a new product: asking someone to download an app, create an account, and change their workflow.

**The concierge pretotype (E1) already runs via WhatsApp.** If E1 validates the matching concept, the path from concierge to product is a single engineering step — replace the human matching team with the Lambda pipeline (ENG-1) while keeping the WhatsApp interface. The coordinator experience does not change. The cost structure changes.

**Critical assumptions to test:**
1. Agencies will adopt WhatsApp Business API (requires a business account — not a personal number)
2. APP 8 cross-border disclosure obligations are satisfied by message content design (no personal health information in payload) and an updated agency privacy notice disclosing Meta infrastructure transit — this is an operational design and disclosure requirement, not a binary BAA-style blocker; privacy counsel must confirm before ENG-2 enters production
3. Coordinator reply ("1", "2", or "3") is an acceptable approval mechanism, or does it feel insufficient for a decision with real consequences?
4. The WhatsApp interface is a v1 bridge, not a permanent product surface — coordinator app is the long-term interface


### Top 5 — Carer Briefing Notification: Pre-Visit Soft Knowledge Push (DES-5)

**Why ranked fifth:** This closes the O1 loop from the other end. The matching engine (Top 1) assigns the right replacement carer. The briefing notification ensures the carer arrives prepared. Without the briefing, a correct match still risks a failed visit — Mrs. Henderson had the right qualifications, but without being briefed on her dementia protocols and familiarity requirements, the visit went badly.

**The commercial argument:** For Angela, the briefing notification removes her last 2–3 calls per vacancy incident. If Top 1 removes 8 of the 11 calls (availability + qualification checks) and Top 5 removes 2 more (briefing calls), Angela is down to 1 confirmation call per incident. If the notification delivery confirmation (ENG-4) removes the confirmation call, she is at 0.

**Critical assumptions to test:**
1. Replacement carers read push notifications 30 minutes before visits (vs. arriving at the door without reading)
2. 3–5 bullet points (DES-2 Knowledge Card format) is sufficient for the carer briefing — or do carers need more context?
3. Coordinators accept that the briefing is automated — they do not insist on calling carers personally before replacement visits



| Idea | Reason Not in Top 5 | When to Revisit |
|---|---|---|
| PM-3 — Agency Intelligence Dashboard | High value but requires O1/O2 data infrastructure to be built first — cannot run compliance checks on data that doesn't exist yet | After SPP and matching engine are live (v2) |
| PM-4 — Coordinator Handover Package | Standalone value but requires SPP completeness — only valuable after months of SPP accumulation | After agency has 3+ months of SPP data |
| PM-5 — Continuity Score | Requires visit history data to compute — cannot score continuity without a visit record | After visit data is flowing through the system (v2) |
| DES-4 — Compliance Wall | High value for Angela's audit scenario, but requires compliance rule engine (ENG-5) and SPP/visit data to be meaningful | After ENG-5 is built and compliance alerts are live |
| ENG-5 — Compliance Rule Engine | Important but lower urgency than matching pipeline — Angela's audit is in 6 weeks, but E1/E2/E3 are more urgent validators | Build in parallel with ENG-1/ENG-3, or as v1.1 |
| DES-3 — Onboarding Wizard (NLP extraction) | High value for adoption, but NLP extraction accuracy is an assumption that needs validation before building — could be replaced by structured form if extraction fails | After E2 validates whether narrative capture is sufficient |



*These are the assumptions that must be tested before any of the Top 5 ideas enters the build pipeline. Feeds directly into Artifact 7 (Identify Assumptions) and Artifact 8 (Prioritise Assumptions).*

| # | Assumption | Idea(s) | Risk Level | Test Method |
|---|---|---|---|---|
| A1 | Coordinator trusts system match ranking enough to approve without verifying by phone | PM-1, DES-1 | High | E3 (fake door prototype) |
| A2 | SPP completeness ≥ 80% of clients in first 30 days | PM-2, ENG-3 | High | E2 (extraction session) |
| A3 | Time-to-fill reduces to < 10 min on ≥ 70% of incidents | PM-1, ENG-1 | High | E1 (concierge pretotype) |
| A4 | Staff update availability reliably in app (vs. calling coordinator) | ENG-1, ENG-2 | High | E1 observation |
| A5 | 3 candidates is the right decision surface — not too few, not too many | DES-1 | Medium | E3 observation |
| A6 | Familiarity flag is the field that produces coordinator trust in the match | DES-1, DES-2 | Medium | E3 observation (eye-tracking / verbal) |
| A7 | APP 8 cross-border disclosure obligations (WhatsApp messages transit Meta's US/Ireland servers) are satisfied by message content design — no personal health information in payload — plus an updated agency privacy notice disclosing Meta infrastructure transit. Not a binary BAA-style blocker under APP; an operational design + disclosure requirement | ENG-2 | High | Privacy counsel review of APP 8 obligations + message content audit; agency privacy notice update drafted before ENG-2 production |
| A8 | Agencies will adopt WhatsApp Business API (vs. personal coordinator number) | ENG-2 | Medium | Agency buyer discovery interview |
| A9 | Replacement carers read pre-visit briefing notifications 30 min before visit | DES-5 | Medium | E1 observation (do coordinator briefing calls decrease?) |
| A10 | DynamoDB document model handles SPP queries at 60-client scale (< 200ms) | ENG-3 | Low | Benchmark test (technical spike) |



| ID | From Artifact | To Next Skill | What Transfers |
|---|---|---|---|
| HS-DISC-BR-01 | Artifact 6 — Top 5 ideas | `identify-assumptions-new` (Skill 7) | 10 assumptions (Section 6) → 8-category assumption map |
| HS-DISC-BR-02 | Artifact 6 — PM-1 + DES-1 + ENG-1 | `identify-assumptions-new` (Skill 7) | Matching engine concept as the primary assumption cluster |
| HS-DISC-BR-03 | Artifact 6 — PM-2 + ENG-3 | `identify-assumptions-new` (Skill 7) | SPP concept as prerequisite assumption cluster |
| HS-DISC-BR-04 | Artifact 6 — ENG-2 (WhatsApp) | `identify-assumptions-new` (Skill 7) | A7 (APP 8 cross-border disclosure) flagged as a Feasibility + Viability assumption — not a binary BAA blocker, but a design + disclosure obligation requiring privacy counsel review before production |
| HS-DISC-BR-05 | Artifact 6 — Held ideas (PM-3, PM-4, PM-5, DES-4, ENG-5) | Next discovery cycle | These are v2 opportunity nodes — hold for activation after E1/E2/E3 validation |



| Date | Owner | Action |
|---|---|---|
| 2026-03-27 | PM Lead | Run `identify-assumptions-new` (Skill 7) using Sections 4 and 6 of this artifact as input |
| 2026-03-27 | PM Lead | Engage privacy counsel: confirm APP 8 cross-border disclosure obligations for WhatsApp Business API (Meta US/Ireland infrastructure) + draft agency privacy notice update disclosing Meta data transit (A7 — must be resolved before ENG-2 enters production) |
| 2026-03-28 | Designer | Begin Figma prototype for E3 (DES-1 — 3-tap approval card, 5 vacancy scenarios) |
| 2026-03-28 | Engineer | Spike: benchmark DynamoDB document query latency for SPP retrieval at 60-document scale (A10) |
| 2026-03-29 | PM Lead | Confirm E1 coordinator participants (Angela + Tom) and brief on concierge pretotype process |


*Brainstorm note: Ideas PM-3 (Agency Intelligence Dashboard), PM-5 (Continuity Score), and ENG-5 (Compliance Rule Engine) are not in the Top 5 because they require the matching engine and SPP infrastructure to be live before they can deliver value. They are not deprioritised for lack of value — they are sequenced after the foundational layer is validated. Per CLAUDE.md Article III: "75% assumption failure rate — assume three-quarters of ideas will not perform as hoped. Design experiments, not roadmaps."*
