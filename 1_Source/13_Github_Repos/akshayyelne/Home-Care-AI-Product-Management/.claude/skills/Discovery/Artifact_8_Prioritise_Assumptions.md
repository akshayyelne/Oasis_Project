# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Discovery/Artifact_8_Prioritise_Assumptions.md
# Generated: 2026-07-31T00:49:45.135Z

**Project:** Home-Care-AI
**Stage:** Discovery → Stage 4 (Risk & Ethics Gating)
**Skill:** prioritize-assumptions
**Date:** 2026-03-26
**Methodology:** ICE scoring (Impact × Confidence × Ease) → Impact × Risk matrix → Experiment queue
**Input:** Artifact 7 — 45 assumptions across 8 categories
**Beachhead Segment:** Care Coordinator (CC)
**Feeds into:** Artifact 9 — Ethics Trust Mapping (Skill 9); Artifact 11 — Brainstorm Experiments (Skill 11)
**Amended:** 2026-03-26 — Fix 1: removed duplicate V-2 row; Fix 2: corrected GTM-4 ICE math in Section 5 (Confidence 9→8, score 648→576); Fix 3: removed E-3 from Q2 table (Confidence=8 places it in Q4 only)



### ICE Formula

**ICE = Impact × Confidence × Ease**

All dimensions rated 1–10. Raw ICE score range: 1–1,000.

| Dimension | Definition | Scale |
|---|---|---|
| **Impact** | Consequence of this assumption being wrong — how much does it affect the product's ability to deliver value, reach product-market fit, or avoid legal/ethical harm? | 10 = product cannot ship / collapses; 1 = negligible |
| **Confidence** | Current confidence that this assumption is correct, based on evidence from Artifacts 2a–2d and 3 | Low = 2–3; Medium = 5–6; High = 8–9 |
| **Ease** | How quickly and cheaply can this assumption be tested? | 10 = 1 day, near-zero cost; 1 = requires 6+ months or prohibitive cost |

### Impact × Risk Matrix

**Risk** is the inverse of Confidence: High Risk = Low Confidence (unknown = risky).

| Quadrant | Impact | Risk | Action |
|---|---|---|---|
| **Q1 — Design Experiment** | High (8–10) | High (Low confidence, ≤ 4) | Build an experiment immediately — critical unknowns blocking progress |
| **Q2 — Experiment (lower urgency)** | High (8–10) | Medium (Confidence 5–6) | Design an experiment — important, plausible, but not at maximum urgency |
| **Q3 — Monitor or Research** | Medium (6–7) | Any | Research, observe during E1/E2/E3, or defer until Q1/Q2 resolved |
| **Q4 — Proceed** | Any | Low (High confidence, ≥ 7) | No experiment needed — treat as confirmed; implement the mitigation |



