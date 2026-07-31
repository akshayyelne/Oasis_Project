# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Discovery/Artifact_9_Ethics_Trust_Map.md
# Generated: 2026-07-31T00:49:45.137Z

**Project:** Home-Care-AI
**Stage:** Discovery → Stage 4 (Risk & Ethics Gating)
**Skill:** ethics-trust-mapping
**Date:** 2026-03-26
**Methodology:** Green / Yellow / Red data classification; Creepiness vs. Care test; Compound Combination flags
**Input:** Artifact 7 (E-1 through E-6) + Artifact 8 (Q1/Q2 Critical ethics assumptions) + CLAUDE.md Article VII Trust Zone Framework
**Regulatory Context:** Australian Privacy Act 1988 (APP). HIPAA-grade security applied as design floor.
**Feeds into:** Artifact 10 — Agentic Safety Discovery (Skill 10)


> **Purpose of this artifact:** Before any data is collected or any feature is built, every data type in the product must be classified by sensitivity zone. A Red-zone data type cannot be implemented without DPIA + explicit informed consent — regardless of how valuable the feature is. This is a hard gate, not a guideline.



| Zone | Data Type | Collection Rule | APP Obligation |
|---|---|---|---|
| 🟢 **Green** | Non-intrusive operational data | Collect by default; standard privacy notice sufficient | APP 1 (open and transparent); APP 5 (notice at collection) |
| 🟡 **Yellow** | Sensitive: location patterns, medication schedules, activity baselines, soft preferences | Explicit opt-in required; DPIA recommended | APP 3 (sensitive information — explicit consent); APP 5 + APP 6 |
| 🔴 **Red** | Invasive: voice tone analysis, cognitive inference, compound health signals, indirect health inference | Emergency-only trigger; DPIA mandatory; explicit informed consent; legal review before implementation | APP 3 (sensitive); DPIA under APP 1; legal review required |



*Sourced from Artifact 5 (OST solutions S1–S11), Artifact 6 (PM-1 through ENG-5), and Artifact 7 (ethics assumptions E-1 through E-6).*


### 2A — Coordinator Data

| # | Data Type | Description | Zone | Rationale |
|---|---|---|---|---|
| C-1 | Coordinator identity | Name, agency, role, contact details | 🟢 Green | Standard employment/operational data; not sensitive under APP |
| C-2 | Coordinator device + session data | Login timestamps, session duration, notification open rates | 🟢 Green | Operational product analytics; non-intrusive |
| C-3 | Coordinator approval decisions | Which replacement candidate was approved for each vacancy incident | 🟢 Green | Operational data; no health inference; used for matching algorithm improvement |
| C-4 | Coordinator SPP edit history | Which SPP fields were updated, by whom, and when | 🟡 Yellow | Reveals coordinator judgment patterns; combined with client data could surface coordination quality inferences. Append-only audit trail required. |


### 2B — Staff (Carer) Data

| # | Data Type | Description | Zone | Rationale |
|---|---|---|---|---|
| S-1 | Carer identity + qualifications | Name, credential type, expiry dates | 🟢 Green | Standard employment data; collected with employment consent |
| S-2 | Carer availability status | Daily availability window (suburb/postcode input by carer) | 🟢 Green | Self-reported, voluntary; not location tracking. Carer initiates update. Clearly distinct from GPS surveillance. |
| S-3 | Carer proximity score | Distance from availability postcode to client address (Google Maps computation) | 🟢 Green | Derived from self-reported postcode; not a live GPS coordinate. No persistent location record. |
| S-4 | Carer assignment history | Which clients each carer has visited, frequency, recency | 🟡 Yellow | Combined with SPP data, reveals which carers are preferred/excluded by specific clients. Creates indirect employment condition implications (see E-1). Requires legal review. |
| S-5 | Carer acceptance/rejection rate | How often each carer's assignment was approved vs. overridden by coordinator | 🟡 Yellow | Performance-adjacent metric. Could be used to discriminate against carers in future assignment decisions. Collect only for matching improvement; do not expose as a carer-facing metric without employment law review. |
| S-6 | Pre-visit briefing receipt | Whether carer opened the pre-visit briefing notification | 🟢 Green | Binary delivery confirmation; no health data; operational |


