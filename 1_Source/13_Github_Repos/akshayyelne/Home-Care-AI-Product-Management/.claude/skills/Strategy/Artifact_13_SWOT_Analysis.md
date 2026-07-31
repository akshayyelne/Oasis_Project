# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Strategy/Artifact_13_SWOT_Analysis.md
# Generated: 2026-07-31T00:49:45.177Z

**Project:** Home-Care-AI
**Stage:** Strategy → Stage 1 (Strategic Frame)
**Skill:** swot-analysis
**Date:** 2026-03-27
**Methodology:** SO / WO / ST / WT cross-reference → Build / Defend / Pivot / Exit signals
**Input:** Artifact 12 — Startup Canvas (north star); Artifacts 1–11 (full Discovery pipeline)
**Regulatory Context:** Australian Privacy Act 1988 (APP). HIPAA-grade security applied as design floor.
**Feeds into:** Artifact 14 — Value Proposition (Strategy Skill 3); or canvas re-calibration if PIVOT/EXIT returned


> **⚠ Re-calibration Gate (CLAUDE.md Article IV Rule 2):** If this analysis returns a PIVOT or EXIT signal on any quadrant, the startup-canvas must be updated before proceeding to Stage 2. A PIVOT signal revises Target Segment or Value Props. An EXIT signal revises Moat or Defensibility.
>
> **Verdict is in §6. Jump there first if you only need the signal.**



| # | Strength | Evidence | Competitive Relevance |
|---|---|---|---|
| **S1** | **Uncontested soft preference layer** — No competitor (AlayaCare, HCP, Brevity) currently matches on client trust, familiarity threshold, or personal protocols. The SPP (Soft Preference Profile) is a novel matching dimension in this market. | Artifact 3 (competitive gap analysis): AlayaCare Vacant Visit Agent matches availability + qualifications only. Angela (CC-001): "Not just who's available — who does this patient trust." | Primary defensibility claim. Not easily replicated without a fundamentally different data model and onboarding approach. |
| **S2** | **11 Discovery artifacts grounded in YODA first-party data** — 2 validated coordinator interviews, 2 family contact interviews, 45 assumptions mapped, 13 experiments designed. Decisions are evidence-led before a dollar of build spend. | Artifacts 1–11 — all primary behavioural data, not market reports | Most startups build on analogies. We build on Angela and Tom's real incident logs. |
| **S3** | **Privacy-by-design architecture completed before build** — v1 data model (Artifact 9 §9) has zero Red-zone fields. DPIA triggers identified. E-3 notification gate is a structural code constraint, not a policy. | Artifact 9 (Ethics Trust Map), Artifact 10 (Agentic Safety) | Competitors retrofitting privacy onto existing EMR architectures face a harder, more expensive compliance path. Privacy-by-design is a product differentiator and a competitive barrier. |
| **S4** | **Agentic safety framework established** — L1/L2/L3 action classification, HITL timeout protocol, E-3 family notification gate, 10 edge cases explicitly handled. Coordinator trust is a designed property, not a hoped-for outcome. | Artifact 10 (Agentic Safety Discovery) | The coordinator's willingness to trust the system is what makes the 1-tap value prop possible. Safety architecture is the precondition for the North Star metric. |
| **S5** | **Domain specificity** — The product is built for one problem (vacant visit matching) in one context (Australian home care coordination). No generalist AI scheduling tool has the SPP depth, the E-3 notification gate, or the familiarity-weighted matching logic. | All discovery artifacts | Generalist tools (even well-funded ones) cannot match domain-specific products in the care quality dimension without starting over. |
| **S6** | **Concierge-first go-to-market** — E1 validates value before any engineering investment. Angela and Tom are validation partners, not beta testers. The concierge phase creates reference customers and behavioral data simultaneously. | Artifact 11 (XP-1A/1B), Artifact 8 (GTM-3 experiment) | Low CAC, high signal fidelity. The concierge model is a startup advantage incumbents cannot replicate at scale. |
| **S7** | **Coordinator-champion sales motion confirmed** — GTM-1 (Q4, Confidence 8): care coordinator is champion AND veto player. Bottom-up adoption aligns with purchasing authority. No 12-month enterprise procurement cycle required. | Artifact 8 Q4 (GTM-1 ICE 512) | Accessible go-to-market for a 2-person team. No sales team, enterprise IT review, or clinical governance committee required for initial sale. |