| ID | Category | Assumption (Short) | Impact | Confidence | Ease | **ICE** | Quadrant |
|---|---|---|---|---|---|---|---|
| E-1 | Ethics | SPP matching does not create discriminatory carer selection | **10** | 3 | 4 | **120** | **Q1** ⚠️ CRITICAL |
| E-3 | Ethics | Family notification never precedes patient notification | **10** | 8 | 5 | **400** | **Q4** ⚠️ CRITICAL — Structural gate |
| V-2 | Value | Coordinator trusts machine ranking without calling to verify | **9** | 5 | 7 | **315** | **Q2** |
| U-1 | Usability | 3-tap flow completable at 6:30 AM without training | **9** | 5 | 8 | **360** | **Q2** |
| VI-4 | Viability | APP 8 resolved by design + privacy notice (not per-client consent) | **9** | 5 | 5 | **225** | **Q2** ⚠️ CRITICAL |
| V-1 | Value | SPP match produces better clinical/relational outcomes vs. availability-only | **9** | 5 | 5 | **225** | **Q2** |
| F-1 | Feasibility | Staff update availability reliably in app (vs. calling coordinator) | **9** | 3 | 7 | **189** | **Q1** |
| VI-1 | Viability | Agencies pay for standalone tool without EMR integration at launch | **9** | 3 | 5 | **135** | **Q1** ⚠️ CRITICAL |
| S-1 | Strategy | AlayaCare does not add soft preference matching within 12–18 months | **9** | 5 | 7 | **315** | **Q2** |
| GTM-1 | Go-to-Market | CC is both champion and veto player for agency purchase | **8** | 8 | 8 | **512** | **Q4** |
| GTM-4 | Go-to-Market | 30-day trial includes enough incidents for genuine evaluation | **8** | 8 | 9 | **576** | **Q4** |
| T-4 | Team | Angela + Tom engagement sustainable for 4+ months | **8** | 5 | 8 | **320** | **Q2** |
| GTM-3 | Go-to-Market | E1 participants become willing reference customers | **8** | 5 | 7 | **280** | **Q2** |
| F-2 | Feasibility | Rule-based SPP score correlates with coordinator judgment r > 0.70 | **8** | 5 | 6 | **240** | **Q2** |
| E-5 | Ethics | SPP fields classified correctly under APP (personal/sensitive information) | **8** | 5 | 5 | **200** | **Q2** |
| S-2 | Strategy | CC beachhead unlocks HCN/FC without separate sales motion | **8** | 5 | 5 | **200** | **Q2** |
| VI-2 | Viability | Per-agency subscription covers COGS at target margin | **8** | 3 | 6 | **144** | **Q1** |
| VI-3 | Viability | Australian home care market large enough for 24-month growth | **8** | 3 | 6 | **144** | **Q1** |
| E-2 | Ethics | Matching algorithm does not amplify coordinator bias in SPP data | **8** | 3 | 6 | **144** | **Q1** |
| S-3 | Strategy | SPP data moat is deep enough to prevent switching after 6 months | **8** | 3 | 6 | **144** | **Q1** |
| V-5 | Value | Agency owners perceive coordinator departure as material business risk | **8** | 3 | 5 | **120** | **Q1** |
| GTM-6 | Go-to-Market | Concierge-to-product transition does not erode coordinator trust | **8** | 3 | 5 | **120** | **Q1** |
| T-2 | Team | Build Lambda + SPP + WhatsApp to prototype in 8 weeks | **8** | 3 | 7 | **168** | **Q1** |
| VI-5 | Viability | SPP moat drives monthly churn < 2% post-3 months | **8** | 3 | 2 | **48** | **Q1 — Defer** (not testable pre-launch) |
| E-4 | Ethics | Carer availability/location data ≠ GPS surveillance under APP | **7** | 5 | 5 | **175** | **Q3** |
| V-3 | Value | SPP has standalone value before matching engine is built | **7** | 5 | 7 | **245** | **Q3** |
| U-2 | Usability | 3 candidates is the right decision surface (not 1, not 5) | **7** | 5 | 8 | **280** | **Q3** |
| U-3 | Usability | Familiarity flag is the trust-producing field on the candidate card | **7** | 5 | 8 | **280** | **Q3** |
| F-5 | Feasibility | WhatsApp reply parsing reliable for single-character approval commands | **7** | 5 | 7 | **245** | **Q3** |
| T-1 | Team | Domain knowledge sufficient without dedicated clinical advisor | **7** | 5 | 7 | **245** | **Q3** |
| GTM-2 | Go-to-Market | Peer referral is primary acquisition channel for agency owners | **7** | 5 | 7 | **245** | **Q3** |
| S-5 | Strategy | Product positioned as clinical intelligence layer, not scheduling tool | **7** | 8 | 9 | **504** | **Q4** |
| T-3 | Team | Privacy counsel available on retainer basis (no full-time hire required) | **7** | 8 | 9 | **504** | **Q4** |
| V-4 | Value | Carer briefing notification reduces post-assignment phone calls | **7** | 3 | 7 | **147** | **Q3** |
| U-5 | Usability | Onboarding wizard produces accurate SPP without high correction rate | **7** | 3 | 6 | **126** | **Q3** |
| V-6 | Value | Family notification prevents client churn at agency level | **7** | 5 | 6 | **210** | **Q3** |
| U-4 | Usability | Tom and Angela served by same interface without product variants | **6** | 5 | 7 | **210** | **Q3** |
| VI-6 | Viability | NDIS compliance doesn't create adoption-blocking burden | **6** | 3 | 6 | **108** | **Q3** |
| F-3 | Feasibility | Google Maps API accurate for regional Australian matching | **6** | 8 | 9 | **432** | **Q4** |
| F-4 | Feasibility | DynamoDB SPP query < 200ms at 60-client scale | **6** | 8 | 9 | **432** | **Q4** |
| F-6 | Feasibility | Twilio SMS reliable for international family contacts | **5** | 7 | 8 | **280** | **Q4** |
| S-4 | Strategy | Regulatory environment stable for 24-month build horizon | **6** | 5 | 5 | **150** | **Q3** |
| E-6 | Ethics | SPP does not create "performing wellness" dynamic for clients | **6** | 5 | 3 | **90** | **Q3 — Defer** |
| GTM-5 | Go-to-Market | "Bus-proof" messaging resonates more than efficiency messaging | **6** | 3 | 5 | **90** | **Q3 — Defer** |
| T-5 | Team | Team applies 75% failure rate honestly to experiment results | **7** | 3 | 4 | **84** | **Q3 — Defer** |