### 2C — Client Data (Soft Preference Profile — SPP)

*This is the most ethically complex data category. Each SPP field is classified individually.*

| # | Data Type | Description | Zone | Rationale |
|---|---|---|---|---|
| P-1 | Client identity | First name, client ID (UUID), agency | 🟢 Green | Operational; pseudonymised (UUID used in system; name only in coordinator interface) |
| P-2 | Carer gender preference | "Prefers female carers" | 🟡 Yellow | Sensitive under APP 3 (relates to personal circumstances); explicit opt-in required. Also creates E-1 risk (discriminatory carer filtering) — requires legal opinion before implementation. |
| P-3 | Familiarity threshold | "Known carers only / briefed-acceptable / any" | 🟡 Yellow | Reveals anxiety levels, cognitive state, or social isolation. Implicit health inference. Explicit opt-in required. |
| P-4 | Dementia briefing requirements | "Client has dementia — brief new carers on [protocols]" | 🔴 Red | Direct health condition disclosure. Constitutes sensitive health information under APP 3. DPIA mandatory. Explicit informed consent from client (or guardian) required before collection. Cannot be inferred by the system — must be coordinator-entered with client consent. |
| P-5 | Personal triggers | "Do not move Arthur's belongings" | 🟡 Yellow | Reveals behavioural sensitivity or anxiety. Could imply cognitive or psychological condition. Explicit opt-in required; no inference permitted. |
| P-6 | Refusal conditions | "Lin Chen refuses entry if she doesn't recognise visitor" | 🔴 Red | Directly implies cognitive or psychological condition (distrust of strangers = potential dementia or anxiety disorder signal). Inference risk is HIGH. DPIA mandatory. Legal review required before collection. |
| P-7 | Continuity history | Which carers have visited, how many times, last visit date | 🟢 Green | Operational visit record; no health inference; identical to any agency visit log |
| P-8 | Carer familiarity flag | "David Kim — 2 prior visits — positive outcome" | 🟡 Yellow | Outcome rating ("positive") implies coordinator judgment of visit quality, which could encode health inference. Collect as binary (visited / not visited) in v1; exclude outcome rating until ethical review complete. |
| P-9 | Free-text briefing notes | Open field: "Call coordinator if [condition]" | 🔴 Red | Unstructured text is the highest-risk field. Free text can contain health conditions, medication names, behavioural descriptions, cognitive assessments. Must be subject to PHI/sensitive information scan before storage. Cannot be included in any notification payload. DPIA mandatory. |
| P-10 | SPP completeness score | Percentage of fields populated | 🟢 Green | Aggregate metadata; no individual field content; operational |
| P-11 | Client address | Full address for matching proximity computation | 🟡 Yellow | Location data; sensitive under APP. Stored encrypted; used only for proximity computation; not transmitted in notifications; not accessible to carers (only carer is notified of client's suburb, not full address, until assignment confirmed). |


### 2D — Family / Family Contact Data

| # | Data Type | Description | Zone | Rationale |
|---|---|---|---|---|
| F-1 | Family contact identity | Name, relationship to client, contact details | 🟢 Green | Standard contact data; collected with client's consent at intake |
| F-2 | Notification channel preference | SMS / email / app | 🟢 Green | Operational; non-sensitive |
| F-3 | Notification delivery status | Delivered / failed | 🟢 Green | Operational audit trail |
| F-4 | Family contact international routing | Country code for SMS routing | 🟢 Green | Technical routing data; non-sensitive |


### 2E — AI / System-Generated Data

| # | Data Type | Description | Zone | Rationale |
|---|---|---|---|---|
| A-1 | Match score | Rule-based SPP compatibility score for each candidate | 🟢 Green | Derived operational metric; not health data; used only in coordinator decision flow |
| A-2 | SPP match explanation | Which preference tags drove the match score | 🟡 Yellow | Combined with client and carer data, reveals which client attributes drove the decision. Coordinator-facing only; never surfaced in carer briefing or family notification. |
| A-3 | Compliance alert data | Overdue care plan reviews, expired credentials, documentation gaps | 🟡 Yellow | Reveals care quality information. Coordinator-only; not surfaced to family or client without clinical review. |
| A-4 | Continuity score | Rolling 30-day carer consistency metric per client | 🟡 Yellow | Derived from visit history; implies care quality judgment. Coordinator-only; explicit consent not required (operational metric) but must not be shared with family or client as a score. |
| A-5 | AI confidence score | Float 0.0–1.0 for any AI-generated recommendation | 🟢 Green | Internal system metadata; not shared externally; required in HIPAA-grade audit log |
| A-6 | Audit log entry | Full HIPAAAuditLogEntry per CLAUDE.md Article IX | 🟡 Yellow | Contains state transitions and action data. Not PHI but sensitive operational record. Append-only; 7-year retention; immutable. Access restricted to agency management and regulatory audit. |



*For each Yellow and Red data type: would collecting this feel like care or surveillance to the person it's about? This test is applied from the perspective of the client (SR cohort) and the carer.*

**Test standard (from Arthur Kovacs, SR-002):** "He didn't find out about the AI flag from me. He found out because his son phoned him in a panic." This is the canonical failure case. Any data collection or notification flow that could produce this outcome fails the Creepiness vs. Care test.


### Yellow Data — Creepiness vs. Care Assessment

| Data Type | Feels Like Care If… | Feels Like Surveillance / Creepiness If… | Verdict |
|---|---|---|---|
| P-2 — Gender preference | Client was asked directly and confirmed their preference; carer assignment respects it | Coordinator assumes preference based on client's cultural background or dementia presentation; client never consented | **Care** — only if directly elicited from client with consent. Inferred preferences are surveillance. |
| P-3 — Familiarity threshold | Coordinator uses it to protect client from distressing new-carer encounters | Client discovers that a system is tracking their "anxiety level" and adjusting who visits them | **Care** — if framed as "protecting your routine." Creepy if framed as "monitoring your anxiety." |
| P-5 — Personal triggers | Client told coordinator "please don't move my things" and that preference is honoured | System infers triggers from visit notes without client knowing they are being collected | **Care** — if directly elicited. Creepy if inferred. |
| P-8 — Familiarity flag (outcome) | Coordinator records "positive visit" to help the next coordinator know who Mrs. Kim trusts | Carer receives a "performance rating" based on client outcomes they weren't told about | **Care** for client; potentially **Creepy** for carer if outcome rating is accessible to them. Collect as binary (visited/not visited) in v1. |
| P-11 — Client address | Used only to compute proximity for replacement matching; not shared until carer is confirmed | Full address transmitted in WhatsApp matching message before assignment is confirmed | **Care** — only if address is withheld until confirmed assignment. Sharing address pre-confirmation is a privacy breach. |
| S-4 — Carer assignment history | Helps match familiar carers to clients who value continuity | Carer discovers they are being tracked across all clients and rated on "acceptance rate" | **Care** for client. **Creepy** for carer if misused. Requires carer-facing privacy notice. |
| A-3 — Compliance alert | Coordinator uses it to proactively fix overdue care plans before audit | Agency owner uses it to performance-manage coordinators without disclosure | **Care** for client. Governance policy required: compliance alerts are operational, not HR data. |


### Red Data — Mandatory Review

| Data Type | Risk | Required Before Collection |
|---|---|---|
| P-4 — Dementia briefing requirements | Direct health condition disclosure. Third-party disclosure to carers without specific consent is a Privacy Act breach. Disclosure to family without clinical gating violates Arthur Kovacs constraint (E-3). | DPIA. Explicit informed consent from client or legally appointed guardian. Legal review of disclosure obligations to carers. |
| P-6 — Refusal conditions | High inference risk: "refuses entry if she doesn't recognise visitor" directly implies cognitive condition (dementia, anxiety disorder). Even if true, inferring and recording it without clinical confirmation is a health inference under APP. | DPIA. Clinical confirmation before recording. Explicit consent. Legal review. |
| P-9 — Free-text briefing notes | Unstructured text is uncontrollable. A coordinator typing "remind her about her dementia" creates a PHI record without the associated consent and handling protections. | DPIA. PHI scan on all free-text input before storage. Clinical review of any health-related text. Consider replacing with structured fields only in v1 — defer free-text to v2 with full DPIA. |



*Per CLAUDE.md Article VII: "flag compound combinations." A data type that is Green or Yellow individually may become Red when combined with another. These combinations must be identified before the data model is designed.*

| Combination | Component 1 | Component 2 | Individual Zones | Combined Zone | Risk |
|---|---|---|---|---|---|
| **CC-1** | Refusal conditions (P-6) | Dementia briefing requirements (P-4) | Red + Red | 🔴 Red (amplified) | Two health indicators combined produce a clinical profile without a clinical governance framework. This is an unregistered health record. Cannot exist without DPIA + clinical oversight. |
| **CC-2** | Familiarity threshold (P-3) | Refusal conditions (P-6) | Yellow + Red | 🔴 Red | Familiarity anxiety + refusal behaviour = cognitive impairment inference. The combination produces a health conclusion neither field implies individually. |
| **CC-3** | Continuity score (A-4) | Client address (P-11) | Yellow + Yellow | 🔴 Red | Continuity score reveals care quality patterns; combined with address creates a geographically indexed care quality signal. If accessible externally (e.g., family portal), this is a health inference about a specific person at a specific location. |
| **CC-4** | Carer assignment history (S-4) | Gender preference (P-2) | Yellow + Yellow | 🔴 Red | Combined: reveals which carers are systematically excluded from a client's care on the basis of gender. At scale, this creates a discriminatory assignment pattern for carers — the E-1 risk made concrete in the data model. This combination is the mechanism of discrimination, not just a theoretical risk. |
| **CC-5** | Free-text notes (P-9) | Any other SPP field | Red + Any | 🔴 Red (absolute) | Free-text combined with any structured field creates an uncontrolled health record. The structured fields provide context that makes the free-text clinically interpretable. Do not combine free-text with structured SPP fields in the same query or prompt. |
| **CC-6** | SPP match explanation (A-2) | Carer notification (DES-5) | Yellow + Green | 🟡 Yellow (elevated) | The match explanation (which preference tags drove the score) must never appear in the carer briefing notification. Showing "matched because: female carer required" reveals the client's gender preference to the carer — a disclosure the client may not have consented to. Carer receives only: visit details + soft briefing notes (non-inferential). |
| **CC-7** | Compliance alert data (A-3) | Client identity (P-1) | Yellow + Green | 🟡 Yellow | Compliance alerts are coordinator-facing operational data. Combined with client identity, they become a per-client quality signal. Must not be surfaced in any family-facing or client-facing interface without clinical review. |
| **CC-8** | WhatsApp message content | Any Yellow/Red field | Variable + Variable | Context-dependent | WhatsApp messages transit Meta's infrastructure. No Yellow or Red data type may appear in any WhatsApp message payload. Green data only: staff names, match score (numeric), visit time, suburb (not full address). See VI-4 resolution path in Artifact 8. |



*Arthur Kovacs constraint — mandatory structural gate derived from E-3 (Artifact 8, Q4 — structural gate).*

**Rule: Patient/Client is always first to know. Family is never notified before the coordinator has approved and the client has been informed (or the client has a recorded preference for family-first notification).**

| Event | Notification Order | Condition |
|---|---|---|
| Visit cancelled or replaced | 1. Coordinator (approval confirmation) → 2. Replacement carer (assignment) → 3. Client (if app / SMS enrolled) → 4. Family | Family notification triggers only after `coordinator_approved = true` AND `client_notified = true` (or `client_notification_preference = family_first` with explicit consent) |
| Schedule change (non-urgent) | 1. Coordinator → 2. Client → 3. Family | Same ordering. Family is never notified of a schedule change before the client. |
| Compliance alert | Coordinator only | Never surfaced to family or client without coordinator/clinical review. |
| AI inference (any health signal) | Coordinator / Clinical reviewer → Client (with clinical framing) → Family (if client consents) | No AI inference is communicated to family before it is reviewed by a clinician and disclosed to the client. This is the Arthur Kovacs constraint operationalised. |

**Prohibited notification flows:**
- ❌ AI flag → Family (bypasses client and clinical review)
- ❌ Schedule change → Family (before client is informed)
- ❌ SPP data → Carer briefing (fields above Green zone level)
- ❌ Compliance alert → Client or Family (coordinator-only operational data)



### 🟢 Green — Collect by Default

*Standard privacy notice sufficient. No additional consent required. Collect during normal product onboarding.*

Data types: C-1, C-2, C-3, S-1, S-2, S-3, S-6, P-1, P-7, P-10, F-1, F-2, F-3, F-4, A-1, A-5

**Privacy notice must include:**
- What data is collected
- How it is used (operational scheduling and matching)
- Who has access (coordinator, agency owner, regulatory audit)
- Retention period (7 years per HIPAA-grade design floor; review against APP 11)
- How to request correction or deletion (APP 12, APP 13)


### 🟡 Yellow — Explicit Opt-In Required

*Collect only after explicit opt-in. DPIA recommended. Separate consent collection event.*

Data types: C-4, S-4, S-5, P-2, P-3, P-5, P-8 (binary only — no outcome rating), P-11, A-2, A-3, A-4, A-6

**Consent event design:**
- Coordinator presents opt-in to client during intake or first scheduled review
- Language: "We'd like to record your carer preferences to ensure consistency in your care. This information is only seen by your care coordinator and is used to match you with familiar carers when your regular carer is unavailable. You can update or remove this information at any time."
- Recorded consent: timestamp + coordinator_id + client_id + fields consented to
- Granular opt-in: client can consent to P-2 (gender preference) without consenting to P-3 (familiarity threshold)

**DPIA trigger:** Any Yellow data type collected at scale (>50 clients) requires a Privacy Impact Assessment before collection begins.


### 🔴 Red — Emergency-Only or Requires Full Legal Process

*Cannot be collected or implemented without: DPIA completed + explicit informed consent + legal review + clinical oversight.*

Data types: P-4, P-6, P-9 (and all Compound Combinations CC-1 through CC-5)

**Mandatory steps before any Red data type enters the product:**

1. **DPIA** — Document the data flow, necessity, proportionality, risks, and mitigations. Must be signed off by a designated privacy officer or equivalent.
2. **Legal review** — Australian privacy counsel must confirm the data type and collection method is lawful under APP 3 (sensitive information) and does not breach anti-discrimination law (for P-2 + P-6 compound).
3. **Clinical oversight** — Any data type that implies a health condition (P-4 dementia, P-6 refusal behaviour) must be confirmed by a clinician before being recorded, not inferred by the coordinator or the AI.
4. **Explicit informed consent** — Client (or legally appointed guardian) must consent specifically to this data type, separate from the general Yellow consent event. Consent must be documented, revocable, and reviewable.
5. **Minimum necessary** — Only collect the specific field required for the feature. No Red data type should be collected speculatively or for future use.

**V1 recommendation for Red data types:**
- **P-4 (Dementia briefing):** Replace with a structured field: "Requires new-carer briefing: Yes / No" — binary flag without condition disclosure. The briefing protocol lives in the coordinator's head; only the flag is in the system. Eliminates the Red zone risk in v1.
- **P-6 (Refusal conditions):** Replace with: "Entry requires: [dropdown — ID check / introduction by coordinator / familiar carer only]" — removes condition inference. The reason for the requirement is not recorded.
- **P-9 (Free-text notes):** Defer entirely to v2. In v1, all SPP fields are structured dropdowns or binary flags. Free-text introduces uncontrollable PHI risk that cannot be managed without a full DPIA and PHI scanning infrastructure.



*Every feature from Artifact 6 (Top 5) is assessed against this ethics map before it can proceed to Artifact 10 (Agentic Safety) or the Strategy Plugin.*

| Feature | Key Data Types Used | Ethics Gate Status | Condition to Clear |
|---|---|---|---|
| **PM-1 Smart Match Engine** | S-2 (availability), S-3 (proximity), P-2 (gender pref), P-3 (familiarity), P-7 (history), A-1 (match score) | ⚠️ **CONDITIONAL** | Legal opinion on E-1 (discriminatory selection) required before P-2 is used as a matching parameter. If legal opinion is negative, P-2 is removed from match scoring; coordinator sees it as advisory only. |
| **PM-2 SPP: Institutional Memory** | P-1 through P-9, C-4 | ⚠️ **CONDITIONAL** | P-4, P-6, P-9 must be replaced with structured alternatives (Section 6 recommendation) before v1 collection begins. Yellow fields require opt-in consent event. DPIA required for collection at scale. |
| **DES-1 3-Tap Approval Flow** | A-1 (match score), S-1 (carer name), S-2 (proximity) | ✅ **CLEARED** | All data types used are Green. No ethics gate blocking. |
| **ENG-2 WhatsApp Integration** | S-1 (carer name), A-1 (match score), P-11 (client address — suburb only) | ⚠️ **CONDITIONAL** | CC-8 compound rule: only Green data in WhatsApp payload. P-11 restricted to suburb (not full address) until confirmed assignment. APP 8 privacy counsel review required (VI-4). |
| **DES-5 Carer Briefing Notification** | P-1 (first name), P-5 (triggers), P-2 (gender preference) | ⚠️ **CONDITIONAL** | CC-6 compound rule: match explanation (A-2) must not appear in carer notification. P-2 (gender preference) must not appear in carer notification — it is a client preference, not a carer instruction. P-5 (triggers) may appear as operational guidance: "Please introduce yourself clearly at the door" — not "Client prefers X because of Y condition." |



*All DPIA obligations identified in this artifact.*

| DPIA ID | Trigger | Data Types | Priority | Owner |
|---|---|---|---|---|
| DPIA-01 | SPP collection at scale (>50 clients) — Yellow fields | P-2, P-3, P-5, P-8, P-11, S-4 | High — before agency onboarding begins | PM Lead + Privacy Counsel |
| DPIA-02 | Dementia briefing requirements (P-4) | P-4 | **CRITICAL** — before any collection | Privacy Counsel + Clinical Advisor |
| DPIA-03 | Refusal conditions (P-6) | P-6 | **CRITICAL** — before any collection | Privacy Counsel + Legal Counsel |
| DPIA-04 | Free-text notes (P-9) | P-9 | **CRITICAL** — recommend deferral to v2 | Privacy Counsel |
| DPIA-05 | Compound combination CC-1 (P-4 + P-6) | P-4 + P-6 | **CRITICAL** — do not combine in v1 data model | PM Lead + Privacy Counsel |
| DPIA-06 | Compound combination CC-4 (S-4 + P-2) | S-4 + P-2 | High — before matching algorithm is built | Legal Counsel (anti-discrimination) |
| DPIA-07 | WhatsApp cross-border disclosure (CC-8) | All message payload fields | High — before ENG-2 production | Privacy Counsel (APP 8) |



*The minimal data model that can enter production in v1 without any outstanding DPIA or legal review (all Red fields replaced with structured alternatives, Yellow fields with completed consent protocol).*

**SPP fields cleared for v1 collection (with Yellow consent event):**

| Field | Zone | V1 Implementation |
|---|---|---|
| Gender preference | 🟡 Yellow | Dropdown: Female only / Male only / No preference |
| New carer briefing required | 🟢 Green (replaces Red P-4) | Boolean: Yes / No — no condition disclosed |
| Familiarity threshold | 🟡 Yellow | Dropdown: Known carers only / Briefed-acceptable / Any |
| Entry protocol | 🟢 Green (replaces Red P-6) | Dropdown: ID check required / Introduction call required / No special requirement |
| Personal sensitivities | 🟡 Yellow | Short structured text (max 100 chars): "Do not move belongings in lounge" — no condition inference |
| Carer familiarity history | 🟡 Yellow | Carer UUID list + visit count + last visit date — no outcome rating |
| Client address (matching only) | 🟡 Yellow | Full address stored encrypted, suburb only used for proximity scoring, full address only released to confirmed replacement carer |

**Fields deferred to v2 (pending DPIA + legal review):**
- Dementia briefing content (P-4 detail beyond boolean)
- Refusal conditions with reason (P-6 detail beyond entry protocol dropdown)
- Free-text notes (P-9)
- Outcome ratings in familiarity history (P-8 enhancement)



| ID | From Artifact | To Next Skill | What Transfers |
|---|---|---|---|
| HS-DISC-ETH-01 | Artifact 9 — Red data types + DPIA register | `agentic-safety-discovery` (Skill 10) | P-4, P-6, P-9 compound risks → Level 1/2/3 agentic action classification for any feature touching these fields |
| HS-DISC-ETH-02 | Artifact 9 — Notification routing rules (Section 5) | `agentic-safety-discovery` (Skill 10) | E-3 structural gate → HITL requirement before any family notification action |
| HS-DISC-ETH-03 | Artifact 9 — Feature clearance table (Section 7) | `brainstorm-experiments-new` (Skill 11) | Conditional clearances for PM-1, PM-2, ENG-2, DES-5 → experiments must test within cleared data boundaries |
| HS-DISC-ETH-04 | Artifact 9 — V1 data model (Section 9) | `startup-canvas` (Strategy Plugin) | Cleared field set → informs data collection design in canvas |
| HS-DISC-ETH-05 | Artifact 9 — DPIA-01 through DPIA-07 | `compliance-privacy-audit` (Strategy Plugin) | DPIA obligations → Compliance Risk Score inputs |
| HS-DISC-ETH-06 | Artifact 9 — Compound combinations CC-1 through CC-8 | `agentic-logic-spec` (Execution Plugin) | Compound combinations become explicit IF-THEN guards in pseudocode — CC-4 (S-4 + P-2) and CC-8 (WhatsApp + Yellow/Red) are structural blockers |



| Date | Owner | Action |
|---|---|---|
| **2026-03-27** | PM Lead | Run `agentic-safety-discovery` (Skill 10) — feed notification routing rules (Section 5) + feature clearance table (Section 7) |
| **2026-03-27** | Privacy Counsel | DPIA-01: initiate SPP Yellow-field DPIA for scale collection |
| **2026-03-27** | Privacy Counsel | DPIA-02 + DPIA-03: legal review for P-4 (dementia) and P-6 (refusal) — recommend v1 structured-field replacements |
| **2026-03-27** | Legal Counsel | E-1 / DPIA-06: anti-discrimination opinion on P-2 (gender preference) as a matching parameter |
| **2026-03-28** | PM Lead | Update SPP data model spec to v1 cleared fields only (Section 9) — remove P-4 detail, P-6 detail, P-9 from any v1 wireframe or schema |
| **2026-03-28** | Designer | Update DES-5 carer briefing notification template — confirm CC-6 rule: no match explanation, no gender preference in carer notification |
| **2026-03-28** | PM Lead | Update ENG-2 WhatsApp message spec — confirm CC-8 rule: Green data only; suburb not full address until confirmed assignment |
| **2026-03-29** | PM Lead | Present consent event design (Section 6 Yellow) to Angela during E2 session — confirm framing is acceptable to coordinator before designing the UX |


*Ethics gate note: This artifact is a gate, not a guideline. No feature with a Conditional clearance (Section 7) may enter the build pipeline until the stated condition is resolved. No Red data type may be collected until DPIA is completed and legal review is signed off. The compound combinations in Section 4 are structural constraints that must appear in `agentic-logic-spec` pseudocode as explicit IF-THEN guards — they are not design preferences.*