| # | Weakness | Evidence | Risk Level |
|---|---|---|---|
| **W1** | **4 Critical build blockers unresolved** — E-1 (anti-discrimination legal opinion blocks matching engine), VI-4 (APP 8 blocks WhatsApp), VI-1 (standalone WTP unvalidated blocks go-to-market), F-1 (carer availability reliability blocks supply-side). All four must clear before Sprint 1. | Artifact 8 Critical Path; Artifact 10 SC-01, SC-02 | 🔴 CRITICAL — blocks build |
| **W2** | **SPP cold start problem** — Match quality is zero until SPP is populated. New agencies using the product before completing the E2 migration session get the same match quality as a manual roster search. The moat doesn't exist at day 1. | Artifact 5 (OST E2), Artifact 11 (XP-3A/3B) | 🟠 HIGH — affects first-impression value |
| **W3** | **Carer-side dependency entirely unvalidated** — XP-4A (WhatsApp acceptance) and XP-4B (availability self-report) have zero first-party data. If carers don't update availability or don't reply to WhatsApp assignments, the matching engine cannot function reliably. This is a supply-side risk outside the product's control. | Artifact 11 (XP-4A, XP-4B) — both ⬜ Pending | 🔴 HIGH — could collapse the core flow if F-1 fails |
| **W4** | **Compliance investment front-loaded before revenue** — ~$25–35K AUD in DPIA completion (DPIA-01–07) + legal opinions (E-1, VI-4) required before first paying customer. Substantial cash outlay for a bootstrapped or pre-revenue team. | Artifact 12 §10 (Cost Structure) | 🟠 HIGH — cash flow constraint at beachhead scale |
| **W5** | **No brand presence or market credibility** — No product, no case study, no industry association presence, no SEO, no thought leadership. Peer referral (GTM-2) requires a validated reference customer first. The waitlist (XP-2B) requires someone to find the page. | Artifact 11 (XP-2B) | 🟡 MEDIUM — manageable once E1 yields a reference customer |
| **W6** | **Single beachhead concentration — 2 coordinators** — Angela and Tom are the only validation partners. Both are Australian. Sample is small and potentially biased toward coordinator profiles that already recognise the problem as solvable by technology. Insights may not generalise to less-engaged coordinators. | Artifacts 2b, 2c | 🟡 MEDIUM — de-risked by adding 2 new coordinators in E3 (XP-1C) |
| **W7** | **Engineering team not yet assembled** — T-2 (8-week build estimate) is an unvalidated assumption. No engineer has reviewed the spec. Sprint 0 estimate is a Tier 1 action that has not yet been completed. Build timeline risk is unknown. | Artifact 8 T-2 (Q1 — ICE 168) | 🟡 MEDIUM — Sprint 0 is a 3-day task; easy to resolve |