### Q1 — High Impact + High Risk → DESIGN EXPERIMENT NOW

*These are the most dangerous unknowns. High consequence of being wrong; low current confidence.*

| Priority | ID | Assumption | ICE | Experiment |
|---|---|---|---|---|
| 1 | **E-1** ⚠️ | SPP matching ≠ discriminatory carer selection | 120 | Legal opinion — anti-discrimination law (Sex Discrimination Act, Disability Discrimination Act) + employment law review |
| 2 | **VI-1** ⚠️ | Agencies pay without EMR integration at launch | 135 | Interview 2 agency owners — past behaviour: "Tell me about the last tool you adopted without integration" |
| 3 | **F-1** | Staff update availability reliably in app | 189 | E1 observation — track how many absences are self-reported vs. coordinator-discovered |
| 4 | **T-2** | Build prototype in 8 weeks | 168 | Sprint 0 sizing — engineering 3-point estimate for ENG-1 + ENG-3 |
| 5 | **VI-2** | Per-agency subscription covers COGS | 144 | Unit economics model — AWS Lambda + DynamoDB + Twilio cost at 3 incidents/week/agency |
| 6 | **VI-3** | Australian home care market large enough | 144 | Secondary research — ACFA report, NDIS provider register, My Aged Care data |
| 7 | **E-2** | Matching doesn't amplify coordinator bias | 144 | E2 probe — for each SPP entry, ask: "Did Mrs. Kim tell you this, or is this your inference?" |
| 8 | **S-3** | SPP moat deep enough to prevent switching | 144 | E2 rebuild probe — "If we deleted the SPP tomorrow, how long to rebuild?" |
| 9 | **V-5** | Agency owners see coordinator departure as material risk | 120 | Interview 2 agency owners — Mom Test: "When did you last lose a coordinator? What happened?" |
| 10 | **GTM-6** | Concierge-to-product transition doesn't erode trust | 120 | Blind transition test at E1 week 3 — replace human team with algorithm, observe acceptance rate |
| — | **VI-5** | SPP moat drives churn < 2% | 48 | ⚠️ **DEFERRED** — not testable before 6 months of live data. Design 6-month cohort metric at launch |


### Q2 — High Impact + Medium Risk → DESIGN EXPERIMENT (lower urgency)

*Important assumptions with plausible evidence — test after Q1 experiments are running.*

| Priority | ID | Assumption | ICE | Experiment |
|---|---|---|---|---|
| 1 | **GTM-4** | 30-day trial has enough incidents | 576 | **Confirmed by CC interviews.** Track incident rate during E1. No separate experiment needed. |
| 2 | **GTM-1** | CC is champion and veto player | 512 | **Confirmed by CC interviews.** Observe in E1. No separate experiment needed. |
| 3 | **U-1** | 3-tap flow completable at 6:30 AM without training | 360 | E3 (Figma prototype) — unguided walkthrough, 5 scenarios, measure time-to-completion |
| 4 | **T-4** | Angela + Tom engagement sustainable 4+ months | 320 | Obtain written consent from coordinator + agency management before E1 begins |
| 5 | **V-2** | Coordinator trusts machine ranking to approve | 315 | E3 (Figma prototype) — observe acceptance rate of top-ranked candidate |
| 6 | **S-1** | AlayaCare doesn't add soft preference in 12–18 months | 315 | Competitive intelligence — monitor AlayaCare product updates every 6 weeks |
| 7 | **GTM-3** | E1 participants become reference customers | 280 | Ask at E1 end: "Would you speak with other coordinators about your experience?" |
| 8 | **F-2** | Rule-based SPP score correlates with coordinator judgment r > 0.70 | 240 | E1 — compare algorithm ranking to coordinator's manual choice for each incident |
| 9 | **VI-4** ⚠️ | APP 8 resolved by design + privacy notice | 225 | Privacy counsel review — 2-hour retainer: classify data flows, confirm notice-vs-consent path |
| 10 | **V-1** | SPP match produces better outcomes than availability-only | 225 | E1 — track distress events, refusals, complaints during SPP-matched vs. unmatched periods |
| 11 | **E-5** | SPP fields classified correctly under APP | 200 | Privacy counsel review — classify each SPP field as personal/sensitive/operational under APP 3 |
| 12 | **S-2** | CC beachhead unlocks HCN/FC without separate sales motion | 200 | Ask Angela + Tom at 3-month E1 review: "Would you want nurses to use this? How would you sell it?" |


