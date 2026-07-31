# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Strategy/Artifact_15_User_Journey_Map.md
# Generated: 2026-07-31T00:49:45.182Z

**Project:** Home-Care-AI
**Stage:** Strategy → Stage 2 (Customer Value Definition)
**Skill:** user-journey-map
**Date:** 2026-03-27
**Methodology:** One Persona × One Phase deep dive — 8 data points per step; Emotional Arc; AI Intervention Classification (L1/L2/L3); Service Blueprint layer
**Persona:** Care Coordinator — Angela Morrison (CC-001)
**Phase:** Exception Handling — Vacant Visit Replacement
**Input:** Artifact 14 (Value Proposition — CC §1), Artifacts 2b/2c (CC interview transcripts), Artifact 10 (Agentic Safety — ACT classifications), Artifact 9 (Ethics — E-3 gate, CC-6, CC-8)
**Regulatory Context:** Australian Privacy Act 1988 (APP). HIPAA-grade security applied as design floor.
**Feeds into:** Artifact 16 — Compliance Privacy Audit (Strategy Skill 5); `create-prd` §7.2 Priority 1 features (HS-STRAT-01); `agentic-logic-spec` NFRs (HS-STRAT-02)


> **Scope note:** This is a single-session deep dive. Per CLAUDE.md Article IV Rule 3: "One Persona × Phase deep dive per session. Never map all 4 archetypes in one pass." The CC Exception Handling phase is the highest-priority mapping target because it is the Moment of Truth that either validates or refutes the value proposition (Artifact 14 §7).



**Angela Morrison, CC-001** — Care Coordinator, CareBridge (60+ clients, 12 nurses, 8 care workers)

Angela is a high-competence, high-load coordinator who carries her agency's entire institutional knowledge in her head and on sticky notes. She is technically capable (uses WhatsApp, spreadsheets, a scheduling calendar) but operates in a system vacuum: no tool unifies qualification matching, client preference knowledge, and notification. She experiences 3–5 carer absences per week, each requiring 11 manual calls and 30–60 minutes of escalating stress. Her deepest professional fear is a missed visit she didn't know about — specifically the Arthur Kovacs scenario: a client waiting in a chair, a family calling in fury, and Angela finding out she failed someone who was depending on her.

She is not resistant to technology. She is resistant to technology that makes her *slower* or that acts without her judgment. The product must feel like trusted support, not like automation taking over her role.



> Angela is trying to **fill all three of Jenny's cancelled visits before the first one starts at 8:00 AM** — in the context of a carer calling in sick at 6:30 AM, with 90 minutes to resolve it, on a phone, before she's had coffee.



*8 data points per step. Steps are sequential; time stamps are indicative based on Angela's CC-001 interview data.*


### Step 1 — Absence Detection (T=0, 6:30 AM)

| Element | Detail |
|---|---|
| **Steps / Actions** | Receives WhatsApp from Jenny: "So sorry, really sick today, can't make my visits." Angela opens the scheduling app to find the affected visits. Three visits. First starts at 8:00 AM. |
| **Touchpoints** | WhatsApp (personal phone) → scheduling calendar (desktop app, opens slowly) |
| **Thoughts** | *"Not today. Not three visits. It's six-thirty."* Immediate mental scan: which clients are affected? What are their situations? Who will be hard to replace? |
| **Emotions** | 😟 **Anxiety spike** (3/5 → 1/5). The visceral gut-drop of realising the morning has just changed completely. Not yet panic — but dread. |
| **Pain Points** | The absence arrives via WhatsApp but the schedule is in a separate system. Angela must manually cross-reference two tools to understand the impact. No system connects the absence event to the affected visits automatically. |
| **AI Intervention Opportunity** | **L1 — Inform:** System detects the vacancy event (ACT-V-01) and immediately surfaces the affected visits, ranked by urgency (visit start time). Angela sees the impact before she has to search for it. |
| **Data Required** | Carer identity (S-1), scheduled visits linked to carer (visit records — Green), visit start times, client IDs |
| **Trust Signal Needed** | Speed: the system must surface the impact in < 5 seconds of the absence being recorded. Delay here increases Angela's anxiety, not reduces it. |


### Step 2 — Impact Assessment (T+5 min, 6:35 AM)