| # | Opportunity | Evidence | Capture Condition |
|---|---|---|---|
| **O1** | **Uncontested coordination gap** — The scheduling coordination layer of Australian home care has been structurally neglected by EMR vendors. AlayaCare, HCP, and Brevity all focus on clinical documentation, billing, and compliance — not the "who will the client accept?" dimension. This gap is confirmed by both primary research and competitive analysis. | Artifact 3 (competitive gap analysis): all competitors have low/no score on Trust friction layer | Window: estimated 12 months before AlayaCare responds. Moat must be built within that window. |
| **O2** | **Ageing population + NDIS expansion** — Australia's home care sector is structurally growing. NDIS expansion, CHSP continuity, and the cultural preference for home-over-residential care increase the volume of agencies and clients. More agencies means more vacant visit incidents, and more clients means more complex preference matching. The problem gets harder to solve manually as scale increases. | Government policy trajectory; ACFA / NDIS data (pending VI-3 first-party research) | Market is growing into the product, not away from it. |
| **O3** | **Workforce fragmentation is accelerating** — Australia's home care workforce is highly casualised, high-turnover, and geographically dispersed. Carer absence events are increasing, not decreasing. This means the vacant visit cascade problem Angela and Tom described will be experienced by more coordinators, more often. | Artifact 2b/2c verbatim: "It's getting worse" (Angela). Workforce casualisation is a sector trend. | The problem Home-Care-AI solves is a structural feature of the market, not a temporary pain point. |
| **O4** | **AI regulatory tailwind in Australia** — Unlike the US, Australia's AI regulatory environment is in early consultation. APP is established law and our compliance architecture is built for it. There is a window to establish an APP-compliant AI product before AI-specific regulation adds new obligations. Being first to market with a demonstrably compliant AI care coordination tool is a trust differentiator. | Australian Government AI safety consultation (2024–2025); APP reform ongoing but not yet prohibitive | Act now. Compliant product before AI regulation hardens is a better position than compliant product after. |
| **O5** | **AlayaCare's enterprise focus leaves independent agencies underserved** — AlayaCare's motion is top-down, enterprise, and feature-rich. Independent agencies (20–200 clients) pay list price, receive generic onboarding, and get features designed for large chain workflows. A coordinator-first, concierge-onboarded product tailored to sole operators and small teams is structurally differentiated from what AlayaCare delivers to this segment. | Artifact 3, Artifact 12 §9 (Can't/Won't) | The beachhead segment is where AlayaCare is weakest. This is the right place to start. |
| **O6** | **Greenfield NDIS agencies as cold-start mitigation** — New agencies launching on NDIS have no existing EMR, no existing preference history, and no AlayaCare migration to manage. For these agencies, there is no EMR integration requirement (VI-1 is not a barrier) and no cold-start problem (SPP starts fresh from day 1). If VI-1 proves to be a blocker for established agencies, greenfield NDIS agencies are the alternative beachhead. | Artifact 8 W4 / O2 cross-reference; VI-1 conditional pivot path (Artifact 12) | Conditional opportunity — activate only if XP-2A returns 0 LOIs from established agencies. |
| **O7** | **Family Contact expansion (future)** — FC is a growing secondary segment with increasing demand for transparency and communication. The notification pipeline (E-3 compliant) is already designed. Once CC adoption is validated and the notification gate is live, family communication features extend the product's value to a second paying segment (or a justification for higher per-agency pricing). | Artifacts 2a, 2d (Rachel Chen, James Osei); Artifact 12 §2C | Unlocks after CC beachhead is validated. Not in v1 scope. |



| # | Threat | Probability | Impact | Timeframe |
|---|---|---|---|---|
| **T1** | **AlayaCare competitive window closes** — AlayaCare (2,000+ AU/NZ providers, substantial engineering resources, existing EMR relationship) could add a soft preference feature. If they announce this within 12 months, the primary differentiator narrative shifts from "unique capability" to "better implementation than AlayaCare." The data moat (SPP completeness per agency) remains, but the window for frictionless first-mover positioning closes. | Medium | 🔴 HIGH | 6–18 months |
| **T2** | **VI-1: EMR integration prerequisite** — Agency owners currently on AlayaCare or HCP may refuse to adopt a standalone tool without integration. If the buyer says "yes, but only if it connects to our existing system," the go-to-market requires either a 6–9 month integration build or a pivot to greenfield agencies (O6). This is the single most immediate existential threat to the go-to-market plan. | Medium-High (Q1 unvalidated) | 🔴 CRITICAL to launch | Immediate |
| **T3** | **E-1 legal negative opinion (partial)** — If Australian anti-discrimination law prohibits using P-2 (gender preference) as an automated scoring parameter, the matching engine must use it in advisory-only mode. More serious: if a broad interpretation makes any SPP-based automated filtering discriminatory (e.g., familiarity threshold as indirect disability discrimination), the entire scoring algorithm must shift to coordinator-judgment-only presentation. This reduces the product's 1-tap value and weakens the "decision tool, not search tool" framing. | Low-Medium | 🟠 HIGH | Resolved by legal opinion (Tier 1 action) |
| **T4** | **Carer technology resistance** — Australia's home care workforce is predominantly older, casually employed, and not technology-native. XP-4A (WhatsApp acceptance) and XP-4B (self-report) are entirely unvalidated. If reply rate < 30%, the availability index is unreliable. If carers continue calling coordinators instead of using the app, the efficiency gain disappears and coordinator workload is unchanged. | Medium (unknown) | 🔴 HIGH | Measured during E1 (2 weeks) |
| **T5** | **Aged care sector regulatory instability** — Post-Royal Commission reforms are ongoing. The Support at Home program (launched July 2025) has changed funding structures. Future regulatory changes could impose new data handling obligations, consent requirements for AI-assisted care decisions, or mandatory integration standards (e.g., NDIS data interoperability requirements). Any of these could increase the cost/complexity of the compliance model. | Medium | 🟡 MEDIUM | 12–24 months |
| **T6** | **Privacy Act reform tightening consent requirements** — Australia's Privacy Act review (completed 2022) produced recommendations that are still being legislated. Potential changes: stronger consent requirements for sensitive information processing, mandatory data breach reporting enhancements, AI-specific transparency obligations. These could increase the DPIA scope and the consent event design complexity beyond what Artifact 9 currently specifies. | Low-Medium | 🟡 MEDIUM | 12–24 months |
| **T7** | **Customer concentration at beachhead scale** — At 2–10 agencies, losing 1 anchor agency has outsized revenue and validation impact. If Angela's or Tom's agency owner refuses the LOI (XP-2A), or if the concierge phase fails to meet the success threshold (XP-1A < 40%), the experiment pipeline stalls and the Strategy Plugin has no validated input to proceed. | Low (relationship quality is strong) | 🟠 HIGH (at current stage) | Immediate |