### Q3 — Medium Impact → MONITOR DURING E1/E2/E3 OR DEFER

*Worthwhile to track; not worth a dedicated experiment at this stage.*

| ID | Assumption | ICE | Action |
|---|---|---|---|
| V-3 | SPP standalone value before matching engine | 245 | **Probe during E2** — WTP question at session end |
| U-2 | 3 candidates right decision surface | 280 | **E3 variant test** — run 3 vs. 5 candidates in 2 scenario sets |
| U-3 | Familiarity flag is trust-producing field | 280 | **E3 think-aloud** — "What do you look at first?" |
| F-5 | WhatsApp reply parsing reliable | 245 | **Technical spike** — 50 synthetic reply variants |
| T-1 | Domain knowledge sufficient without clinical advisor | 245 | **E2 probe** — ask Angela: "Are there SPP fields this template misses?" |
| GTM-2 | Peer referral primary acquisition channel | 245 | **Ask in E1** — "How did you find the last tool you adopted?" |
| E-4 | Carer location data ≠ GPS surveillance | 175 | **Legal/HR review** — brief opinion on Fair Work + Privacy Act |
| V-4 | Briefing notification reduces phone calls | 147 | **E1 observation** — does coordinator call carer after notification sent? |
| U-5 | Onboarding wizard NLP accuracy | 126 | **E2 comparison** — paper form vs. NLP extraction on same clients |
| V-6 | Family notification prevents churn | 210 | **E1 follow-up** — track retention of notified families over 4 weeks |
| U-4 | Same interface for Tom and Angela | 210 | **E1 observation** — note any workflow differences between coordinators |
| VI-6 | NDIS compliance doesn't block adoption | 108 | **1 interview** — ask 1 NDIS-registered agency manager about software compliance checks |
| S-4 | Regulatory environment stable 24 months | 150 | **Regulatory briefing** — 1-hour with aged care compliance consultant |
| E-6 | No "performing wellness" dynamic for clients | 90 | ⚠️ **DEFERRED** — longitudinal indicator only; check at 6-month review |
| GTM-5 | "Bus-proof" messaging resonates more than efficiency | 90 | ⚠️ **DEFERRED** — landing page A/B test when product is closer to launch |
| T-5 | Team applies 75% failure rate honestly | 84 | ⚠️ **DEFERRED** — observable only after experiment results come in |


### Q4 — High Confidence → PROCEED (no experiment needed)

*Confirmed by evidence or are structural requirements. Implement the mitigation directly.*

| ID | Assumption | ICE | Required Action |
|---|---|---|---|
| **GTM-4** | 30-day trial has enough incidents | 576 | Track incident rate during E1 — confirmed by CC interview frequency data |
| **GTM-1** | CC is champion and veto player | 512 | Design product and sales motion around coordinator as champion — confirmed by CC personas |
| **S-5** | Clinical intelligence framing, not scheduling tool | 504 | Internal alignment check every sprint — confirmed by Artifact 3 strategic implication |
| **T-3** | Privacy counsel on retainer basis | 504 | Obtain 3 quotes from Australian APP health data privacy firms this week |
| **F-3** | Google Maps API accurate for regional AU | 432 | Technical spike — 10 address pairs — confirmed expectation; spike is a formality |
| **F-4** | DynamoDB SPP query < 200ms at 60-client scale | 432 | Technical spike — confirm; trivial at this scale |
| **E-3** | Family notification never precedes patient | 400 | ⚠️ **Structural gate — not an experiment.** Must appear in agentic-logic-spec pseudocode as an explicit `coordinator_approved = true` prerequisite gate. Cannot be overridden by any user request. |
| **F-6** | Twilio SMS reliable for international contacts | 280 | Twilio documentation review + pricing model — confirm UK/NZ delivery and rates |