| Element | Detail |
|---|---|
| **Steps / Actions** | Angela reads the three affected visits: Mrs. Kim (8:00 AM), Arthur Kovacs (9:30 AM), Lin Chen (11:00 AM). She runs a mental triage: which are most critical? Which clients are most vulnerable to an unfamiliar carer? |
| **Touchpoints** | Scheduling calendar (desktop) + Angela's memory |
| **Thoughts** | *"Mrs. Kim only accepts female carers. Arthur will be okay with someone briefed, but he needs the briefing. Lin will refuse entry to anyone she doesn't recognise. I can maybe find someone for Arthur and Mrs. Kim. Lin is going to be the problem."* |
| **Emotions** | 😰 **Cognitive overload** (1/5). Angela is running a complex multi-variable triage entirely in her head. None of this preference knowledge is in the scheduling system. |
| **Pain Points** | The scheduling system shows visit times and client names — nothing else. Angela must mentally retrieve the preference and vulnerability data for each client from memory. This knowledge exists nowhere in the system. |
| **AI Intervention Opportunity** | **L1 — Inform:** System surfaces the SPP for each affected client alongside the visit list: Mrs. Kim — "Gender preference: female"; Arthur Kovacs — "Familiarity threshold: briefed-acceptable"; Lin Chen — "Familiarity threshold: known carers only." Angela triages with the system instead of from memory. |
| **Data Required** | SPP fields: gender preference (P-2), familiarity threshold (P-3), continuity history (P-7), entry protocol (P-6 structured replacement) |
| **Trust Signal Needed** | Accuracy: Angela must trust that the SPP reflects what she knows. On first use, she will cross-check every SPP field against her mental model. If one field is wrong, she loses confidence in all of them. |


### Step 3 — Candidate Search Initiation (T+10 min, 6:40 AM)

| Element | Detail |
|---|---|
| **Steps / Actions** | Angela opens the staff roster (spreadsheet). Filters mentally for: qualified (right credential type), available (not already scheduled), close enough (within reasonable travel distance), and — critically — familiar to the affected clients. |
| **Touchpoints** | Spreadsheet (desktop) + WhatsApp (to check recent availability messages) + memory |
| **Thoughts** | *"Who's available this morning? David Kim is usually free Tuesdays. Sarah Ng has the right qualifications but lives in Parramatta — that's too far for the 8 AM. Who has met Mrs. Kim before? I think Maria has... or was that a different client?"* |
| **Emotions** | 😤 **Frustration** (1/5). The data she needs is spread across four systems, none of which talk to each other. She is the integration layer. |
| **Pain Points** | No system ranks candidates. No system filters by qualification + proximity + familiarity simultaneously. Angela is executing a multi-criteria optimisation problem mentally, with no decision support, in real time. |
| **AI Intervention Opportunity** | **L1 — Inform:** System runs the match algorithm (ACT-V-02 through V-04): qualification gate (hard) → proximity score → SPP match score. Returns a ranked shortlist of 3 candidates per affected visit. Angela sees the result of the computation she was doing manually — in < 30 seconds. |
| **Data Required** | Staff roster (S-1 qualifications + credential expiry), availability index (S-2 self-reported postcode), proximity computation (S-3 via Google Maps API), SPP familiarity history (P-7 + P-8) |
| **Trust Signal Needed** | Transparency: Angela needs to understand *why* each candidate is ranked where they are. Not a black-box score — a human-readable rationale: "Ranked #1: David Kim — Qualified ✓ — 2.3 km — 2 prior visits with Mrs. Kim." |


### Step 4 — The Phone Cascade (T+15 min → T+45 min, 6:45–7:15 AM)

*[Current state — without Home-Care-AI. This is the pain point the product eliminates.]*

| Element | Detail |
|---|---|
| **Steps / Actions** | Angela begins calling candidates. Call 1: no answer. Call 2: unavailable (already scheduled elsewhere). Call 3: answers, but hasn't met any of the three clients. Call 4–7: finding availability. Call 8–11: finding trust match. Total: 11 calls, 30–45 minutes of elapsed time. |
| **Touchpoints** | Phone calls (personal phone) — entirely analog, unlogged, unauditable |
| **Thoughts** | *"Nobody's answering. It's 6:45 AM. Of course nobody's answering."* → *"I've found someone for Mrs. Kim and Arthur. Lin is going to be a cancellation."* → *"I need to tell the client before the family finds out."* (Usually forgotten in the cascade.) |
| **Emotions** | 😩 **Peak frustration / low-grade panic** (1/5 → 1/5). The cascade is cognitively exhausting and emotionally depleting. Each unanswered call increases the likelihood of a cancelled visit. |
| **Pain Points** | Sequential, not parallel. Each call consumes time that is running out. No record of who was called and why they were rejected. No way to learn from this incident to improve the next one. |
| **AI Intervention Opportunity (with product):** | **L2 — Verify:** System presents the ranked shortlist (ACT-A-01). Angela reviews the 3 candidates. She sees: "David Kim — 2 prior visits with Mrs. Kim — Qualified ✓ — 2.1 km — Match score: 94%." She taps Approve. No calls made. |
| **Data Required** | All data already computed in Step 3 shortlist; coordinator session data for audit log |
| **Trust Signal Needed** | **The Moment of Truth (see §4).** The familiarity flag ("2 prior visits") is the single most important element on the candidate card. Angela's decision to approve without calling depends entirely on whether she trusts that the system knows what she knows. |


### Step 5 — Coordinator Approval (T+5 min with product / T+45 min without)