### SO — Leverage Strengths to Capture Opportunities

| Strength | Opportunity | Strategic Action |
|---|---|---|
| **S1** (SPP layer) × **O1** (Coordination gap) | Build SPP depth and matching quality before the window closes. The competitive moat is data richness per agency, not feature breadth. Every additional SPP field, every correctly matched visit, every continuity history entry makes the gap harder to close. Speed on depth, not width. |
| **S3** (Privacy-by-design) × **O4** (AI regulatory tailwind) | Market "DPIA-complete, APP-certified" as a proof point. Independent agency owners are personally liable for privacy breaches — a product that arrives with completed DPIAs and legal opinions is a risk reduction sale, not just an efficiency sale. |
| **S6** (Concierge GTM) × **O5** (AlayaCare enterprise gap) | Target exactly the segment AlayaCare under-serves: sole operators (Tom profile) and small team coordinators (Angela profile). Concierge onboarding IS the product for these agencies — enterprise tools don't offer a PM who runs the migration session with you. |
| **S2** (YODA evidence base) × **O3** (Workforce fragmentation) | The E1 incident data will capture the real frequency of the problem under current workforce conditions. As workforce fragmentation increases, the problem frequency data will compound — giving us a continuously strengthening sales proof point. |

### WO — Overcome Weaknesses via Opportunities

| Weakness | Opportunity | Strategic Action |
|---|---|---|
| **W2** (SPP cold start) × **O6** (Greenfield NDIS agencies) | New NDIS-launching agencies have no existing SPP to migrate, no EMR dependency, and no cold-start problem. If established agencies are too slow (W4 compliance cost + W1 blockers), greenfield agencies are the path-of-least-resistance validation target. |
| **W4** (Compliance front-loaded) × **O4** (AI regulatory tailwind) | Frame the DPIA investment as a one-time cost that creates a permanent competitive barrier. Agencies asking "did you do a privacy impact assessment?" receive a yes and a report. Competitors without completed DPIAs cannot make this claim. |
| **W5** (No brand presence) × **O1** (Coordination gap) | The coordination gap is the content. Before product launch, publish a single piece of thought leadership: "The 11-call problem: why your coordinator is losing 20% of visits to phone tag." This creates inbound credibility from the target segment without requiring a product. |

### ST — Use Strengths to Mitigate Threats

| Strength | Threat | Mitigation |
|---|---|---|
| **S1** (SPP moat) × **T1** (AlayaCare window) | Move fast on SPP depth — structured fields, matching algorithm, familiarity history — before AlayaCare can respond. Every agency with a fully populated SPP has a switching cost AlayaCare cannot easily overcome. The moat is data, not features. |
| **S2** (Evidence base) × **T4** (Carer resistance) | XP-4A/4B will detect carer behaviour failure within 2 weeks of E1. Early detection enables a pivot to phone-first carer notification before ENG-2 (WhatsApp) is built. Evidence-first means we don't build the wrong channel. |
| **S3** (Privacy-by-design) × **T6** (Privacy Act reform) | The DPIA infrastructure and consent event design are being built now, before reform hardens. If reform adds new requirements, we are amending an existing compliant system, not retrofitting a non-compliant one. Retainer privacy counsel (T-3) provides early warning of legislative changes. |
| **S6** (Concierge GTM) × **T7** (Customer concentration) | Expand the concierge cohort to 4 coordinators (add 2 new participants in E3 Figma sessions — XP-1C) before E1 concludes. Reduces single-relationship dependency and generates additional YODA data points. |

