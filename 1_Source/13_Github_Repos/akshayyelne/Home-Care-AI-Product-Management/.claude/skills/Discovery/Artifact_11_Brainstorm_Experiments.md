# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Discovery/Artifact_11_Brainstorm_Experiments.md
# Generated: 2026-07-31T00:49:45.114Z

**Project:** Home-Care-AI
**Stage:** Discovery → Stage 5 (Validation Design)
**Skill:** brainstorm-experiments-new
**Date:** 2026-03-27
**Methodology:** Alberto Savoia, *The Right It* — XYZ Hypothesis; Pretotype; Skin-in-the-Game (SITG); YODA (Your Own Data)
**Beachhead Segment:** Care Coordinator (CC)
**Input:** Artifact 5 (E1–E5 scoped), Artifact 6 (Top 5 ideas), Artifact 8 (Priority experiment queue), Artifact 10 (Agentic Safety edge cases EC-02/EC-03/EC-04/EC-10)
**Regulatory Context:** Australian Privacy Act 1988 (APP). HIPAA-grade security applied as design floor.
**Feeds into:** Next interview cycle (Skill 1) — not a build cycle


> **YODA Principle (mandatory):** Every experiment in this artifact collects first-party behavioral data from real coordinators and agency staff. No industry report, market analogy, or survey response substitutes for direct observation. "The market for your idea does not care about the market for someone else's idea."
>
> **Skin-in-the-Game Principle (mandatory):** Interest is not a signal. Commitment is. Every hypothesis is tested against a real cost to the participant — time, money, or reputation. A coordinator who says "I would use this" is noise. A coordinator who approves a candidate from a shortlist she didn't assemble is signal.



*Artifact 5 (E1–E5) defined the opportunity-level experiments (does the problem exist and can we manually solve it?). This artifact defines the solution-level experiments (will people use and pay for this specific solution?). The two artifact sets run concurrently but serve different hypotheses.*

| Artifact | Level | Question |
|---|---|---|
| Artifact 5 E1–E5 | Opportunity validation | Does the problem exist? Can it be manually solved? |
| **Artifact 11 XP-1–XP-7** | **Solution validation** | Will people use this specific product? Will they pay for it? Will the agentic logic hold under real conditions? |

**Relationship to Artifact 8 experiment queue:**
The Tier 1–3 queue in Artifact 8 addresses assumption-level risk (legal, regulatory, technical). This artifact designs the behavioural pretotypes that run alongside those structural clearances. Tier 1 legal/regulatory work is a prerequisite gate; this artifact's experiments are the parallel signal-collection layer.



> **"At least 40% of care coordinators who receive a smart-matched replacement shortlist during a real vacancy event will approve the top-ranked candidate within 5 minutes, without making a verification phone call — on their first use of the system, without training."**

**Why 40%?**
- YODA calibration: Angela (CC-001) currently makes 11 calls per incident. For her to approve a machine-ranked candidate without calling anyone is a fundamental behaviour change. 40% is a conservative threshold that still validates the core mechanism.
- If 40% approve without calling on the first use, the learning curve hypothesis is confirmed. The target is 70%+ at steady-state (Artifact 5 E3 threshold).
- Below 40%: the shortlist is not trusted on first encounter → product requires either a trust-building onboarding phase or a fundamentally different UI design.

**Skin-in-the-Game signal:** The coordinator approves a candidate who will actually show up to care for a real client. Stakes are real. This is not a prototype tap — it is a care decision.



### XP-1 — Smart Match Trust at First Use (PM-1 + DES-1)

**XYZ Hypothesis:**
> "At least 40% of care coordinators will approve the top-ranked replacement candidate from a structured shortlist, without making a verification call, during a real vacancy event — on their first unsupported use."

**Why this matters:** If coordinators trust the ranking enough to act on it without calling, the matching engine creates real time savings. If they always call to verify, the product is a search tool, not a decision tool. These are different products with different economics.

**Behavioural baseline (YODA):** Angela: 11 calls, 30–60 min. Tom: ~20% cancellations. Both verbally expressed desire for a decision they could trust (Artifacts 2b, 2c).


#### XP-1A — Concierge Pretotype (Execution Vehicle: E1)

*See Artifact 5 §4 E1 for full protocol. This entry adds the XYZ calibration and SITG instrumentation.*

| | |
|---|---|
| **Method** | Manual matching service — team assembles shortlist via spreadsheet + WhatsApp. Coordinator approves from the shortlist. No product exists yet. |
| **YODA data collected** | Time-to-approve per incident (stopwatch from shortlist delivery to coordinator confirmation). Number of outbound calls made by coordinator AFTER receiving shortlist. |
| **Skin-in-the-Game** | Coordinator is approving a replacement for a real client's care visit. If they approve the wrong person, a real client has an unexpected or unsuitable carer. The stakes are not simulated. |
| **XYZ success threshold** | ≥ 40% of incidents: coordinator approves top-ranked candidate AND makes 0 verification calls after receiving shortlist. Time-to-approve < 10 min. |
| **XYZ failure signal** | Coordinator consistently calls before approving OR overrides top candidate on > 60% of incidents → shortlist is not trusted → redesign ranking explanation (or reduce to 1 recommendation rather than 3) |
| **Duration** | 2 weeks (Angela) + 2 weeks (Tom), overlapping |