*Ranked by ICE score within each urgency tier. This is the sequence in which experiments should be designed and launched.*

### Tier 1 — Before Any Code Is Written (Immediate)

| # | ID | Assumption to Test | Method | Timeline | Success Threshold |
|---|---|---|---|---|---|
| 1 | **E-1** | SPP matching ≠ discriminatory carer assignment | Legal opinion — Anti-Discrimination Act + employment law | 1 week | Written legal opinion: matching on client preference is lawful personal care exception OR specifies mitigation required |
| 2 | **VI-4 + E-5** | APP 8 + SPP data classification | Privacy counsel retainer review (2 hrs) | 1 week | (a) Privacy notice update sufficient for APP 8; (b) each SPP field classified as personal/sensitive/operational |
| 3 | **T-3** | Privacy counsel available on retainer | Obtain 3 quotes from AU privacy law firms | 3 days | ≥ 1 firm confirms availability + cost < $5,000 AUD for initial review |
| 4 | **T-4** | Angela + Tom 4-month engagement | Written consent from coordinator + agency management | Before E1 start | Signed consent from both coordinators and their agency owners |
| 5 | **T-2** | 8-week build timeline achievable | Sprint 0 — engineering 3-point estimate (ENG-1 + ENG-3) | 3 days | Likely estimate ≤ 6 weeks for ENG-1 + ENG-3; if > 6 weeks, revise scope |

### Tier 2 — Week 1–2 (Launch E1 + E2 + E3 Concurrently)

| # | ID | Assumption to Test | Method | Timeline | Success Threshold |
|---|---|---|---|---|---|
| 6 | **F-1** | Staff update availability reliably | E1 — track absence self-report rate vs. coordinator-discovered | 2 weeks | ≥ 70% of absences reported by carer proactively; < 30% discovered by coordinator |
| 7 | **V-1 + V-2** | SPP match quality + coordinator trust | E1 — track distress events; E3 — top-candidate acceptance rate | 2 weeks / 1 day | E1: 0 Henderson-equivalent events in matched cohort; E3: ≥ 70% top-candidate acceptance |
| 8 | **V-5 + VI-1** | Agency owner bus risk + standalone WTP | Interview 2 agency owners (Mom Test) | 1 week | ≥ 1 owner confirms coordinator departure is a "significant risk" unprompted; ≥ 1 confirms willingness to trial without EMR integration |
| 9 | **E-2** | SPP bias source (direct vs. inferred) | E2 — for each SPP entry, ask: "Did [client] tell you this directly?" | During E2 | ≥ 80% of SPP entries are direct client statements, not coordinator inference |
| 10 | **F-2** | Rule-based score correlates with judgment | E1 — show algorithm ranking to coordinator post-match; measure divergence | 2 weeks | ≥ 70% algorithm top pick matches coordinator's manual choice |

### Tier 3 — Alongside E1/E2/E3 (Parallel Research)

| # | ID | Assumption to Test | Method | Timeline | Success Threshold |
|---|---|---|---|---|---|
| 11 | **VI-2 + VI-3** | Unit economics + market size | Cost model build + secondary research (ACFA, NDIS data) | 1 week | Gross margin > 60% at target subscription price; ≥ 500 agencies in AU at 20–200 client scale |
| 12 | **S-3** | SPP moat depth | E2 rebuild probe: "How long to rebuild this knowledge without the system?" | During E2 | Answer > 4 weeks = deep moat; < 2 weeks = shallow moat requiring revised strategy |
| 13 | **GTM-6** | Concierge-to-product trust transition | E1 week 3 blind transition — replace human team with algorithm | Week 3 | Coordinator acceptance rate does not drop by > 10 percentage points post-transition |
| 14 | **S-1** | AlayaCare competitive window | Monitor AlayaCare release notes, conference announcements | Ongoing (every 6 weeks) | No soft preference feature announcement within 12 months = window confirmed |
| 15 | **GTM-3** | E1 participants as reference customers | Ask at E1 close: "Would you speak with other coordinators about your experience?" | End of E1 | ≥ 1 coordinator confirms willingness to be a named reference |