### WT — Weakness + Threat Combinations (High-Risk)

| Weakness | Threat | Risk Scenario | Consequence |
|---|---|---|---|
| **W3** (Carer-side unvalidated) × **T4** (Carer resistance) | XP-4A reply rate < 30% AND XP-4B self-report rate < 40% simultaneously. | The matching engine has no reliable real-time supply-side input. The product becomes a static roster search tool, not a live matching engine. Core value prop changes from "1-tap approval from a live ranked shortlist" to "filtered view of the roster." Materially weaker product. |
| **W1** (4 Build Blockers) × **T1** (AlayaCare window) | Legal opinions and DPIA take 3–4 months. AlayaCare announces a soft preference feature in month 3. | We are building a feature AlayaCare just announced. The "unique capability" claim evaporates. We are now a feature competitor, not a moat competitor. Sprint 0 (T-2) + legal opinion (E-1) must resolve in parallel, not sequentially. |
| **W4** (Compliance cost front-loaded) × **T2** (VI-1 integration requirement) | Spend $25–35K on DPIA + legal, then agency owners say "we need AlayaCare integration first." Zero revenue; maximum sunk cost. | The most expensive failure scenario. Mitigate by running XP-2A (LOI meetings) and VI-1 interview (agency owners) before DPIA spend commits. Sequence: legal opinions first (E-1, VI-4 — 1–2 weeks), agency owner interviews second, DPIA commitment third. |




### ⚠ Re-calibration Gate Result

> **VERDICT: BUILD + DEFEND**
>
> **No PIVOT signal. No EXIT signal.**
>
> The canvas does NOT need to be updated. Proceed to Strategy Stage 2 (`value-proposition`).


**Why no PIVOT:**
A PIVOT signal would require evidence that the Target Segment (CC) or Value Proposition (1-tap SPP matching) is fundamentally wrong. No such evidence exists. Both are confirmed by first-party interview data. The threats (T1 AlayaCare, T2 VI-1) are real but conditional — they depend on experiment outcomes that have not yet been collected. A PIVOT on assumptions, not data, would be premature.

**Why no EXIT:**
An EXIT signal would require a fatal moat or defensibility failure. The SPP data gravity thesis is intact. AlayaCare's WONT copy this (cultural/architectural misalignment). The privacy compliance moat is being built now. No structural reason exists to exit the strategy.

**Why BUILD + DEFEND:**
- **BUILD** on the SPP moat and the coordination gap (S1 × O1). The window is 12 months. Depth and data richness per agency is the priority.
- **DEFEND** against VI-1 (T2) and AlayaCare (T1). These are the two most immediate threats to revenue and competitive position.


### Strategic Recommendations

| # | Recommendation | Signal | Owner | Deadline |
|---|---|---|---|---|
| **SR-1** | **Sequence the Tier 1 legal actions before any DPIA spend.** Legal opinions (E-1 anti-discrimination, VI-4 APP 8) take 1–2 weeks and cost $5–9K. DPIA completion costs $8–15K and is downstream of both. If E-1 returns negative, matching algorithm must be redesigned before DPIA is worth completing. Run legal first. | W1 + W4 | PM Lead + Legal Counsel | Week 1 |
| **SR-2** | **Run VI-1 agency owner interview in parallel with E1.** VI-1 (agencies pay without EMR integration) is the most important unvalidated go-to-market assumption. It costs one 45-minute interview to test. If it fails, the go-to-market pivots to greenfield NDIS agencies (O6) before any marketing spend occurs. | W1 + T2 | PM Lead | Week 1–2 |
| **SR-3** | **Treat XP-4A/4B as a build gate, not an experiment.** Do not begin ENG-2 (WhatsApp matching integration) until XP-4A (carer reply rate ≥ 50%) returns data. If carer resistance is high, the build pivots to phone-first notification. Building WhatsApp before confirming carer acceptance is a WT risk (W3 × T4). | W3 + T4 | PM Lead + Engineer | End of E1 (2 weeks) |
| **SR-4** | **Expand the validation cohort from 2 to 4 coordinators in E3.** Angela and Tom are the only validation partners. Adding 2 coordinators outside their network (XP-1C) costs one day each and reduces the customer concentration risk (T7) while generating generalisability data for S2. | W6 + T7 | PM Lead + Designer | Week 2–3 |
| **SR-5** | **Establish the AlayaCare monitoring cadence now.** S-1 assumption: monitor release notes, conference announcements every 6 weeks. If AlayaCare announces a soft preference or preference-based matching feature, the competitive narrative changes from "unique" to "better." Knowing this immediately allows repositioning before the market hears about it. | T1 | PM Lead | Ongoing from today |