#### XP-1B — Shadow Deviation Log

| | |
|---|---|
| **Method** | During E1, a team member logs every coordinator action taken AFTER the shortlist is delivered. Goal: capture the gap between stated preference ("I'd trust this list") and actual behaviour ("she called David anyway to check"). |
| **YODA data collected** | Deviation log: incident_id × shortlist_delivered_at × coordinator_action × action_type (call / text / manual search / direct approve). Deviation count and deviation reason (verbatim). |
| **Skin-in-the-Game** | None required — observational instrument. The act of being observed is sufficient because the coordinator is making real care decisions. |
| **XYZ success threshold** | ≥ 70% of shortlist deliveries result in zero coordinator-initiated contact before approval. Deviation rate < 30%. |
| **Failure signal** | Deviation rate > 50% → trust mechanism absent from shortlist design → requires redesign before fake-door test (XP-1C) |
| **Duration** | Concurrent with E1 |


#### XP-1C — Fake Door: Approval Card Figma Test (Execution Vehicle: E3)

*See Artifact 5 §4 E3 for full protocol. Extends with SITG instrumentation.*

| | |
|---|---|
| **Method** | Figma prototype of Smart Match approval card. 5 vacancy scenarios presented to Angela + Tom individually (2 coordinators) + 2 additional coordinators recruited via referral (YODA expansion — first-party data from people not in prior interviews). |
| **YODA data** | Top-candidate acceptance rate, hesitation signals, trust-trigger field (which card field is looked at first), override reason (verbatim). |
| **Skin-in-the-Game** | End of session: "If you were using this for real today, would you have approved that candidate for Mrs. Kim?" Coordinator must commit to a yes/no that they justify. |
| **New signal (vs. E3)** | For 2 new coordinators (not Angela/Tom): does the trust pattern replicate without familiarity bias? First-party generalisation test. |
| **XYZ success threshold** | Top-candidate acceptance rate > 70% across 4 coordinators. New coordinator acceptance rate ≥ 60% (accounts for less context). |
| **Duration** | 1 day per participant; schedule after E1 week 1 (so E1 deviation data informs which card fields to emphasise) |


### XP-2 — Willingness to Pay (VI-1 + V-5)

**XYZ Hypothesis:**
> "At least 1 in 4 (25%) of agency owners presented with a 5-minute concierge demonstration will agree to a non-binding letter of intent for a $150–250/month paid trial before the product is built."

**Why this matters:** VI-1 is a CRITICAL assumption (Artifact 8 Q1): agencies may require EMR integration before paying. A letter of intent from an agency owner who has NOT seen a working product, but HAS seen the concierge service performing in real conditions, is the only reliable WTP signal before build.

**Why letters of intent, not surveys:** "Would you pay $150/month for this?" is a survey question. A letter of intent requires the owner to put their name on paper — that is the Skin-in-the-Game signal Alberto Savoia requires.

**YODA calibration:** No existing data. This is a pure first-party experiment. We have 2 coordinators (Angela, Tom) as door-openers to their agency owners.


#### XP-2A — Agency Owner Letter of Intent (LOI) Campaign

| | |
|---|---|
| **Method** | At E1 week 2 (concierge results in hand), present a 1-page summary to each agency owner: "In 2 weeks, your coordinator filled X vacancies. Average time-to-fill dropped from Y to Z. We are building this as a product. We are offering early access trials at $150–250/month per coordinator. Would you sign a non-binding letter of intent?" |
| **YODA data** | LOI signed (yes/no), price point discussed, stated objections verbatim, time-to-decision (days from presentation to LOI answer) |
| **Skin-in-the-Game** | Signing an LOI is a reputational commitment. The owner's name is on paper. They are signalling to their organisation that they are considering this product. Not money, but reputation — Alberto Savoia's second-order commitment signal. |
| **XYZ success threshold** | ≥ 1 of 2 agency owners signs LOI at any price point. Price point is secondary — *any* commitment is signal. |
| **XYZ failure signal** | 0 of 2 sign → explore objection: (a) requires EMR integration (VI-1 negative), (b) price too high, (c) coordinator champion failed to advocate up. Each failure reason implies a different strategic response. |
| **Follow-up signal** | After LOI: "What would need to be true for you to pay on a monthly direct debit rather than a trial?" → reveals the build threshold |
| **Duration** | 1 meeting per owner, end of week 2 of E1 |


#### XP-2B — Waitlist Landing Page (WTP Proxy)