| Element | Detail |
|---|---|
| **Steps / Actions** | *[With product]:* Angela reviews the shortlist on her phone. She sees the familiarity flag for Mrs. Kim's top candidate. She taps the candidate card. A preview appears: "This message will be sent to David Kim: [visit details]." She taps "Confirm." 3 taps total. |
| **Touchpoints** | Mobile app — coordinator approval card (DES-1 3-Tap Flow) |
| **Thoughts** | *"David's met Mrs. Kim before. That's the one thing I needed to know. Okay."* — If the familiarity flag is present and accurate, the decision takes < 10 seconds. |
| **Emotions** | 😌 **Conditional relief** (3/5). Angela relaxes — but only if she trusts the familiarity data. First-use anxiety is present: *"Is this right? Should I call to check?"* |
| **Pain Points** | First-use trust gap: Angela's instinct is to call David to confirm he remembers Mrs. Kim. The product must be good enough that this instinct is overridden by confidence in the data. |
| **AI Intervention Opportunity** | **L2 — Verify:** This IS the HITL gate. The system has done all the computation; Angela makes the final decision. The gate must not be bypassable and must not be a friction point. It must feel like a natural confirmation, not a bureaucratic step. |
| **Data Required** | All shortlist data + coordinator_id for audit log + preview of outgoing notifications (for coordinator to review before confirming) |
| **Trust Signal Needed** | Three signals simultaneously: (1) Familiarity flag with a number ("2 prior visits" — not just "familiar"); (2) Qualifications confirmed badge (not "probably qualified"); (3) Notification preview ("This will be sent to David, to Mrs. Kim, to the family — in that order"). |


### Step 6 — Automated Carer Assignment (T+6 min with product — L3 Action)