| Area | Metric | Target | Review |
|---|---|---|---|
| **Strength S1** (SPP moat) | SPP completeness rate per agency | ≥ 80% (XP-3A threshold) | End of E2 |
| **Weakness W1** (Build blockers) | Legal opinions received | 2 of 2 (E-1 + VI-4) by week 2 | Week 2 |
| **Weakness W3** (Carer-side) | WhatsApp reply rate (XP-4A) | ≥ 50% within 15 min | End of E1 |
| **Opportunity O1** (Competitive window) | AlayaCare feature announcements | 0 soft preference announcements | Every 6 weeks |
| **Threat T1** (AlayaCare) | AlayaCare monitoring log | No preference matching feature in release notes | Ongoing |
| **Threat T2** (VI-1) | Agency owner LOI signed | ≥ 1 of 2 (XP-2A) | End of E1 week 2 |
| **Threat T4** (Carer resistance) | XP-4A reply rate + XP-4B self-report rate | ≥ 50% / ≥ 50% | End of E1 |



| ID | From SWOT | To Next Skill | What Transfers |
|---|---|---|---|
| **HS-SWOT-01** | §6 Verdict: BUILD + DEFEND — no PIVOT/EXIT | `value-proposition` (Strategy Skill 3) | Canvas is confirmed. Proceed to Stage 2 without re-calibration. |
| **HS-SWOT-02** | SO cross-reference: S1 × O1 (SPP moat + coordination gap) | `value-proposition` + `user-journey-map` | SPP depth and matching quality are the primary value levers. Value prop must centre on the trust dimension, not the speed dimension. |
| **HS-SWOT-03** | SR-1 (legal sequencing) + SR-3 (XP-4A build gate) | `startup-canvas` update (if needed post-experiments) | If E-1 or VI-1 returns negative: update canvas §4 (Value Proposition) and §7 (Growth) before running downstream Strategy skills |
| **HS-SWOT-04** | WT cross-reference: W3 × T4 (carer resistance double-risk) | `agentic-logic-spec` (Execution) | If XP-4A < 50%: ENG-2 (WhatsApp) is replaced by phone-first notification fallback. This changes the L3 action set in agentic-logic-spec. |
| **HS-SWOT-05** | §7 Metrics (AlayaCare monitoring, VI-1 LOI) | `positioning-statement` (Strategy Skill 7) | Moat claims are capped at "unconfirmed" until E1 LOI and 6-week AlayaCare monitor return data. Positioning statement cannot claim confirmed moat until signals are in. |



| Date | Owner | Action |
|---|---|---|
| **2026-03-27** | PM Lead | Proceed to `value-proposition` (Strategy Skill 3) — no canvas re-calibration required |
| **2026-03-27** | PM Lead + Legal | SR-1: Initiate E-1 anti-discrimination legal opinion (week 1 Tier 1 action) |
| **2026-03-27** | PM Lead | SR-2: Schedule VI-1 agency owner interview for end of E1 week 1 |
| **2026-03-27** | PM Lead | SR-5: Set up AlayaCare release note monitoring cadence (6-week interval) |
| **2026-03-28** | PM Lead | SR-4: Recruit 2 additional coordinators (outside Angela/Tom network) for E3 Figma sessions |
| **2026-04-10** | PM Lead | After experiment data: if XP-4A < 50% → SR-3 triggers (no ENG-2 build until channel confirmed) |
| **2026-04-10** | PM Lead | After experiment data: if XP-2A = 0 LOIs → re-run canvas §7 (Growth) + §2 (Segments) with greenfield NDIS agency pivot |


*SWOT note: This analysis is a snapshot at 2026-03-27. The two most time-sensitive items are T2 (VI-1 go-to-market assumption) and T4 (carer technology behaviour) — both resolve within 2 weeks of E1 launch. The SWOT should be updated after experiment data is collected (2026-04-10) and whenever AlayaCare monitoring detects a competitive announcement.*