*Per CLAUDE.md Article III: "show ICE math."*

| ID | Impact | × | Confidence | × | Ease | = | ICE | Quadrant |
|---|---|---|---|---|---|---|---|---|
| GTM-4 | 8 | × | 8 | × | 9 | = | **576** | Q4 — Proceed |
| GTM-1 | 8 | × | 8 | × | 8 | = | **512** | Q4 — Proceed |
| S-5 | 7 | × | 8 | × | 9 | = | **504** | Q4 — Proceed |
| T-3 | 7 | × | 8 | × | 9 | = | **504** | Q4 — Proceed |
| F-3 | 6 | × | 8 | × | 9 | = | **432** | Q4 — Proceed |
| F-4 | 6 | × | 8 | × | 9 | = | **432** | Q4 — Proceed |
| E-3 | 10 | × | 8 | × | 5 | = | **400** | Q4 — Structural gate |
| U-1 | 9 | × | 5 | × | 8 | = | **360** | Q2 — Experiment |
| T-4 | 8 | × | 5 | × | 8 | = | **320** | Q2 — Experiment |
| V-2 | 9 | × | 5 | × | 7 | = | **315** | Q2 — Experiment |
| S-1 | 9 | × | 5 | × | 7 | = | **315** | Q2 — Monitor |
| GTM-3 | 8 | × | 5 | × | 7 | = | **280** | Q2 — Experiment |
| F-2 | 8 | × | 5 | × | 6 | = | **240** | Q2 — Experiment |
| V-3 | 7 | × | 5 | × | 7 | = | **245** | Q3 — Probe |
| VI-4 | 9 | × | 5 | × | 5 | = | **225** | Q2 — Legal review |
| V-1 | 9 | × | 5 | × | 5 | = | **225** | Q2 — Experiment |
| F-1 | 9 | × | 3 | × | 7 | = | **189** | Q1 — Experiment |
| T-2 | 8 | × | 3 | × | 7 | = | **168** | Q1 — Sprint 0 |
| VI-2 | 8 | × | 3 | × | 6 | = | **144** | Q1 — Model |
| E-1 | 10 | × | 3 | × | 4 | = | **120** | Q1 — Legal opinion |

*Note: E-1 scores 120 (low ICE) despite being CRITICAL because Ease = 4 (legal opinion takes time and cost). Low ICE ≠ low urgency for Critical items — the matrix quadrant (Q1: High Impact + High Risk) governs priority, not ICE score alone.*



**The 4 Critical assumptions must resolve before any of these components enter build:**

| Critical Assumption | Blocks | Resolution Owner | Deadline |
|---|---|---|---|
| **E-1** — SPP ≠ discriminatory selection | Matching engine (ENG-1 + S1 + S2 + S3) | Legal counsel | Before Sprint 1 |
| **E-3** — Family notification ≠ patient-first violation | Notification pipeline (S6 + ENG-4) | Engineering — agentic-logic-spec | Before Sprint 1 |
| **VI-4** — APP 8 resolved by design | WhatsApp integration (ENG-2) | Privacy counsel + PM Lead | Before Sprint 1 |
| **VI-1** — Agencies pay without EMR integration | Go-to-market / sales motion | PM Lead — 2 agency owner interviews | Before launch planning |

**If E-1 returns a negative legal opinion** (i.e., automated SPP-based filtering is discriminatory), the matching engine must be redesigned: SPP becomes advisory (shown to coordinator but not used in ranking), and all filtering remains under coordinator judgment. This does not kill the product — it changes the automation level from auto-rank to auto-present.

**If VI-1 returns a negative** (agencies require EMR integration before paying), the go-to-market strategy must shift: either build an AlayaCare integration before launch (6–9 months delay) or target the subset of agencies not currently on any platform (greenfield agencies).



These have been scored and categorised. They will not receive experiments at this stage.

| ID | Assumption | ICE | Reason for Deferral |
|---|---|---|---|
| VI-5 | SPP moat drives churn < 2% | 48 | Not testable before 6 months of live product data — design cohort metric at launch |
| E-6 | No "performing wellness" dynamic | 90 | Longitudinal signal only — observable at 6-month review, not pre-launch |
| GTM-5 | "Bus-proof" messaging resonates more | 90 | Landing page A/B test appropriate when product is 4–6 weeks from launch |
| T-5 | Team applies 75% failure rate honestly | 84 | Observable only after first experiment results arrive — revisit post-E1 |