| | |
|---|---|
| **Method** | Single-page waitlist built in Carrd.co (< 2 hours to build). Headline: "Smart replacement matching for home care coordinators — fill every vacant visit in under 5 minutes." One CTA: "Apply for early access — $199/month per agency." No product, no screenshots. Distributed via 2 channels: (a) Angela + Tom share with their professional network (LinkedIn, industry groups); (b) 1 cold outreach to 5 agency managers via LinkedIn. |
| **YODA data** | Sign-ups (absolute count), scroll depth (Hotjar free tier), CTA click rate, LinkedIn message response rate. Tag each sign-up source. |
| **Skin-in-the-Game** | Sign-up requires: name, agency name, email, number of active clients. Filling in agency detail is a soft commitment — people who are just curious don't name their workplace. |
| **XYZ success threshold** | ≥ 5 sign-ups from non-Angela/Tom network within 2 weeks of launch. If ≥ 3 sign-ups include agency name = high-intent signal. |
| **XYZ failure signal** | 0 sign-ups from outside immediate network → product framing does not communicate value from description alone → requires video or case study to explain the problem |
| **APP compliance note** | Waitlist collects: name, email, agency name, client count. All Green zone (C-1 equivalent). Standard privacy notice. No SPP or client data collected. |
| **Duration** | Launch end of week 1 E1; leave live for 4 weeks |


### XP-3 — SPP Population Commitment (PM-2)

**XYZ Hypothesis:**
> "At least 80% of care coordinators will independently complete SPP entries for ≥ 80% of their active clients within 90 minutes, using a structured template, without an interviewer facilitating."

**Why this matters:** The SPP is the product's core moat and the prerequisite for match quality. If SPP population requires a facilitated session every time, onboarding is expensive and unscalable. If coordinators can self-serve from a template, onboarding is a product design problem, not a service delivery problem.

**YODA baseline:** E2 (Artifact 5) tests facilitated population. XP-3A tests self-serve — the difference in completion rate *between* the two conditions is the real signal.


#### XP-3A — Self-Serve Template Test (Unfacilitated)

| | |
|---|---|
| **Method** | Share the v1 SPP template (Artifact 9 §9 cleared fields: gender preference, briefing flag, familiarity threshold, entry protocol, personal sensitivities, continuity history) as a Google Sheet with Angela. No interviewer. Instructions: "Please fill this in for your 10 most active clients. We'll review it with you in 48 hours." |
| **YODA data** | Completeness rate per field (% populated), time to completion (Google Sheets activity log), field blank rate (which fields are hardest to self-serve), spontaneous notes in "other" column (proxy for what the template misses) |
| **Skin-in-the-Game** | Angela commits 48 hours of real coordination time to this task. She is investing time in a product that doesn't exist yet. If she completes it, the signal is strong. If she doesn't start, the template is too complex or the value isn't clear. |
| **Comparison signal** | E2 (facilitated, same 10 clients): completeness rate X%. XP-3A (unfacilitated): completeness rate Y%. If |X - Y| < 15 percentage points → self-serve is viable → scalable onboarding. If Y < 60% → self-serve requires UX scaffolding (onboarding wizard, guided prompts). |
| **XYZ success threshold** | ≥ 80% of 10 clients have ≥ 3 fields populated after 48 hours unfacilitated. |
| **XYZ failure signal** | < 60% completion → SPP requires a concierge onboarding session → adjust COGS model |
| **Duration** | 48-hour window, run after E2 (so Angela has seen the facilitated version first and understands the intent) |


#### XP-3B — SPP Rebuild Duration Probe (Moat Depth Test)

| | |
|---|---|
| **Method** | At the end of E2 (facilitated session), ask Angela: "If Home-Care-AI disappeared tomorrow — no export, no backup — how long would it take you to rebuild what we just captured?" Probe: "Would you rebuild it at all, or would you go back to sticky notes?" |
| **YODA data** | Verbatim answer + estimated rebuild time. Artifact 8 Assumption S-3: rebuild time > 4 weeks = deep moat; < 2 weeks = shallow moat. |
| **Skin-in-the-Game** | No material commitment — this is a YODA probe. The signal is in the answer, not the action. Exception: if Angela says "I'd never rebuild this manually again" AND signs the LOI in XP-2A, that's a compound signal. |
| **XYZ success threshold** | ≥ 1 coordinator estimates rebuild time > 4 weeks OR says "I wouldn't go back." |
| **XYZ failure signal** | "I could recreate this in a spreadsheet in a week" → SPP moat is shallow → revisit strategy (is the moat in the matching algorithm, not the data capture?) |
| **Duration** | Single question, end of E2 session |


### XP-4 — Carer Acceptance Behaviour (F-1 + ENG-2)

**XYZ Hypothesis:**
> "At least 70% of contacted replacement carers will accept a WhatsApp assignment notification within 15 minutes during a real vacancy event, without requiring a follow-up call from the coordinator."