| Element | Detail |
|---|---|
| **Steps / Actions** | System sends WhatsApp to David Kim (ACT-C-01): "Hi David, CareBridge needs you to cover a visit for a client in Surry Hills at 8:00 AM today. Reply YES to confirm or NO if unavailable." |
| **Touchpoints** | WhatsApp (carer's personal phone) — Green data only (CC-8 compliant: no client name, no full address, no SPP data) |
| **Thoughts** | Angela: *"I've done my job. Now I need to wait for David to reply."* — This is the first moment of externally-resolved uncertainty in the process. |
| **Emotions** | 😐 **Waiting anxiety** (2/5). Relief from the approval action, but new uncertainty: will David respond? In time? |
| **Pain Points** | XP-4A — carer response time is unvalidated. If David doesn't reply within 15 minutes, Angela re-enters the cascade. Fallback protocol (ACT-C-01 failure path) must surface quickly. |
| **AI Intervention Opportunity** | **L3 — Escalate** (already approved by coordinator in Step 5). System executes without further confirmation. If delivery fails → L1 alert to Angela: "WhatsApp delivery failed — call David directly." |
| **Data Required** | Carer phone number (S-1), confirmation ACT-A-02 state = `coordinator_approved: true`, client suburb (P-11 suburb only — not full address) |
| **Trust Signal Needed** | Delivery receipt: Angela sees "Message sent to David — awaiting reply" in the app. She is not left wondering whether the system did what she approved. |


### Step 7 — Carer Briefing (T+7 min with product — L3 Action)

| Element | Detail |
|---|---|
| **Steps / Actions** | System sends carer briefing to David (ACT-C-02): entry protocol ("Knock and wait — client takes a moment to answer"), personal sensitivities ("Please don't move any items in the lounge"). Client first name only. No condition disclosure. |
| **Touchpoints** | WhatsApp or SMS to carer — structured SPP fields only (CC-6 guard: no match explanation, no gender preference disclosed) |
| **Thoughts** | Angela: *"David will know what he's walking into. I don't have to call him and explain."* — This is the value she currently delivers by calling. The product replicates it automatically. |
| **Emotions** | 😊 **Growing confidence** (3.5/5). For Angela, the briefing is the most human part of her job — it's what makes a replacement feel like care, not just coverage. Automating it well is emotionally significant. |
| **Pain Points** | Briefing accuracy depends on SPP completeness. If SPP is not populated for a client, the briefing is empty — which feels worse than no briefing, because it signals that the system doesn't know the client. |
| **AI Intervention Opportunity** | **L3 — Escalate** (auto-triggered after ACT-C-01). **CC-6 guard mandatory:** assert `match_explanation_in_payload = false` AND `gender_preference_in_payload = false` before send. If SPP is empty for this client → send minimal briefing ("Client prefers a calm, steady approach") + alert Angela to complete SPP. |
| **Data Required** | P-5 (personal sensitivities — structured, max 100 chars), P-6 replacement (entry protocol dropdown label only, not reason), P-3 (familiarity threshold — affects how briefing is framed), carer first name |
| **Trust Signal Needed** | For the carer: the briefing must feel personal, not templated. "Please don't move items in the lounge" feels like Angela called. "Standard briefing applied" feels like a form. |


### Step 8 — Client Notification (T+8 min with product — L3 Action)

| Element | Detail |
|---|---|
| **Steps / Actions** | System sends SMS to Mrs. Kim (ACT-P-01): "Good morning, this is CareBridge. Your visit today will be with David Kim, who has visited you before. He'll arrive at 8:00 AM." |
| **Touchpoints** | SMS (client's mobile or landline) — client first name, carer first name, visit time. No SPP data. |
| **Thoughts** | Angela: *"Mrs. Kim knows now. She won't be surprised. She won't be scared."* — Angela currently forgets this step in the chaos of the phone cascade. The product does it without her thinking about it. |
| **Emotions** | 😊 **Relief** (4/5). For Angela, client notification is the thing she feels most guilty about missing. The product removes that guilt automatically. |
| **Pain Points** | If Mrs. Kim's notification channel isn't enrolled (no SMS number on file), client_notified = false → E-3 gate blocks family notification → coordinator alerted. This is a data quality problem (intake completeness) not a product failure, but Angela will experience it as product friction. |
| **AI Intervention Opportunity** | **L3 — Escalate** (E-3 gate 1: fires after coordinator_approved = true). If client channel unavailable → L1 alert to Angela: "Mrs. Kim has no notification channel — please call her directly before family is notified." |
| **Data Required** | Client notification channel (SMS / app — enrolled at intake), carer first name (S-1), visit time, familiarity phrasing flag ("who has visited you before" — from P-7 visit count > 0) |
| **Trust Signal Needed** | For Mrs. Kim: the message must not read like a generic system alert. "Your visit today will be with David Kim, who has visited you before" is warm. "A replacement carer has been assigned to your visit" is not. |


### Step 9 — Family Notification (T+9 min with product — L3 Action + E-3 Gate)

| Element | Detail |
|---|---|
| **Steps / Actions** | System sends SMS to Margaret Chen (Mrs. Kim's daughter): "Hi Margaret, CareBridge is letting you know that your mother's visit today will be covered by David Kim, who has visited her before. Arranged by Angela. — CareBridge." |
| **Touchpoints** | SMS (family contact's phone) — E-3 gate enforced in code: fires only after `client_notified = true` |
| **Thoughts** | Angela: *"Margaret won't get a panic call. She'll get a message from us before her mum calls her. That's the way it should work."* — The Arthur Kovacs failure case does not happen. |
| **Emotions** | 😌 **Resolution** (4.5/5). Family notification is the final emotional release. The incident is resolved, communicated, and documented. Angela didn't have to think about it — the system handled it in the right order. |
| **Pain Points** | E-3 gate failure: if client_notified = false, family notification is suppressed and Angela is alerted. This is correct system behaviour, but Angela may initially experience the delay as the product "not working." Onboarding must set the expectation: "We notify family after the client, always — that's the promise." |
| **AI Intervention Opportunity** | **L3 — Escalate** (E-3 gate 2: fires only after client_notified = true). If E-3 gate fires → suppress family notification → L1 alert to Angela: "Family notification held — client not yet notified. Notify client manually to release." |
| **Data Required** | Family contact channel (F-2 SMS/email/app preference), client notification status (client_notified boolean), carer first name, "who has visited before" phrasing (P-7 visit count > 0), coordinator name |
| **Trust Signal Needed** | For the family: the message must convey that the coordinator is in control and the situation is handled. "Arranged by Angela" is more reassuring than "automated by CareBridge system." Coordinator name in the message increases family trust. |


### Step 10 — Resolution Confirmation (T+10 min with product)

| Element | Detail |
|---|---|
| **Steps / Actions** | Angela's phone shows a confirmation screen: "✓ David Kim assigned — WhatsApp sent. ✓ Mrs. Kim notified — SMS delivered. ✓ Margaret Chen notified — SMS delivered." She taps "Close." She has 50 minutes before the 8 AM visit. |
| **Touchpoints** | Mobile app — resolution summary screen |
| **Thoughts** | *"Done. All three notifications sent. Carer briefed. Everyone knows. Now I can deal with Arthur and Lin."* — The cognitive closure she currently never gets because the process bleeds into the next incident. |
| **Emotions** | 😊 **Genuine relief + competence** (4.5/5). The product has done what Angela does, at the same quality level, in 10 minutes instead of 45. And it did it in the right order. |
| **Pain Points** | None at this step — this is the emotional high point. The design risk is that the confirmation screen is too sparse (just technical status) and doesn't reflect the care quality of what just happened. It should feel like Angela helped Mrs. Kim, not like a system processed a ticket. |
| **AI Intervention Opportunity** | **L1 — Inform:** Resolution summary includes the audit log confirmation: "This incident has been logged with timestamp, decision rationale, and all notification delivery receipts." Angela knows everything is documented without having to do anything. |
| **Data Required** | All ACT-C-01/ACT-P-01/ACT-F-01 delivery receipts, audit log entry confirmation (append-only write confirmed) |
| **Trust Signal Needed** | Completeness: all three notifications confirmed delivered. Any delivery failure is shown here as an action item ("David has not replied — call him directly by 7:30 AM"), not silently dropped. |



```
EMOTIONAL STATE (1=Crisis, 5=Confident)

5 │                                                    ●─────────● (10)
  │                                              ● (9)
4 │                                        ● (8)
  │                                  ●(7)
3 │  ● (1)                     ●(5)─●(6)
  │       ●(2)            ●(4w)
2 │            ● (3)
  │
1 │                 ●──●──●──●  ← Phone cascade (without product)
  │                (4 current state — 11 calls, 30–45 min, peak panic)
  └──────────────────────────────────────────────────────────────────►
     6:30   6:35  6:40  6:45–7:15  7:15   7:20  7:25  7:30  7:35  7:40 AM

Step:  1     2     3      4         5      6     7     8     9    10

WITH PRODUCT: ●──●──●──●(3 taps)──●──●──●──●──●──●
              Dip never below 2.5; Approval at step 5 is the recovery inflection point.

WITHOUT PRODUCT: Steps 1-4 are the pit. Steps 5-10 often don't happen at all (cancelled visit,
                  family calls in fury, Angela discovers the failure at 9 AM).
```


### Moment of Truth

> **Step 5 — Coordinator Approval: The 1-Tap Decision**

The single interaction that determines whether Angela stays or leaves is **the moment she sees the shortlist and decides whether to tap Approve or reach for the phone.**

She has two options:
- **She taps Approve** → the product has earned her trust. The familiarity flag ("2 prior visits with Mrs. Kim") was accurate. The decision felt safe. She will use the product again.
- **She reaches for the phone** → the product has failed. Not because she didn't approve — she's allowed to call — but because the shortlist did not give her enough confidence to act on it. She will tolerate the product as a search tool, not trust it as a decision tool.

**What creates the trust signal at this moment:**
1. **"2 prior visits with Mrs. Kim"** — not a score, not a percentage, a human fact. Angela can picture the visits. She knows David.
2. **Qualifications confirmed ✓** — not "probably qualified." The hard gate ran. She doesn't have to verify credential currency herself.
3. **"This message will be sent to..."** — the notification preview. Angela sees what will happen if she taps. No surprises.

**What destroys trust at this moment:**
- A match score without explanation ("94% match" — what does that mean?)
- A candidate she doesn't recognise and the familiarity field says "0 prior visits"
- A candidate card that looks like an algorithm output, not a human recommendation

**Emotional signature of the Moment of Truth:** A micro-pause. Angela reads the card. She glances at the familiarity flag. She makes the decision in 3–8 seconds. If the pause is longer — she's already reaching for the phone.


### Emotional Arc Narrative

Angela's day without this product starts with a gut-punch at 6:30 AM and escalates steadily through frustration, peak cognitive overload, defeat (one visit cancelled), and ends with a secondary crisis when a family member calls after the failed visit. She begins the day with full professional competence and ends the morning feeling like she let someone down. This happens 3–5 times per week.

With Home-Care-AI, the arc is structurally different. The gut-punch at Step 1 is the same — absence events will always be stressful. But the system catches her at Step 2 (SPP triage replaces mental scramble), holds her at Step 3 (candidate ranking replaces the 11-call search), and releases her at Step 5 (1-tap approval). Steps 6–9 — the notifications she currently forgets — happen automatically in the right order. Step 10 gives her the closure she currently never gets.

The emotional breakthrough is not speed. Speed is a consequence. The breakthrough is that Angela no longer carries the entire coordination problem alone. The system knows what she knows about her clients, and it acts on that knowledge in a way she can verify and trust.



| Rank | Pain Point | Phase Step | Emotional Impact | Frequency | AI Potential |
|---|---|---|---|---|---|
| **1** | **No system knows what Angela knows** — Client preferences (Mrs. Kim female-only, Arthur briefing, Lin recognition-only) exist only in Angela's head. Every replacement decision requires her full cognitive presence. If she's on another call, the knowledge isn't available. | Steps 2–3 | 😰 Maximum anxiety — cognitive overload under time pressure | Every incident (3–5/week) | **High** — SPP captures and surfaces this knowledge at Step 2 automatically |
| **2** | **11 sequential calls, 30–45 minutes** — The phone cascade is the single largest time cost. It is also the most emotionally depleting — each unanswered call increases the probability of a cancelled visit. | Step 4 | 😩 Exhaustion + mounting dread | Every incident | **High** — 1-tap approval from a pre-computed shortlist eliminates the cascade entirely |
| **3** | **Client and family notification forgotten** — In the chaos of the phone cascade, Angela runs out of time to notify the client before the visit. Family discovers the change when nobody shows up. Arthur Kovacs in his chair. | Steps 8–9 | 😔 Guilt (for Angela) + 😡 Fury (for family) | Every incident where a cancellation or late replacement occurs | **High** — automated, E-3-compliant notification pipeline runs as a consequence of coordinator approval, not as a separate action |
| **4** | **No audit trail for replacement decisions** — After 11 calls and a resolved incident, nothing is logged. Who was called, who declined, who was selected, why — all unrecorded. Angela is personally liable for decisions she cannot reconstruct if challenged. | Steps 3–5 | 😟 Latent liability anxiety — surfaces at audit time | Every incident | **High** — every state transition written to immutable audit log automatically |
| **5** | **First-use trust gap** — When Angela first sees the shortlist, she will want to verify by calling. Not because the system is wrong, but because she has never trusted a machine with this decision before. This is a one-time adoption friction that the product must be designed to cross. | Step 5 (first use) | 😬 Uncertainty → potential product abandonment | First 5–10 incidents | **Medium** — the familiarity flag, qualifications badge, and notification preview are the three trust signals. Design must surface all three prominently. |



| Priority | Trigger | Action | Level | Data Required | Trust Signal | Risk if Wrong |
|---|---|---|---|---|---|---|
| **1 — Shortlist generation** | Absence event recorded | Compute ranked shortlist: qualification gate → proximity → SPP match | **L1 Inform** | S-1 (quals), S-2 (availability), S-3 (proximity), P-7 (familiarity history), P-3 (familiarity threshold) | Ranked card with human-readable rationale ("2 prior visits") — not a raw score | Low risk — this is a recommendation, not an action. Angela decides. |
| **2 — SPP triage display** | Absence event recorded | Surface SPP for each affected client alongside affected visits | **L1 Inform** | P-2 (gender pref — advisory), P-3 (familiarity threshold), P-5 (sensitivities), P-6 replacement (entry protocol label) | Accuracy — if one SPP field is wrong, Angela loses confidence in all of them | Medium risk — wrong SPP sends the wrong carer to the wrong client. SPP accuracy is the product's core quality commitment. |
| **3 — Coordinator approval gate** | Shortlist generated | Present approval card + request coordinator confirmation | **L2 Verify** | Shortlist data + notification preview (what will be sent after approval) | 3-tap simplicity + notification preview + HITL gate framing ("You approve — we execute") | The gate itself is low-risk. Risk is in the decision Angela makes — which is why the familiarity flag and quals badge are non-negotiable UI requirements. |
| **4 — Carer WhatsApp assignment** | Coordinator approves (ACT-A-02) | Send WhatsApp to confirmed replacement carer | **L3 Escalate** | S-1 (carer name), client suburb (P-11 suburb only — CC-8), visit time, confirmation receipt | Delivery receipt visible to Angela within 30 seconds | High — wrong carer receives unexpected assignment. Mitigated by HITL gate at Step 5. False positive cost: real care disruption. |
| **5 — Client SMS notification** | ACT-C-01 complete | Send SMS to client (E-3 gate 1) | **L3 Escalate** | Client notification channel, carer first name, visit time, familiarity phrasing (P-7) | Warm, personal language ("who has visited you before") | High — wrong information → client confusion/anxiety. Especially sensitive for P-3/P-4 clients. |
| **6 — Family SMS notification** | client_notified = true (E-3 gate 2) | Send SMS to family contact | **L3 Escalate** | Family contact channel (F-2), client_notified boolean, carer first name, coordinator name | E-3 compliance is the trust signal for Angela. Family receives message before they call. | **Critical if E-3 gate fails** — family before client = Arthur Kovacs failure case. Gate is non-bypassable by design. |
| **7 — Carer briefing** | ACT-C-01 complete | Send structured SPP briefing to confirmed carer | **L3 Escalate** | P-5 (sensitivities), P-6 replacement (entry protocol label), P-3 (familiarity framing). **CC-6 guard:** no match explanation, no P-2 (gender preference) in payload. | Warm, operational language ("Please introduce yourself clearly at the door") — not clinical language | Medium — wrong briefing → carer arrives unprepared. Missing briefing → same outcome. SPP completeness is the dependency. |



**DR-1 — Lead with the familiarity flag, not the match score**

The candidate card must surface "David Kim — 2 prior visits with Mrs. Kim" as the primary trust element — not a numerical score. Angela's approval decision is triggered by a human fact (David knows Mrs. Kim), not an algorithm output (94% match). The score can appear as secondary information — below the familiarity flag, smaller text. This single design decision is the difference between a 1-tap approval and a verification phone call.

*Validates: Moment of Truth (Step 5), Pain Point 1, OKR-3 (≥ 70% approval without calls)*


**DR-2 — Show the notification preview before the Approve tap**

When Angela taps a candidate card to select, the confirmation screen must show her exactly what will be sent: "If you approve: David will receive [message]. Mrs. Kim will receive [message]. Margaret Chen will receive [message] — after Mrs. Kim is notified." Angela must see the downstream consequences of her approval before she commits. This reduces first-use anxiety and operationalises the E-3 constraint as a visible promise, not a background rule.

*Validates: Trust Signal at Step 5, E-3 gate transparency, Pain Point 3*


**DR-3 — Resolution screen is the emotional payoff — design it accordingly**

The Step 10 confirmation screen ("✓ David assigned. ✓ Mrs. Kim notified. ✓ Margaret notified.") is the single highest-emotional-value screen in the product. It delivers the closure Angela never gets from 11 phone calls. It should feel like resolution, not like a status panel. Design direction: use language that centres the client ("Mrs. Kim has been notified and knows David is coming"), not the system ("ACT-P-01 delivered"). The three green ticks must be satisfying to see.

*Validates: Emotional Arc Step 10, Pain Point 3 (notifications), OMTM (Angela's morning experience)*


**DR-4 — SPP empty state must feel like a prompt, not a failure**

When a client has no SPP populated, the briefing will be minimal. The empty state must not feel like the product doesn't know the client — it must feel like an invitation to add what Angela knows. Design: "Mrs. Chen's preferences haven't been added yet — add them now (2 min) and they'll be ready for the next replacement." This turns an empty state into an onboarding moment. An empty briefing that just says "No specific preferences recorded" feels worse than no system at all.

*Validates: Pain Point 5 (trust gap), W2 SPP cold start (Artifact 13), XP-3A (self-serve template adoption)*


**DR-5 — The 3-tap flow must be completable in under 60 seconds at 6:30 AM, one-handed, on a 5-inch phone screen**

Angela is not sitting at a desk. She is standing in her kitchen, phone in one hand, coffee in the other, sleep still in her eyes. Every design decision — tap target size, text size, number of required reads before a tap, notification preview length — must be evaluated against this constraint. The approval flow should require 0 form entries. No text fields. No dropdowns. Candidate card tap (1) → review notification preview (2) → Confirm tap (3). If it requires a fourth tap for any reason, the UX must be justified.

*Validates: U-1 assumption (3-tap completable at 6:30 AM), Pain Point 2 (phone cascade replacement)*



*What happens behind Angela's screen during the Exception Handling phase.*

| Frontstage (Angela sees) | Backstage (System does) | Support Processes | Failure Points |
|---|---|---|---|
| Absence alert push notification | ACT-V-01: vacancy event created; affected visits queried | Visit schedule DB read; carer_id linked to scheduled visits | Absence event not detected (carer doesn't WhatsApp; coordinator must enter manually) |
| SPP triage panel | SPP read for each affected client_id | DynamoDB SPP query (< 200ms at current scale — F-4 confirmed) | SPP empty — panel shows skeleton state; must prompt population |
| Ranked shortlist | ACT-V-02–04: qualification gate + Google Maps + SPP match | Google Maps API call; credential expiry check; familiarity history query | All candidates fail qualification gate → EC-02 (empty shortlist — show "Broaden criteria" screen) |
| 3-tap approval card | ACT-A-02: coordinator approval recorded + audit log written | APPAuditLogEntry: ANOMALY_DETECTED → HITL_PENDING | HITL timeout (coordinator doesn't respond in 30 min) → HITL_TIMEOUT + backup coordinator escalation |
| "Message sent to David" receipt | ACT-C-01: WhatsApp Business API call via Twilio | Twilio API; CC-8 payload guard asserts Green data only | WhatsApp delivery failure → L1 alert to Angela: "Call David directly" |
| "Mrs. Kim notified" receipt | ACT-P-01: SMS via Twilio; E-3 gate checks client_notified state | E-3 gate assert: coordinator_approved = true | Client not enrolled in SMS → client_notified = false → family gate blocked |
| "Margaret notified" receipt | ACT-F-01: SMS to family; E-3 gate checks client_notified = true | Family contact channel lookup; E-3 gate assert | E-3 gate fails → family notification suppressed → L1 alert to Angela |
| Resolution screen | ACT-AUD-01: INCIDENT_RESOLVED audit log entry | Immutable append to CloudTrail / write-once S3 | Audit write failure → CRITICAL system alert (no merge gate passes without 100% log completeness) |



*Per CLAUDE.md Article IV Rule 3: "No value prop is final without one user-journey-map deep dive confirming emotional resonance."*

**Confirmed:** The journey map validates the CC value proposition (Artifact 14 §1) at every step.

| Value Prop Claim | Journey Evidence | Confirmed? |
|---|---|---|
| "1 approval tap" | Step 5 — 3-tap flow; 1 decision tap (after 2 review taps) | ✅ Confirmed — the approval card design enables it |
| "Zero phone calls" | Steps 3–4 — shortlist eliminates the cascade; all downstream actions automated | ✅ Confirmed — IF the familiarity flag creates trust at Step 5 |
| "< 5 min to fill" | Steps 1–10 sequence — 10 minutes with product vs. 30–60 min without | ✅ Confirmed — but includes carer reply time (XP-4A still pending) |
| "No father in a chair" | Step 9 — E-3 compliant family notification delivered automatically | ✅ Confirmed — structurally enforced, not reliant on Angela remembering |
| "Every preference documented" | Step 2 — SPP triage panel surfaces the knowledge Angela currently holds mentally | ✅ Confirmed — pending SPP completeness (XP-3A/3B) |
| "Trust > speed" (SWOT SR) | Moment of Truth (Step 5) — the familiarity flag is the decision trigger, not the match score | ✅ Confirmed — the emotional arc shows relief comes from recognising the person, not the time saved |

**Revised claim (journey-informed):** The value prop statement in Artifact 14 leads with time ("fills every vacant visit in under 5 minutes"). The journey map shows the emotional driver is *trust*, not *speed*. Speed is the consequence. Recommend revising the marketing statement to lead with trust:

> **Current:** *"fills every vacant visit in under 5 minutes — unlike AlayaCare's vacancy agent, it matches on who the client trusts"*
>
> **Journey-informed revision:** *"matches every replacement on who the client trusts — not just who's available — and handles every notification automatically, in the right order"*

Speed stays in the supporting evidence; trust becomes the headline.



*Per CLAUDE.md Article IV HS-STRAT-01 and HS-STRAT-02.*

| ID | From Journey Map | To Next Skill | What Transfers |
|---|---|---|---|
| **HS-STRAT-01** | §6 Level 3 AI Interventions (Priority 4–6: ACT-C-01, ACT-P-01, ACT-F-01) + Moment of Truth (Step 5 — coordinator approval) | `create-prd` §7.2 Priority 1 features | Moment of Truth = P1 feature: 3-tap approval card. All L3 Interventions = P1 features. A Level 3 intervention absent from the PRD breaks the safety chain (CLAUDE.md HS-STRAT-01). |
| **HS-STRAT-02** | §6 Data Required columns + E-3 gate (Steps 8–9) + CC-6 guard (Step 7) + CC-8 guard (Step 6) | `compliance-privacy-audit` Data Inventory Map → `agentic-logic-spec` NFRs | Every "Data Required" row in §3 feeds the compliance audit's Data Inventory Map directly (CLAUDE.md Article IV ⚠ Inference Risk Instruction). E-3, CC-6, CC-8 become explicit NFRs in the logic spec. |
| **HS-STRAT-JM-01** | §9 Value prop revision: trust > speed as headline | `value-proposition` (Artifact 14 — update to marketing statement) | Journey confirms emotional driver is trust, not speed. Marketing statement should lead with trust. |
| **HS-STRAT-JM-02** | DR-1 (familiarity flag as primary trust signal) + DR-2 (notification preview before approval) | `user-stories` (Execution Skill 4) | These are acceptance criteria for the coordinator approval card story: "Given a candidate with prior visits, When the coordinator reviews the card, Then the familiarity count is the most prominent element." |
| **HS-STRAT-JM-03** | §8 Service Blueprint failure points | `agentic-logic-spec` edge cases | All 8 failure points in the blueprint map to Edge Cases EC-01 through EC-10 in Artifact 10 — confirming the completeness of the safety design |



| Date | Owner | Action |
|---|---|---|
| **2026-03-27** | PM Lead | Update Artifact 14 §1.3 Marketing statement — revise to lead with trust ("matches on who the client trusts") rather than speed (per §9 journey-informed revision) |
| **2026-03-27** | PM Lead | Run `compliance-privacy-audit` (Strategy Skill 5) — feed §3 "Data Required" columns as Data Inventory Map inputs (HS-STRAT-02) |
| **2026-03-28** | Designer | Begin 3-tap approval card wireframes per DR-1 (familiarity flag prominence) + DR-2 (notification preview) + DR-5 (6:30 AM one-handed constraint) |
| **2026-03-28** | Designer | Design SPP empty state (DR-4) — "Add Mrs. Chen's preferences now (2 min)" prompt, not a dead-end empty panel |
| **2026-03-28** | Designer | Design Step 10 resolution screen (DR-3) — client-centred language, three green ticks, satisfying emotional closure |
| **2026-03-28** | PM Lead | Confirm Moment of Truth (Step 5 — coordinator approval card) is designated P1 in PRD §7.2 — cannot be deprioritised |


*Journey map note: This is the CC × Exception Handling deep dive. Per the skill: offer next steps — (a) map another Persona × Phase (e.g., Agency Owner × Onboarding, or FC × Daily Use), or (b) generate a high-level phase summary for the CC persona across all 6 phases. The compliance-privacy-audit (Skill 5) runs next using this map's Data Required column as its primary input.*