This prioritisation directly determines what Skill 9 (ethics-trust-mapping) and Skill 11 (brainstorm-experiments-new) receive:

**→ ethics-trust-mapping (Skill 9):**
- E-1: SPP data fields that enable carer filtering → Green/Yellow/Red classification
- E-2: SPP data bias risk → audit protocol for preference data capture
- E-3: Notification pipeline ordering → structural gate requirement
- E-4: Carer location data → data sensitivity classification
- E-5: All SPP fields → APP sensitivity classification
- VI-4: WhatsApp message content → data minimisation check

**→ agentic-safety-discovery (Skill 10):**
- F-1: Staff availability update → Level 1/2/3 classification for availability-stale event
- F-2: SPP match confidence scoring → confidence threshold constants
- E-3: Notification gate → Level 2/3 HITL requirement before family notification

**→ brainstorm-experiments-new (Skill 11):**
Top 15 experiments from Priority Experiment Queue (Sections 4 Tier 1–3) form the direct input. E1, E2, E3 designs from Artifact 5 are confirmed as the primary pretotypes.



| ID | From Artifact | To Next Skill | What Transfers |
|---|---|---|---|
| HS-DISC-PRI-01 | Artifact 8 — Q1 Critical assumptions (E-1, VI-1, VI-4) | `ethics-trust-mapping` (Skill 9) | Critical ethics and viability risks → data classification + consent design |
| HS-DISC-PRI-02 | Artifact 8 — E-3 structural gate | `agentic-logic-spec` (Execution Plugin) | `coordinator_approved = true` required before `family_notification_triggered = true` |
| HS-DISC-PRI-03 | Artifact 8 — Priority Experiment Queue Tier 1–3 | `brainstorm-experiments-new` (Skill 11) | Top 15 experiments → XYZ hypothesis + pretotype design |
| HS-DISC-PRI-04 | Artifact 8 — Q4 confirmed assumptions | `startup-canvas` (Strategy Plugin) | Confirmed strategic facts (GTM-1 CC champion, S-5 clinical intelligence framing) → canvas inputs |
| HS-DISC-PRI-05 | Artifact 8 — VI-2 unit economics gap | `ai-unit-economics` (Strategy Plugin) | Cost model required — feeds into subscription pricing + gross margin projection |



| Date | Owner | Action |
|---|---|---|
| **2026-03-27** | PM Lead | Engage privacy counsel — APP 8 + anti-discrimination law review (E-1, VI-4, E-4, E-5) — obtain 3 quotes (T-3) |
| **2026-03-27** | PM Lead | Run `ethics-trust-mapping` (Skill 9) — feed E-1, E-2, E-3, E-4, E-5 + VI-4 into Green/Yellow/Red classification |
| **2026-03-27** | PM Lead | Secondary market research — Australian home care agency count at 20–200 client scale (VI-3) |
| **2026-03-28** | PM Lead | Interview 2 agency owners using Mom Test (V-5 + VI-1) — recruit via Angela and Tom referral |
| **2026-03-28** | Engineer | Sprint 0 sizing — ENG-1 + ENG-3 3-point estimate (T-2) |
| **2026-03-28** | Engineer | Technical spikes — Google Maps API (F-3) + DynamoDB benchmark (F-4) |
| **2026-03-28** | PM Lead | Unit economics model — AWS Lambda + DynamoDB + Twilio at 3 incidents/week/agency (VI-2) |
| **2026-03-29** | PM Lead | Obtain written consent from Angela + Tom + their agency management (T-4) |
| **2026-03-29** | Designer | Begin E3 Figma prototype — 3-tap approval card, 5 vacancy scenarios (U-1 + V-2) |
| **2026-04-03** | PM Lead | Launch E1 (concierge pretotype) — 2-week run with Angela + Tom |
| **2026-04-03** | PM Lead | Run E2 (preference extraction session) with Angela — 90 min, 10 clients |
| **2026-04-07** | PM Lead | Run `agentic-safety-discovery` (Skill 10) after ethics-trust-mapping completes |
| **2026-04-07** | PM Lead | Run `brainstorm-experiments-new` (Skill 11) using Priority Experiment Queue Tier 1–3 |