**Why this matters:** The entire matching flow depends on carers self-reporting availability AND accepting assignments via message. F-1 (staff availability reliability) is a Q1 assumption — currently unknown. If carers don't update availability or don't respond to WhatsApp, the system's output cannot be relied upon.

**YODA baseline:** Zero. This is entirely untested. Angela and Tom currently call carers directly — this is the first systematic test of asynchronous carer acceptance.


#### XP-4A — WhatsApp Acceptance Dry Run (Real Incidents)

| | |
|---|---|
| **Method** | During E1 concierge, when a replacement candidate is identified, team sends that carer a WhatsApp message (manually, from team's number): "Hi [first name], [Agency] needs you to cover a visit for [client suburb] at [time] today. Reply YES to confirm or NO if unavailable." Log response time and decision. |
| **YODA data** | Response rate (replied / no reply), acceptance rate (YES / NO), time-to-response (minutes), spontaneous follow-up contact by carer (calls coordinator directly) |
| **Skin-in-the-Game** | Carer is being asked to commit to a real visit. Their YES means they will actually show up. This is the highest-stakes SITG signal in the product — a real carer, a real client, a real visit. |
| **XYZ success threshold** | ≥ 70% reply within 15 minutes. Acceptance rate ≥ 50% (some will legitimately be unavailable). |
| **XYZ failure signal** | Reply rate < 50% → carers do not accept job offers via WhatsApp → channel assumption broken → investigate: is the issue format (message is too unfamiliar), trust (unknown number), or habit (they expect a phone call)? |
| **CC-8 constraint (mandatory):** | WhatsApp message contains Green data only: carer first name, client suburb (not address), visit time. Full client address is NOT in the message. Compliant with Artifact 9 §4 CC-8 guard. |
| **Duration** | Concurrent with E1 (2 weeks); minimum 10 incidents to yield meaningful signal |


#### XP-4B — Availability Self-Report Adoption Test

| | |
|---|---|
| **Method** | For the 2-week E1 period, ask each participating agency's carers (via coordinator) to self-report availability each morning via a Google Form link (emulating the future mobile app). Track: what % of carers who are available actually submit availability before 8:00 AM? What % are discovered as unavailable only when the coordinator calls? |
| **YODA data** | Self-report rate (% of carers submitting availability proactively), discovery-by-coordinator rate (coordinator discovers unavailability via outbound call), daily submission rate pattern (do they submit at consistent times?) |
| **Skin-in-the-Game** | Carers are investing 30 seconds per day on a form that has no immediate benefit to them. Adoption of even this friction level is a signal of engagement. |
| **XYZ success threshold** | ≥ 70% of available carers submit availability before 8:00 AM on ≥ 70% of working days. |
| **XYZ failure signal** | < 40% submission rate → availability self-report behaviour does not exist in this carer cohort → matching engine must derive availability from past visit patterns + scheduler integration, not self-report |
| **Duration** | 2 weeks, concurrent with E1 |


### XP-5 — Agentic Safety Behaviour (Artifact 10 Edge Cases)

*These experiments are required by Artifact 10 (Agentic Safety Discovery). They test whether the HITL gates, fallback protocols, and safety constraints function as designed under real coordinator behaviour — before any code is written.*

**XYZ Hypothesis:**
> "At least 80% of care coordinators will correctly use the provided override acknowledgement flow when the system presents a safety warning, rather than bypassing or ignoring it."

**Why this matters:** The matching system's safety constraints only work if coordinators engage with them. A safety warning that gets tapped through without reading is not a safety mechanism — it is compliance theatre. These experiments test coordinator engagement with the safety layer under realistic conditions.


#### XP-5A — Empty Shortlist Recovery Test (Artifact 10 EC-02)

*Tests: What happens when no SPP-eligible candidate exists? Does the coordinator handle the "no match found" state appropriately?*

| | |
|---|---|
| **Method** | In E3 (Figma fake door), insert 2 scenarios where the shortlist returns zero candidates (all carers unavailable or unqualified). Present the screen: "No eligible replacements found for Mrs. Chen's visit. Options: (a) Broaden criteria — show me all available carers regardless of preference match; (b) Contact coordinator team for manual assistance; (c) Mark visit as cancelled." Observe: which option is selected and how quickly. Ask aloud: "Walk me through what you're thinking right now." |
| **YODA data** | Option selected (A/B/C), time-to-decision, verbatim reasoning, emotional response (frustrated / calm / confused) |
| **Skin-in-the-Game** | Coordinator makes a hypothetical decision that reveals their real preference hierarchy. In real conditions, this decision affects a client. |
| **XYZ success threshold** | ≥ 80% select Option A (broaden criteria) before Option C (cancel). Coordinator engages with the "no match" state rather than immediately cancelling. |
| **Safety signal** | If coordinator selects Option C (cancel) immediately without exploring Option A → UI must add friction before cancellation is permitted — "Have you tried broadening criteria?" confirmation step. |
| **Agentic logic implication** | EC-02 resolution: system cannot auto-cancel a visit. Coordinator must make an explicit "broadened criteria" override decision before the fallback path (manual resolution) is offered. |
| **Duration** | 2 scenarios within E3 session |


#### XP-5B — Familiarity Threshold Override (Artifact 10 EC-03)

*Tests: P-3 "known carers only" + no familiar carer available. Does the coordinator understand and accept the override acknowledgement?*

| | |
|---|---|
| **Method** | In E3 Figma prototype, present a scenario: "Arthur Kovacs (familiarity threshold: known carers only) has 0 familiar carers available. Best available is David Kim — 0 prior visits. The system shows: 'Warning: assigning an unfamiliar carer to a familiarity-threshold client. Arthur prefers known carers only. Confirm override?'" Observe: does the coordinator read the warning? Do they override? What is their reasoning? |
| **YODA data** | Override decision (confirm / decline), time spent on warning screen, verbatim reasoning, emotional response |
| **Skin-in-the-Game** | Coordinator is making a hypothetical decision with real stakes. If Arthur Kovacs refuses entry to an unfamiliar carer, a real client has a missed visit. The coordinator's reasoning is the signal. |
| **XYZ success threshold** | 100% of coordinators read the warning and make an explicit decision (do not tap through). ≥ 60% override with a stated reason. |
| **Safety signal** | If any coordinator taps through the warning without reading → warning design is insufficient → UI must require typed confirmation ("Type 'OVERRIDE' to confirm") or verbal acknowledgement. |
| **Agentic logic implication** | EC-03 must produce a `FAMILIARITY_THRESHOLD_OVERRIDE` log entry with coordinator_id. The log entry is the safety record, not the UI warning. |
| **Duration** | 1 scenario within E3 session |


#### XP-5C — P-2 Advisory Mode Acceptance Test (Artifact 10 EC-04)

*Tests: If E-1 legal opinion requires gender preference to be advisory-only (not scored), do coordinators accept this constraint — or does it break the perceived utility of the product?*

*This experiment is conditional — only runs if E-1 (Artifact 8 Tier 1 legal opinion) returns a negative opinion on P-2 as a scoring parameter.*

| | |
|---|---|
| **Method** | Create a Figma variant where P-2 (gender preference) shows as: "Client preference: Female carers (advisory — not used in match scoring. Confirm this preference is reflected in your selection.)" Present this variant to Angela alongside the standard variant (P-2 used in scoring). Ask: "Which feels more useful? Which feels more trustworthy?" |
| **YODA data** | Preference between variants, verbatim reasoning, willingness to adopt advisory-mode version, perception of advisory label ("is this less useful, or just more honest?") |
| **Skin-in-the-Game** | No material commitment — this is a preference signal. SITG element: Angela must choose one variant to use in a hypothetical live scenario. She cannot say "both are fine" — she must commit. |
| **XYZ success threshold** | ≥ 1 of 2 coordinators finds the advisory variant acceptable for daily use (not a product-killer). |
| **XYZ failure signal** | 0 coordinators accept the advisory variant → P-2 advisory mode breaks core utility → if legal opinion is negative, product must redesign the matching flow without any P-2 input (not just advisory) |
| **Conditional trigger** | Run only if E-1 legal opinion = P-2 scoring is discriminatory. If legal opinion = lawful personal care exception, this experiment is cancelled. |
| **Duration** | 15 minutes, add-on to E3 session if triggered |


#### XP-5D — HITL Double-Timeout No-Action Validation (Artifact 10 EC-10)

*Tests: Does the coordinator accept that the system will NOT auto-assign a carer if no human approves in time? Or do they expect the system to act autonomously in an emergency?*

| | |
|---|---|
| **Method** | In E3, present a scenario: "It is 7:45 AM. The visit is at 8:00 AM. You have not responded to two approval requests. The system has not assigned anyone. Your phone shows: 'Vacancy unresolved — manual action required.'" Ask: "What would you do? Is this the right system behaviour?" |
| **YODA data** | Emotional response (frustrated / relieved / confused), stated expectation ("I assumed it would just send someone"), preferred alternative behaviour, verbatim response |
| **Skin-in-the-Game** | No material commitment — this is an expectation alignment test. The signal is surprise vs. acceptance. |
| **XYZ success threshold** | ≥ 80% understand and accept that the system will not auto-assign without approval. ≥ 60% agree this is the correct behaviour for a vulnerable client. |
| **Safety signal** | If > 50% expect auto-assignment → coordinator expectation is misaligned with system design → onboarding must explicitly set this expectation on day 1. This is not a design change; it is a communication change. |
| **Agentic logic implication** | EC-10 is non-negotiable (CLAUDE.md Article XII: never auto-assign without approval). This experiment validates that the *communication* of this constraint is designed correctly. |
| **Duration** | 5-minute add-on to E3 session |



*Alberto Savoia's SITG framework: real commitment is ranked. Every experiment in this artifact maps to one of these levels.*

| Level | Commitment Type | Experiments |
|---|---|---|
| 🔴 **Level 5 — Real Consequence** | A real client's care outcome depends on the coordinator's decision. Highest signal fidelity. | XP-1A (E1 concierge), XP-4A (WhatsApp dry run) |
| 🟠 **Level 4 — Time Investment** | Coordinator invests 30–90 minutes of real work time in the experiment | XP-3A (self-serve template), XP-1B (shadow log over 2 weeks) |
| 🟡 **Level 3 — Reputational Commitment** | Participant puts their name on a document | XP-2A (letter of intent), XP-3A (Angela's signed consent per Artifact 8 T-4) |
| 🟢 **Level 2 — Decision Under Stakes** | Participant must make a committed choice, not a preference expression | XP-1C (E3 Figma — coordinator justifies their approval), XP-5A, XP-5B, XP-5C |
| ⚪ **Level 1 — Soft Signal** | Response to a direct question, no material commitment | XP-3B (moat probe), XP-4B (form submission), XP-5D (expectation alignment) |

**Minimum signal standard:** A product hypothesis is only considered validated if it is confirmed at Level 3 or above. Level 1 responses ("yes, I'd use it") are logged but do not count toward threshold.



*Every data point in this artifact must trace to first-party collection. This register confirms no ODP (Others' Data) is being used to validate these hypotheses.*

| Experiment | Data Type | First-Party Source | ODP Risk | Mitigation |
|---|---|---|---|---|
| XP-1A (E1) | Time-to-fill, call count | Directly observed during concierge | None — team is present | Shadow log (XP-1B) provides independent record |
| XP-1B | Deviation log | Team observes coordinator post-shortlist | None | Independent observer, not self-report |
| XP-1C (E3) | Acceptance rate, trust trigger | Figma session recording + think-aloud | None | In-person session; no survey |
| XP-2A | LOI signed (yes/no), price point | Direct agency owner conversation | None | Meeting notes, not survey |
| XP-2B | Waitlist sign-ups | Landing page analytics (first-party) | Low — sign-up intent is a proxy | Supplement with XP-2A for real signal |
| XP-3A | SPP completeness rate | Google Sheets activity log | None — access to Angela's sheet | Compare to E2 facilitated rate for delta |
| XP-3B | Rebuild time estimate | Verbatim in E2 session | Low — stated preference, not action | Flag as Level 1 signal; pair with XP-3A |
| XP-4A | WhatsApp response rate | Team sends and tracks messages directly | None — team controls the channel | Use unique phone number per experiment to track source |
| XP-4B | Self-report rate | Google Form with timestamp log | None | Compare to coordinator-discovered unavailability rate |
| XP-5A–5D | Safety behaviour decisions | Figma session, in-person | None | Record session with permission; verbatim transcript |



```
WEEK -1 (Before E1 starts)
────────────────────────────
Tier 1 clearances (Artifact 8):
  ├── E-1 legal opinion (anti-discrimination)
  ├── VI-4 + E-5 privacy counsel (APP 8)
  ├── T-3 retainer quotes
  └── T-4 coordinator consent signed

WEEK 1–2 (E1 + E2 concurrent)
────────────────────────────
  ├── XP-1A: E1 concierge pretotype running (Angela + Tom)
  ├── XP-1B: Shadow deviation log running (concurrent with E1)
  ├── XP-3A: Self-serve SPP template (Angela — 48h window after E2)
  ├── XP-3B: Moat probe (end of E2 session)
  ├── XP-4A: WhatsApp acceptance dry run (during E1 incidents)
  ├── XP-4B: Availability self-report adoption (concurrent with E1)
  └── XP-2B: Waitlist landing page live (launch end of week 1)

WEEK 2–3 (Post-E1 / E3 + Agency owner meetings)
────────────────────────────
  ├── XP-1C: E3 Figma prototype (2 known + 2 new coordinators)
  ├── XP-5A: Empty shortlist scenario (within E3)
  ├── XP-5B: Familiarity override scenario (within E3)
  ├── XP-5C: P-2 advisory variant (conditional on E-1 legal opinion)
  ├── XP-5D: HITL timeout expectation (within E3)
  └── XP-2A: Agency owner LOI meetings (Angela + Tom arrange access)

WEEK 3–4 (Synthesis + Next Cycle)
────────────────────────────
  ├── GTM-6 (Artifact 8 Tier 3): Blind transition — concierge → algorithm handoff
  └── Interview cycle 2: Design new interview script using XP data
      Feed: XP-1A/1B results → next script probes trust mechanism
      Feed: XP-2A results → next script probes WTP and EMR integration blockers
      Feed: XP-4A/4B results → next script probes carer channel preference
```



*Per CLAUDE.md Article III Hard Rules: "After `brainstorm-experiments-new`, the next action is a new interview cycle — not a build cycle. Build only after experiment data is collected."*

| Experiment Result | Feeds Into | New Interview Question |
|---|---|---|
| XP-1A: Deviation rate > 30% | Interview cycle 2 — coordinator trust | "When you received the shortlist and still called David, what specifically weren't you sure about?" |
| XP-2A: 0 LOIs signed | Interview cycle 2 — agency owner barrier | "What would have to be different about what you saw before you'd consider a paid trial?" |
| XP-3A: Completion rate < 60% | Interview cycle 2 — onboarding friction | "When you stopped filling in the template, what was going through your mind?" |
| XP-4A: Reply rate < 50% | Interview cycle 2 — carer channel | "When you get a job offer by WhatsApp from someone you don't know, what do you do first?" |
| XP-4B: Self-report < 40% | Interview cycle 2 — carer habit | "How do you let [Agency] know you're available in the morning?" |
| XP-5B: Coordinator taps through override | Interview cycle 2 — safety behaviour | "When you see a warning message like that, what's your instinct — read it or get through it?" |
| XP-2B: 0 sign-ups outside network | New segment interview | Interview 1 coordinator NOT referred by Angela/Tom — different market context |

**Interview cycle 2 target participants:**
- 2 new agency owners (not Angela/Tom's organisations) — recruited via XP-2B waitlist sign-ups or LinkedIn
- 1 carer (not coordinator) — to understand the carer's experience of the assignment notification
- Angela and Tom: follow-up sessions using XP experiment data as stimulus



| ID | Hypothesis Tested | Method | Key Metric | SITG Level | Duration |
|---|---|---|---|---|---|
| **XP-1A** | Coordinator trusts shortlist at first use | E1 concierge pretotype | Top-candidate approval without verification call ≥ 40% | L5 — real care outcome | 2 weeks |
| **XP-1B** | Stated trust ≠ actual trust | Shadow deviation log | Post-shortlist call rate < 30% | L4 — 2-week time investment | 2 weeks |
| **XP-1C** | Trust generalises beyond Angela/Tom | E3 Figma + 2 new coordinators | Acceptance rate > 70% (4 coordinators) | L2 — committed choice | 1 day each |
| **XP-2A** | Agency owners will pre-commit to trial | LOI meetings | ≥ 1 of 2 signs LOI | L3 — reputational | 1 meeting each |
| **XP-2B** | Product framing communicates value | Waitlist landing page | ≥ 5 sign-ups outside immediate network | L2 — soft SITG | 4 weeks live |
| **XP-3A** | SPP self-serve is viable | Unfacilitated Google Sheet | ≥ 80% completion in 48h | L4 — time investment | 48 hours |
| **XP-3B** | SPP moat is deep | Rebuild duration probe | Rebuild estimate > 4 weeks | L1 — stated preference | 5 min (E2 add-on) |
| **XP-4A** | Carers accept assignments via WhatsApp | WhatsApp dry run (live) | Reply ≥ 70% within 15 min; Accept ≥ 50% | L5 — real visit commitment | 2 weeks |
| **XP-4B** | Carers self-report availability | Google Form adoption | ≥ 70% self-report rate before 8 AM | L1 — 30-second form | 2 weeks |
| **XP-5A** | Coordinator handles no-match state | Figma scenario (EC-02) | ≥ 80% select Option A before cancel | L2 — committed choice | 5 min (E3 add-on) |
| **XP-5B** | Override acknowledgement is read | Figma scenario (EC-03) | 100% make explicit decision; 0 tap-through | L2 — committed choice | 5 min (E3 add-on) |
| **XP-5C** | P-2 advisory mode is acceptable | Figma variant comparison | ≥ 1 of 2 coordinators accepts advisory mode | L2 — committed choice | 15 min (conditional) |
| **XP-5D** | Coordinator accepts no-auto-assign | E3 scenario (EC-10) | ≥ 80% accept no-auto-assign as correct behaviour | L1 — expectation alignment | 5 min (E3 add-on) |



*After experiment data is collected, these are the binary decisions that determine whether the product enters Strategy (Plugin 2). Per CLAUDE.md Article III, discovery loops back — not forward — if these gates are not cleared.*

| Gate | Clears If | Fails If | Consequence of Failure |
|---|---|---|---|
| **G-XP-01 Core Trust** | XP-1A: ≥ 40% top-candidate approval without call AND XP-1B: deviation rate < 50% | XP-1A < 40% OR deviation > 70% | Redesign shortlist UX before re-testing. Do not proceed to Strategy. |
| **G-XP-02 WTP** | XP-2A: ≥ 1 LOI signed at any price AND XP-2B: ≥ 3 high-intent sign-ups | 0 LOIs AND < 3 sign-ups | Interview 2 agency owners → diagnose VI-1 (EMR integration requirement). Revise value proposition before Strategy. |
| **G-XP-03 SPP Viability** | XP-3A: ≥ 80% completion unfacilitated OR deviation between E2 and XP-3A < 15pp | XP-3A < 60% AND E2–XP-3A delta > 25pp | Onboarding requires a concierge session → revise COGS model. Proceed to Strategy with revised unit economics. |
| **G-XP-04 Carer Channel** | XP-4A: reply rate ≥ 50% AND XP-4B: self-report rate ≥ 50% | XP-4A < 30% | WhatsApp/async channel does not work for this carer cohort → investigate phone-first carer notification alternative. |
| **G-XP-05 Safety Behaviour** | XP-5B: 100% explicit decisions (0 tap-through) AND XP-5D: ≥ 80% accept no-auto-assign | XP-5B: any tap-through | Redesign safety warning UI (higher friction). EC-10 is non-negotiable — this is a communication/UX fix, not an architecture change. |
| **G-XP-06 Legal Clear** | E-1 legal opinion: P-2 is lawful (personal care exception) OR advisory mode is acceptable (XP-5C ≥ 1 of 2) | E-1 negative AND XP-5C = 0 of 2 accept | Remove P-2 from product entirely in v1. Matching engine uses S-4 (familiarity) and S-2 (proximity) only. This does not kill the product but reduces match specificity. |



| ID | From Artifact | To Next Skill | What Transfers |
|---|---|---|---|
| **HS-DISC-EXP-01** | Artifact 11 — XP-1A/1B results | Interview-script (cycle 2) (Skill 1) | Deviation rate + verbatim reasons → new interview probes targeting trust mechanism |
| **HS-DISC-EXP-02** | Artifact 11 — XP-2A/2B results | Interview-script (cycle 2) + startup-canvas (Strategy) | WTP signal → canvas revenue streams; LOI objections → positioning constraints |
| **HS-DISC-EXP-03** | Artifact 11 — XP-3A results | startup-canvas (Strategy) + ai-unit-economics (Strategy) | SPP self-serve rate → onboarding COGS; facilitated vs. self-serve delta → pricing tier design |
| **HS-DISC-EXP-04** | Artifact 11 — XP-4A/4B results | agentic-logic-spec (Execution) | Carer reply SLA → THRESHOLD_CARER_RESPONSE_WINDOW constant; fallback if reply rate < 50% |
| **HS-DISC-EXP-05** | Artifact 11 — XP-5A/5B/5D results | agentic-logic-spec (Execution) | Safety UI acceptance data → override acknowledgement design + HITL_DOUBLE_TIMEOUT UX |
| **HS-DISC-EXP-06** | Artifact 11 — Go/No-Go gates G-XP-01 through G-XP-06 | startup-canvas (Strategy Plugin) | All 6 gates cleared = green light to Strategy. Any gate failed = new interview cycle first. |
| **HS-DISC-05** | Artifact 11 (experiment results) | next interview-script (HS-EXEC-01 per master map) | Experiment data feeds the next interview cycle — not the build cycle |



| Date | Owner | Action |
|---|---|---|
| **2026-03-27** | PM Lead | Build XP-2B waitlist landing page (Carrd.co — 2 hours; share with Angela and Tom for network distribution) |
| **2026-03-28** | PM Lead | Design XP-1B shadow deviation log template (Google Sheet: incident_id, shortlist_delivered_at, coordinator_action, action_type, verbatim_reason) |
| **2026-03-28** | PM Lead | Design XP-4A WhatsApp message template — confirm CC-8 compliance (Green data only: carer name, suburb, time) |
| **2026-03-28** | Designer | Add XP-5A (empty shortlist), XP-5B (familiarity override), XP-5D (HITL timeout) scenarios to E3 Figma prototype |
| **2026-03-28** | PM Lead | Prepare XP-3A Google Sheet (Artifact 9 §9 v1 cleared fields only) — send to Angela after E2 session completes |
| **2026-03-29** | PM Lead | Present XP-2A LOI framing to agency owners at end of E1 week 2 — bring E1 results data as evidence |
| **2026-04-10** | PM Lead | Synthesise all experiment results → evaluate Go/No-Go gates G-XP-01 through G-XP-06 |
| **2026-04-10** | PM Lead | If G-XP-01 through G-XP-06 all clear → proceed to Strategy Plugin (startup-canvas, Skill 12) |
| **2026-04-10** | PM Lead | If any gate fails → design interview cycle 2 script using failure data from Section 7 |


*Discovery loop note: This is the final artifact of Discovery Stage 5. After experiments are completed and gates are evaluated, the pipeline branches: all gates pass → Strategy Plugin; any gate fails → new interview cycle (Artifact 1 format, new script driven by failure data). Per CLAUDE.md Article III: "Build only after experiment data is collected." The Execution Plugin does not open until the Strategy Plugin closes. The Strategy Plugin does not open until these Go/No-Go gates clear.*
