# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Discovery/Artifact_7_Assumptions.md
# Generated: 2026-07-31T00:49:45.134Z

**Project:** Home-Care-AI
**Stage:** Discovery → Stage 4 (Risk & Ethics Gating)
**Skill:** identify-assumptions-new
**Date:** 2026-03-26
**Methodology:** 8-category assumption map — Teresa Torres 4 core risks extended with Ethics, Go-to-Market, Strategy, and Team
**Input:** Artifact 6 — Brainstorm Ideas (Top 5: PM-1, PM-2, DES-1, ENG-2, DES-5) + A1–A10 from Section 6
**Beachhead Segment:** Care Coordinator (CC)
**Regulatory Context:** Australian Privacy Act 1988 (APP) — operative framework. HIPAA-grade security applied as design floor.
**Feeds into:** Artifact 8 — Prioritise Assumptions (Impact × Risk matrix)


> **Reading this artifact:** Assumptions from Artifact 6 (A1–A10) are absorbed and cross-referenced below under their correct risk category. New assumptions identified in this skill run are marked **[NEW]**. Per CLAUDE.md Article III: assume three-quarters of these will not perform as hoped. The goal is to identify what to test, not what to build.



| Rating | Definition |
|---|---|
| **High** | Direct evidence from discovery interviews (Artifacts 2a–2d) or confirmed competitor research (Artifact 3) |
| **Medium** | Plausible inference from evidence — has not been directly tested or confirmed |
| **Low** | Pure hypothesis — no evidence base; high probability of being wrong |



*Will the product create genuine value for coordinators? Will they keep using it?*


### V-1 — The SPP Match Produces Better Clinical and Relational Outcomes vs. Availability-Only Matching
**[Carries A1 from Artifact 6 — deepened]**

**Statement:** A replacement match that includes soft preference data (familiarity, trust, dementia protocols) produces meaningfully better outcomes — lower client distress, fewer visit refusals, lower churn — than a match based solely on availability and qualifications.

**Why it matters:** This is the core value claim. If SPP-matched replacements produce the same distress rate as random replacements, the entire differentiation argument collapses. AlayaCare fills visits. We claim we fill visits *better*. This claim must be measurable.

**Evidence so far:** Tom's Henderson family loss followed 3 weeks of mismatch. Angela's Lin Chen refusal was predicted by her SPP knowledge. Mrs. Kim's gender preference is non-negotiable. These are qualitative signals of value — not yet a measured outcome rate.

**Confidence:** Medium — strong directional evidence, zero quantitative validation.

**Test:** E1 (concierge pretotype) — track client distress events, visit refusals, and family complaints during matched vs. unmatched replacement periods. Henderson-equivalent incidents are the outcome metric, not just time-to-fill.


### V-2 — Coordinators Will Trust a Machine-Generated Ranking Enough to Approve Without Calling
**[= A1 from Artifact 6]**

**Statement:** When presented with a ranked shortlist of 3 replacement candidates (including familiarity flag), coordinators will approve the top match in 70%+ of scenarios without independently verifying via phone.

**Why it matters:** If coordinators call every recommended candidate before approving, the product reduces phone calls by 3, not 11. The value proposition depends on the coordinator trusting the system's judgment at the approval step.

**Confidence:** Medium — coordinators named the desired outcome ("one approval click") but have never been shown a prototype with a machine ranking.

**Test:** E3 (Figma prototype) — 5 vacancy scenarios, observe acceptance rate of top-ranked candidate vs. request for manual review.


### V-3 — The SPP Has Standalone Value Before the Matching Engine Is Built
**[NEW]**

**Statement:** Agencies will find value in the SPP as a knowledge capture and handover tool — even without automated matching — and will pay for it or commit to onboarding before the matching engine is functional.

**Why it matters:** This is the "bus-proof" value proposition (PM-4). It determines whether we can generate early revenue and commitment before the full matching engine is validated. If SPP-alone has no perceived value, the product has no landing wedge.

**Confidence:** Medium — Angela named the bus risk explicitly and with fear, not just frustration. But named fear ≠ willingness to pay for a solution.

**Test:** During E2 (preference extraction session), ask Angela and Tom at the end: "If this knowledge package existed and was available to your agency owner right now, would they pay $X/month for it, independently of any matching feature?"


### V-4 — The Carer Briefing Notification Reduces Post-Assignment Phone Calls
**[Carries DES-5 / A9 from Artifact 6 — deepened]**

**Statement:** When replacement carers receive a Knowledge Card 30 minutes before a visit, coordinators stop making the 2–3 pre-visit briefing calls they currently make after assigning a replacement.

**Why it matters:** DES-5 claims to remove Angela's last 2–3 calls per incident. If carers don't read the notification, or coordinators don't trust that carers read it, they continue calling anyway. The value is zero and the notification is noise.

**Confidence:** Low — no evidence that carers read pre-visit push notifications in home care settings. This is a plausible behaviour assumption with no data.

**Test:** E1 observation — after sending briefing notification, observe whether Angela or Tom makes a follow-up phone call. Ask them directly: "Did you call David before his visit? Why / why not?"


### V-5 — Agencies Perceive Coordinator Departure as a Significant Enough Business Risk to Pay for SPP Continuity
**[NEW]**

**Statement:** Agency owners view losing a coordinator's institutional knowledge as a material business risk — comparable to losing a key client — and will frame SPP as a business continuity investment, not a software subscription.

**Why it matters:** This determines the commercial framing of the product. "Better scheduling software" has a price ceiling. "The only system that protects your agency when your coordinator leaves" has a higher ceiling and a different buyer (agency owner, not coordinator).

**Confidence:** Low — Angela's "bus" comment came from the coordinator, not the agency owner. We have no interview evidence from agency owners on this specific risk perception.

**Test:** Interview 2 agency owners (not coordinators). Ask: "When was the last time a coordinator left your agency? What happened to your client relationships in the following month?" (Mom Test past-behaviour framing.)


### V-6 — The Family Notification Feature Reduces Client Churn at the Agency Level
**[NEW]**

**Statement:** Automated family notification on schedule changes prevents client churn events caused by the "nobody showed up and nobody told us" failure. Agencies that use family notification retain clients who would otherwise leave.

**Why it matters:** Tom's Henderson family left after a series of poorly communicated changes. If automated notification had been in place, the family might have tolerated the substitutions. This is a retention metric at the agency level, not just a coordinator satisfaction metric.

**Confidence:** Medium — the Henderson case is a direct causal chain: poor communication → family anger → agency switch. But we cannot confirm that better communication alone would have prevented the switch (vs. the underlying continuity problem).

**Test:** E1 — after a replacement is assigned, send a family notification (manually composed in concierge pretotype). Follow up 1 week later: did the family contact the agency? Was there a complaint? Did they remain as clients?



*Will coordinators figure out how to use the product? Can we onboard them fast enough? Does it reduce or increase cognitive load?*


### U-1 — The 3-Tap Approval Flow Is Completable at 6:30 AM Under Stress Without Prior Training
**[Carries DES-1 / A5-A6 from Artifact 6]**

**Statement:** A coordinator woken at 6:30 AM by a carer absence can open the product notification, review 3 candidate cards, and approve a replacement in under 60 seconds — without having been trained on the product and without a login friction barrier.

**Why it matters:** The 6:30 AM moment is the product's highest-stakes UX test. If the flow requires a login, a password reset, or more than 3 steps, the coordinator will default to phone calls — and the product loses at the moment of truth.

**Confidence:** Medium — the desired outcome is unambiguous from CC interviews. Whether a first-time user can navigate it without training is untested.

**Test:** E3 (Figma prototype) — run the 5 scenarios without any briefing. Observe: does the coordinator ask "where do I tap?" at any point? Measure time to completion. Measure number of hesitation points.


### U-2 — 3 Candidates Is the Right Decision Surface
**[= A5 from Artifact 6]**

**Statement:** Showing 3 replacement candidates (not 1, not 5) produces the right balance of coordinator confidence and decision speed.

**Why it matters:** 1 candidate = too prescriptive, coordinator doesn't feel in control. 5 candidates = too many choices, coordinator spends 10 minutes comparing. 3 is a hypothesis based on UX convention, not evidence from CC coordinators specifically.

**Confidence:** Medium — "too many choices" anxiety is a documented UX phenomenon (paradox of choice), but the right number for coordinator decision-making in this specific context is untested.

**Test:** E3 (Figma prototype) — run two scenario variants: 3 candidates vs. 5 candidates. Measure time to decision and coordinator verbal feedback on whether they felt confident or overwhelmed.


### U-3 — The Familiarity Flag Is the Trust-Producing Field on the Candidate Card
**[= A6 from Artifact 6]**

**Statement:** When coordinators see "has met this client before — 2 prior visits" on a candidate card, this single field drives their confidence in approving the match more than distance, match score, or qualification badge.

**Why it matters:** The design of the candidate card must prioritise the right field. If coordinators look at distance first, or qualifications first, the card hierarchy is wrong and we are optimising for the wrong signal.

**Confidence:** Medium — both CC coordinators emphasised familiarity as the key variable ("who does this patient trust"). But whether this translates to the familiarity flag being the most-scanned field on a card is a UX assumption.

**Test:** E3 (Figma prototype) — verbal think-aloud protocol. Ask: "Tell me what you look at first on this card." Supplement with eye-tracking if available; otherwise use verbal report.


### U-4 — Tom (Sole Operator) and Angela (Large Agency) Are Served by the Same Interface
**[NEW]**

**Statement:** The product's coordinator interface works equally well for a sole operator managing 25 clients (Tom) and a coordinator managing 60+ clients across a larger agency (Angela) — without requiring a separate product variant or significant configuration.

**Why it matters:** Tom and Angela have different operational contexts — Tom has no backup, manages intake himself, and works in a different agency structure. If the product requires significant configuration for each context, the onboarding and support cost rises sharply.

**Confidence:** Medium — both described the same core workflow (absence → replacement → notification). But Angela's 60+ client context has operational complexity (multiple shift types, specialist qualifications) that Tom's 25-client context may not.

**Test:** During E1 (concierge pretotype) — observe whether the replacement matching process requires different logic for Tom vs. Angela. If the matching criteria differ significantly, the product may need tiered configuration.


### U-5 — The Onboarding Wizard Produces Accurate SPP Data Without High Correction Rates
**[Carries DES-3 from Artifact 6 — deepened]**

**Statement:** When coordinators narrate client preferences into the onboarding wizard (DES-3), the NLP extraction produces SPP field values that coordinators confirm as correct more than 80% of the time — without significant manual correction.

**Why it matters:** If coordinators spend more time correcting extracted fields than they would filling in a form, the wizard has negative usability value. The wizard is only justified if it reduces the cognitive load of data entry, not if it creates a correction burden.

**Confidence:** Low — NLP extraction accuracy on idiosyncratic coordinator language ("she'll accept someone if they're properly briefed about not moving Arthur's things") is entirely untested. This is a feasibility assumption masquerading as a usability one.

**Test:** E2 (preference extraction session) — run a paper SPP form first, then test the NLP extraction on the same 10-client narratives. Compare: how many fields are correctly populated vs. requiring correction? What is the coordinator's experience of correction effort?



*Can we monetise it? Is the unit economics sustainable? Will it be compliant under APP? Can the business scale?*


### VI-1 — Agencies Will Pay for a Standalone Product Without Requiring EMR Integration at Launch
**[NEW]**

**Statement:** Home care agencies will subscribe to Home-Care-AI as a standalone tool running alongside their existing EMR (AlayaCare, HCP, etc.) — without requiring a native EMR integration before they commit.

**Why it matters:** EMR integration is the standard expectation for any healthcare workflow tool. If agencies refuse to adopt a tool that doesn't integrate with their existing EMR from day one, the product cannot go to market without deep integration work — which is a 6–12 month delay and a significant cost.

**Confidence:** Low — Tom uses Google Sheets alongside his existing tools; Angela uses sticky notes. Both have demonstrated willingness to run parallel tools. But this is coordinator behaviour, not agency owner procurement behaviour.

**Test:** Interview 2 agency owners. Ask: "When you've adopted a new operational tool in the past, did you require it to integrate with your existing systems before you'd pay for it? Can you tell me about a time you used a standalone tool that wasn't integrated?"


### VI-2 — Per-Agency Subscription Pricing Is Viable at Target Margins Given Infrastructure Cost
**[NEW]**

**Statement:** A per-agency monthly subscription (estimated $200–$500/month based on coordinator WTP signals and comparable SaaS benchmarks) produces gross margins > 60% after AWS Lambda, DynamoDB, Twilio/SendGrid, and support costs at beachhead scale (25–60 clients per agency, ~3 vacancy incidents/week).

**Why it matters:** If the per-incident notification + matching compute cost exceeds the subscription revenue at small agency scale, the beachhead segment is unviable without a volume minimum.

**Confidence:** Low — no unit economics have been modelled yet. This requires `ai-unit-economics` (Skill 8 of Strategy Plugin) to validate properly.

**Test:** Model cost-per-agency at beachhead scale using AWS Lambda pricing, DynamoDB throughput costs, Twilio SMS rates, and SendGrid email rates. The `ai-unit-economics` skill should be run in Strategy Plugin Stage 5 with this data.


### VI-3 — Australian Home Care Market Has Sufficient Agency Volume and Size for a Viable Beachhead
**[NEW]**

**Statement:** There are enough home care agencies in Australia at 25–200 client scale (the CC persona range) to reach the revenue threshold required for Series A / sustainability without requiring international expansion in the first 24 months.

**Why it matters:** If the Australian home care market is too small or too consolidated (dominated by a few very large agencies that buy from AlayaCare), the beachhead is unviable.

**Confidence:** Low — market size has not been quantified. Australian home care is a significant sector (NDIS + aged care + private), but the agency count at the target scale is unknown.

**Test:** Secondary research — ACFA (Aged Care Financing Authority) annual report, NDIS registered provider data, My Aged Care provider register. Target: identify the count of agencies with 20–200 clients that are not already AlayaCare subscribers.


### VI-4 — APP 8 Cross-Border Disclosure Is Resolvable by Design Before ENG-2 Production
**[= A7 from Artifact 6, deepened]**

**Statement:** APP 8 obligations for WhatsApp messages transiting Meta's infrastructure (US/Ireland) are satisfied by: (a) message content design — no personal health information in payload, and (b) updated agency privacy notice disclosing Meta infrastructure transit. Privacy counsel confirms this resolution is sufficient without requiring explicit individual consent per APP 8(2).

**Why it matters:** If privacy counsel determines that APP 8 requires explicit per-client consent for WhatsApp coordination messages, the operational burden (obtaining and managing consent records for every client) may make ENG-2 commercially unviable.

**Confidence:** Medium — the message content design (minimum necessary, no PHI combination) is a strong mitigation. But whether an agency privacy notice update is sufficient vs. requiring client-level consent is a legal question that requires counsel, not inference.

**Test:** Engage privacy counsel for a 2-hour retainer review of the ENG-2 message flow against APP 8. Target: written opinion on whether privacy notice update is sufficient, or whether per-client consent is required.


### VI-5 — Churn Is Low Enough Post-Onboarding That Payback Period Is Achievable Within 12 Months
**[NEW]**

**Statement:** Once an agency has 3+ months of SPP data, the switching cost (accumulated preference knowledge) is high enough that monthly churn falls below 2% — making a 12-month payback period achievable at target CAC.

**Why it matters:** The SPP moat is the primary retention thesis. If coordinators don't maintain SPPs (A2 risk), the moat doesn't form, churn is high, and the LTV:CAC ratio doesn't support the business model.

**Confidence:** Low — the switching cost thesis is logical but entirely unvalidated. No comparable product exists to benchmark SPP-driven retention.

**Test:** Not testable before launch. Design a 6-month cohort metric post-launch: SPP completeness score at 30, 60, 90 days vs. churn rate at 6 months. If SPP completeness < 50% at 90 days, retention hypothesis is at risk.


### VI-6 — NDIS Billing Complexity Does Not Create a Compliance Burden That Blocks Agency Adoption
**[NEW]**

**Statement:** The product can operate in NDIS-funded home care agencies without requiring NDIS billing integration, PRODA credentials, or compliance with NDIS Quality and Safeguards Commission reporting requirements at launch.

**Why it matters:** NDIS-registered agencies have specific reporting obligations. If the product inadvertently creates a compliance audit trail that NDIS providers must include in their Quality and Safeguards Commission submissions, it may create legal liability for the agency — deterring adoption.

**Confidence:** Low — NDIS compliance requirements for software tools are complex and not publicly documented in a form that can be evaluated without legal/compliance expertise.

**Test:** Interview 1 NDIS-registered home care agency manager. Ask: "When you adopt a new software tool, what compliance checks does it need to pass before you can use it for NDIS client coordination?"



*Can we build it with the current technology? Are the integrations possible? Can it be efficient and scalable?*


### F-1 — Staff Will Update Their Availability Reliably in the App
**[= A4 from Artifact 6]**

**Statement:** Field carers will update their availability status in the app (or via WhatsApp webhook) in near-real-time — rather than calling the coordinator. The availability index is sufficiently current for the matching engine to return valid candidates within the 30-minute response window.

**Why it matters:** If carers don't update availability, the matching engine returns candidates who are not actually available — producing incorrect recommendations that damage coordinator trust immediately.

**Confidence:** Low — updating a digital availability tool is a behaviour change from the current norm (calling the coordinator). Behaviour change is the highest-failure assumption category.

**Test:** E1 (concierge pretotype) — at the start of the trial, provide carers with a simple WhatsApp availability update command ("Reply 'AVAILABLE [date] [time]' to update your schedule"). Measure: what % of carers update availability proactively vs. requiring coordinator to check?


### F-2 — The Rule-Based SPP Match Score Correlates With Coordinator Judgment at r > 0.70
**[NEW]**

**Statement:** The v1 matching algorithm (rule-based tag overlap: qualification match [gate] → proximity [score] → SPP match [score]) produces a ranked list where the coordinator's manually chosen top candidate matches the system's top candidate in at least 70% of cases.

**Why it matters:** If the algorithm's top pick diverges from the coordinator's judgment more than 30% of the time, coordinators will stop trusting the ranking and manually re-order every time — negating the "one approval" UX goal.

**Confidence:** Medium — the matching criteria (qualification, proximity, familiarity) are grounded in what coordinators actually use. But the weighting and scoring model is entirely hypothetical until tested against real decisions.

**Test:** E1 (concierge pretotype) — after team produces a ranked shortlist, show it to the coordinator and ask: "Is this the order you would have chosen? If not, what would you change and why?" Track divergence rate across all E1 incidents.


### F-3 — Google Maps Distance Matrix API Is Accurate for Matching in Regional Australian Areas
**[= A4 partial / NEW]**

**Statement:** The Distance Matrix API produces accurate driving-time proximity scores for home care visits in suburban and regional Australian locations (not just major metro areas) — within ±15% of actual travel time for the 30-minute response window.

**Why it matters:** Angela's agency operates across an eastern region that may include suburban and peri-urban areas. Inaccurate proximity scores lead to misranked candidates — a carer ranked #1 by proximity may actually be 45 minutes away.

**Confidence:** High — Google Maps Distance Matrix API has extensive Australian coverage and is well-documented. This is a Low-risk assumption relative to others.

**Test:** Technical spike — query Distance Matrix API for 10 synthetic address pairs representative of Angela's service region. Compare to manual route check. Pass threshold: ±15% accuracy on 9 of 10 queries.


### F-4 — DynamoDB Document Model Handles SPP Similarity Queries at 60-Client Scale Within 200ms
**[= A10 from Artifact 6]**

**Statement:** DynamoDB document queries for SPP match scoring (fetching 20 staff SPP compatibility vectors and computing tag overlap) complete within 200ms at 60-client / 20-staff scale — fast enough for the matching engine to return a ranked list before the coordinator's notification is opened.

**Why it matters:** If SPP queries are slow, the coordinator receives the notification before the ranked list is ready — either a blank card or a delayed push, both of which break the 6:30 AM UX promise.

**Confidence:** High — at 60 clients / 20 staff, DynamoDB query volume is trivial. This is a Low technical risk. Only becomes material at 1,000+ clients.

**Test:** Technical spike — benchmark DynamoDB query latency for 20-document scan with tag overlap computation. Pass threshold: p95 < 200ms under simulated concurrent load.


### F-5 — WhatsApp Business API Reply Parsing Is Reliable for Single-Character Approval Commands
**[NEW]**

**Statement:** When a coordinator replies "1", "2", or "3" to a WhatsApp matching message, the Lambda webhook correctly parses the reply and triggers the correct assignment in ≥ 99% of cases — with no ambiguity errors (e.g., misread "1" as "1." or autocorrected to a word).

**Why it matters:** An incorrect parse (coordinator says "1", system assigns candidate 3) is a high-consequence error. If the coordinator doesn't check the confirmation message, the wrong carer is dispatched.

**Confidence:** Medium — single-character parsing is simpler than NLP, but mobile autocorrect, emoji insertion, and multi-message replies are real edge cases on WhatsApp.

**Test:** Technical spike — test WhatsApp Business API webhook with 50 synthetic reply variants (plain "1", "1.", "1 ", "one", "YES 1", delayed reply, duplicate reply). Validate parser handles all variants correctly or gracefully degrades to "please reply with 1, 2, or 3".


### F-6 — SMS Delivery to International Numbers Is Viable for Family Contacts (Rachel's London Brother, James's Auckland Sister)
**[Carries ENG-4 from Artifact 6 — deepened]**

**Statement:** Twilio SMS routing to international numbers (UK, NZ, other countries) for family notification is reliable, affordable, and does not require additional compliance or sender registration steps in those jurisdictions.

**Why it matters:** Two of three FC interview participants have family contacts living internationally. Family notification is only complete if it reaches all registered contacts, including those overseas.

**Confidence:** Medium — Twilio supports international SMS at known rates. But SMS sender registration requirements vary by country (UK requires A2P 10DLC equivalent; NZ has different rules). This is manageable but not trivial.

**Test:** Twilio documentation review + pricing model for UK/NZ SMS. Pass threshold: delivery rate >98% and per-SMS cost < $0.15 AUD at target notification volume.



*Should we build this? Are there ethical risks for clients, carers, coordinators, or families?*


### E-1 — SPP Data Does Not Create a Discriminatory Carer Selection System
**[NEW — HIGH PRIORITY]**

**Statement:** Collecting and acting on client gender preferences, familiarity requirements, and personal triggers does not create a system that unlawfully discriminates against carers on the basis of protected attributes (gender, ethnicity, age, disability) under the Australian Sex Discrimination Act, Age Discrimination Act, or Disability Discrimination Act.

**Why it matters:** If a client's SPP states "female carers only," and the system systematically excludes male carers from that client's matching pool, male carers receive fewer shift opportunities through the platform. At scale, this could constitute indirect discrimination in employment conditions — particularly if male carers are disproportionately affected.

**Confidence:** Low — this is a genuine legal grey area. Client preference is a recognised consideration in personal care (a carer entering a client's home for intimate care tasks). But automated enforcement of that preference at scale has different legal implications than individual coordinator judgment.

**Test:** Obtain legal opinion on whether automated SPP-based carer filtering constitutes lawful preference vs. discriminatory assignment under Australian employment and anti-discrimination law. This is a CRITICAL assumption — cannot ship matching engine without resolution.


### E-2 — The Matching Algorithm Does Not Amplify Coordinator Bias in Client Preference Records
**[NEW]**

**Statement:** The SPP data entered by coordinators reflects genuine client preferences — not coordinators' own assumptions about which carers "fit" which clients based on ethnicity, age, or other attributes. The matching algorithm does not amplify these biases at scale.

**Why it matters:** If Angela's SPP for Mrs. Kim reflects a genuine client preference ("female carers only"), the algorithm correctly acts on this. If the SPP instead reflects Angela's assumption that Mrs. Kim prefers same-ethnicity carers, the algorithm encodes and scales that assumption — producing racially or demographically biased assignments across the entire client population.

**Confidence:** Low — bias in preference data entry is well-documented in hiring and recommendation systems. This is a systematic risk, not an edge case.

**Test:** During E2 (preference extraction session) — after populating SPPs for 10 clients, review all entries with Angela. Ask: "Is this something Mrs. Kim told you directly, or is this your inference based on how she responded to different carers?" Track proportion of preference entries that are direct client statements vs. coordinator inference.


### E-3 — Automated Family Notifications Comply With the SR Cohort's "Patient First" Design Constraint
**[NEW — CRITICAL]**

**Statement:** The automated family notification pipeline (S6, O3) never sends a notification to a family member before the patient or the coordinator is aware of the schedule change. The notification order is: Coordinator approves → Coordinator (confirmation) → Patient (if patient has a mobile/app) → Family. Family is never notified before the patient.

**Why it matters:** Arthur Kovacs (SR-002) found out about an AI health flag through his son, who received a notification before Arthur did. This caused significant distress and eroded trust in the technology. Replicating this failure in the notification pipeline would violate the SR cohort's non-negotiable design constraint and potentially cause real harm to vulnerable clients.

**Confidence:** High confidence this constraint is correct — Arthur's account is explicit and detailed. Medium confidence the current pipeline design enforces it — this must be an architectural gate, not a design preference.

**Test:** This is not an experiment — it is a structural requirement. Must be enforced in `agentic-logic-spec` as an explicit gate: `family_notification_triggered = true` ONLY AFTER `coordinator_approved = true`. Must appear in ethics-trust-mapping (Skill 9) as a Red-zone constraint.


### E-4 — Carer Availability and Location Tracking Does Not Constitute Surveillance Without Consent
**[NEW]**

**Statement:** Collecting and storing carer availability status and proximity data (for the matching engine) constitutes lawful data collection under the Australian Privacy Act — with appropriate consent from carers via their employment contract or a specific data collection notice, and without creating a continuous location surveillance dynamic.

**Why it matters:** The matching engine requires proximity data (for distance scoring). If this is interpreted by carers as GPS tracking of their location in real time, it may damage the employment relationship and create industrial relations risk. The distinction between "availability-based proximity" (carer self-reports their postcode) vs. "GPS tracking" is critical.

**Confidence:** Medium — availability-based proximity (carer enters their postcode or suburb for the day) is clearly distinct from GPS tracking. The architecture in ENG-1 uses Google Maps Distance Matrix from a postcode input, not a live GPS feed.

**Test:** Legal/HR review — confirm that requiring carers to input a daily availability location (suburb/postcode) for scheduling purposes is consistent with existing fair work and privacy obligations under the Fair Work Act and Privacy Act 1988.


### E-5 — SPP Data (Client Preferences and Trust Flags) Is Appropriate Personal Information Under APP
**[NEW]**

**Statement:** The data types collected in the SPP — client gender preferences for carers, refusal conditions, personal triggers, familiarity history — are classified and handled as personal information under the Australian Privacy Act, with appropriate consent, storage, and access controls.

**Why it matters:** If SPP data is treated as operational data rather than personal information, it may be stored, accessed, or used without adequate privacy protections. Given that SPP includes client preferences, behaviour patterns, and conditions (e.g., dementia briefing requirements), it likely constitutes sensitive information requiring explicit consent.

**Confidence:** Medium — the Privacy Act's definition of personal information is broad enough to include SPP data. Sensitive information (health information) in the SPP (dementia protocols, anxiety triggers) likely requires explicit consent under APP 3.

**Test:** Privacy counsel review — classify SPP data fields as personal information / sensitive information / operational data under APP 3. Determine consent and handling obligations per field. This feeds directly into `ethics-trust-mapping` (Skill 9) Green/Yellow/Red classification.


### E-6 — The Product Does Not Create a "Performing Wellness" Dynamic for Clients
**[NEW — carries SR cohort constraint]**

**Statement:** The SPP knowledge graph does not inadvertently create a dynamic where clients or carers perform preferences for the system — behaving differently because they know preferences are being recorded — rather than expressing genuine needs.

**Why it matters:** Lin Chen (SR-001) games her pill organiser and repositions her shoes to appear more independent than she is. Arthur Kovacs (SR-002) began "performing wellness" once he knew AI was monitoring him. If clients learn that their "known preferences" are recorded and drive carer assignment decisions, they may suppress genuine preferences to appear less demanding or more independent.

**Confidence:** Medium — this is a behavioural risk that emerges over time, not immediately. The SR cohort already exhibits gaming behaviour with existing tools.

**Test:** Not testable at pretotype stage. Design a longitudinal indicator: at 6-month review, ask coordinators whether any clients have changed how they express preferences since they learned about the SPP. Track SPP data stability over time — large changes in preference data after a client learns about the system are a signal.



*Can we reach and convert agencies? Do we have the right channels and messaging?*


### GTM-1 — The CC Coordinator Is Both Champion and Veto Player for Agency Purchase
**[NEW]**

**Statement:** The care coordinator is the primary champion for adoption — they will push for the product with their agency owner — but also has effective veto power. If the coordinator doesn't want the product (because it threatens their role, changes their workflow unfavourably, or feels like surveillance), the agency won't buy it even if the owner is interested.

**Why it matters:** This determines the sales motion. If the coordinator is a pure champion, the pitch goes coordinator → owner. If the coordinator is a veto player, the pitch must work for the coordinator before it goes to the owner. A product that positions as "replacing the coordinator" will be killed at the champion stage.

**Confidence:** High — Angela and Tom are the only people in their agencies who could evaluate this product. In Tom's case (sole operator), the coordinator and owner are the same person.

**Test:** During E1 — observe Angela and Tom's language when describing the product to their agency owner (if they do). Do they describe it as "empowering me" or "replacing me"? This framing tells us how they are selling it internally.


### GTM-2 — Peer Referral Through Home Care Agency Networks Is the Primary Acquisition Channel
**[NEW]**

**Statement:** Agency owners discover and evaluate new operational tools primarily through peer referrals from other agency owners — at industry events, in online communities, or through direct recommendation — rather than through digital advertising or direct sales.

**Why it matters:** This determines where to focus go-to-market effort. If peer referral dominates, the product strategy is: get 2 reference agencies (Angela, Tom) → generate a case study → present at one industry event → referral chain begins. This is low-cost acquisition. If agencies rely on vendor pitches, the model is outbound sales — high-cost, slower.

**Confidence:** Medium — B2B SaaS in small business markets typically has high peer-referral rates. Home care agencies are a tight-knit sector with industry associations (ACSA, HCCI). But this is a market assumption, not confirmed by CC interviews.

**Test:** Ask Angela and Tom during E1: "How did you find out about the last software tool you adopted? Was it a recommendation from another agency, a vendor pitch, a conference, or something else?"


### GTM-3 — E1 Participants (Angela, Tom) Become Willing Reference Customers After Concierge Pretotype
**[NEW]**

**Statement:** After a successful 2-week E1 concierge pretotype, Angela and Tom are willing to provide a named case study, appear as references for prospective agency customers, and describe their experience publicly (with appropriate confidentiality safeguards).

**Why it matters:** The go-to-market strategy for Stage 1 depends on reference customers. Without named references, the product has no social proof for agency owners evaluating the purchase.

**Confidence:** Medium — both coordinators are engaged and motivated (they agreed to participate in 4+ hours of interviews). But moving from "research participant" to "commercial reference" is a larger commitment.

**Test:** At the end of E1 — ask Angela and Tom directly: "If this tool were available as a product, would you be willing to speak with other agency coordinators about your experience?" Note: this is also a skin-in-the-game WTP signal (willingness to invest social capital, not just financial capital).


### GTM-4 — A 30-Day Free Trial Is Sufficient for Agencies to Experience Enough Vacancy Incidents to Evaluate Value
**[NEW]**

**Statement:** In a 30-day trial period, a typical agency (25–60 clients, 3 vacancy incidents/week) experiences enough vacancy incidents that the coordinator uses the product 10+ times and can form a genuine opinion of its value.

**Why it matters:** If the trial period is too short (e.g., an agency goes 4 weeks without a vacancy incident), the product cannot demonstrate its core value. Trial-to-paid conversion depends on the coordinator having experienced the product in a real crisis, not just in a demo.

**Confidence:** High — Tom estimated ~1–2 vacancy incidents/week at 25 clients; Angela ~3/week at 60+ clients. A 30-day trial at Tom's scale produces 4–8 incidents — enough for evaluation. Confidence in the frequency estimate comes from CC interviews.

**Test:** Track incident rate during E1 (2 weeks). If E1 produces fewer than 4 incidents across both agencies, the trial-to-paid conversion model needs a longer evaluation period.


### GTM-5 — The "Bus-Proof" Messaging Resonates With Agency Owners More Than Efficiency Messaging
**[NEW]**

**Statement:** "Your agency survives when your coordinator leaves" (risk/continuity framing) produces higher agency owner interest and willingness to pay than "fill vacancies 45 minutes faster" (efficiency framing).

**Why it matters:** These are two different value propositions aimed at two different buyer motivations. Risk-framing appeals to loss aversion; efficiency-framing appeals to productivity. The right framing determines landing page copy, sales call structure, and pricing anchor.

**Confidence:** Low — the risk framing came from the coordinator (Angela), not from an agency owner. We have no direct evidence that agency owners are more loss-averse than efficiency-motivated in software purchasing decisions.

**Test:** A/B test two landing page variants: (A) "Fill every vacant visit — one approval, zero phone calls." (B) "When your coordinator leaves, your clients' preferences don't have to." Measure: time on page, email signup rate, demo request rate.


### GTM-6 — The Concierge-to-Product Transition Does Not Erode Coordinator Trust
**[NEW]**

**Statement:** When the E1 manual concierge matching service is replaced by the automated Lambda pipeline (ENG-1), coordinators do not experience a trust drop — the automated recommendations feel as credible as the human-curated shortlist.

**Why it matters:** E1 is run by a human team with explicit care. The coordinator trusts the shortlist partly because they know a person researched it. When the pipeline goes automated, the coordinator is trusting an algorithm. If this transition erodes trust, coordinators revert to phone calls and the product fails at product-market fit despite validating the concierge concept.

**Confidence:** Low — this transition risk is well-documented in concierge pretotype methodology (the "concierge gap"). No evidence base specific to CC trust in automated matching.

**Test:** Design the E1 → product transition carefully — week 3 of E1, replace the human matching team with the automated pipeline without telling the coordinators. Observe: does the quality of matches change? Does the coordinator's approval rate change? After the transition, disclose it and ask: "Did you notice any difference?"



*Can others copy this strategy? Are we solving the right problems? Are our strategic assumptions sound?*


### S-1 — AlayaCare Does Not Add Soft Preference Matching Within 12–18 Months
**[NEW — HIGH PRIORITY]**

**Statement:** AlayaCare's Vacant Visit Agent will not add a soft preference layer (client trust profiles, familiarity matching) to their matching algorithm within the time window required for Home-Care-AI to reach product-market fit.

**Why it matters:** If AlayaCare ships soft preference matching before we reach 50 reference agencies, our primary differentiator disappears and we are competing against a well-funded, established platform with existing agency relationships.

**Confidence:** Medium — AlayaCare's current Vacant Visit Agent is availability + qualification only. Adding SPP-equivalent functionality requires a data model change, a new data capture workflow, and a matching algorithm update — not trivial. But AlayaCare has engineering resources to ship this in 12–18 months if they prioritise it.

**Test:** Monitor AlayaCare release notes, press releases, and conference announcements every 6 weeks. Assign a competitive intelligence task to the team. If AlayaCare announces soft preference matching, trigger a strategic review.


### S-2 — The CC Beachhead Unlocks HCN and FC Without a Separate Sales Motion
**[NEW]**

**Statement:** When an agency adopts Home-Care-AI for coordinator smart matching, the same agency subscribes to the HCN documentation and family communication features as a natural upsell — without requiring a separate sales motion targeting nurses and families.

**Why it matters:** The pipeline plan (CC → HCN → FC) assumes that CC adoption creates the data infrastructure and internal champion network needed to expand to other personas within the same agency. If HCN and FC features require separate sales motions (separate buyer, separate evaluation), the expansion cost is much higher.

**Confidence:** Medium — the coordinator is the agency's operational hub. If the coordinator recommends HCN documentation tools to their agency owner, the same buyer (owner) makes both decisions. But the HCN persona (nurses) may have different adoption dynamics than the CC persona.

**Test:** At 3-month review of E1 agencies — ask Angela and Tom: "If we added a feature that let your nurses record visit notes by voice instead of typing, would you want that? Would you use it to sell the expanded product to your agency owner?"


### S-3 — The SPP Data Moat Creates a Defensible Position Against Copycats
**[NEW]**

**Statement:** After 6 months of SPP accumulation, the switching cost is high enough that even if a competitor ships an identical feature set, the agency will not switch because of the data loss involved in migrating 6 months of preference history.

**Why it matters:** SPP is the primary moat thesis. If the moat is shallower than assumed (e.g., agencies can export SPP data easily and import into a competitor, or they simply rebuild SPP in 2 weeks after switching), the strategy requires a different defensibility mechanism.

**Confidence:** Low — switching cost from data moats is documented in CRM and HR software, but has not been tested in this specific context. The moat assumes coordinators cannot easily rebuild SPP knowledge — but experienced coordinators rebuilt this knowledge from scratch when they joined Angela's or Tom's agency, suggesting it is rebuildable.

**Test:** During E2 — after populating 10 SPPs in 90 minutes, ask Angela: "How long would it take you to build this knowledge again if the system were deleted tomorrow?" If the answer is "2 weeks," the moat is shallow. If the answer is "6 months," the moat is deep.


### S-4 — The Australian Home Care Regulatory Environment Is Stable Enough for a 24-Month Build Horizon
**[NEW]**

**Statement:** Australian aged care and home care regulation (NDIS Quality and Safeguards, Aged Care Quality Standards, My Aged Care provider obligations) will not change in ways that fundamentally alter the product's compliance posture or value proposition within the 24-month build and validation horizon.

**Why it matters:** Australian aged care has been through the Royal Commission into Aged Care Quality and Safety (2018–2021). Post-Royal Commission reforms are still rolling out. A new regulatory obligation (e.g., mandatory digital care plan review timelines, mandatory family notification requirements) could either validate our product or require a compliance rebuild.

**Confidence:** Medium — post-Royal Commission reforms are largely known and scheduled. The regulatory environment is more stable now than during 2020–2022. But NDIS is still evolving rapidly.

**Test:** Engage an aged care regulatory consultant for a 2-hour briefing on: "What regulatory changes are expected in the next 24 months that would affect home care scheduling, coordinator obligations, and family communication?" This is a strategy-level input, not an experiment.


### S-5 — Home-Care-AI Is Building a Clinical Intelligence Layer, Not a Scheduling Tool
**[NEW]**

**Statement:** The strategic position is the "clinical intelligence layer between the visit and the family" (Artifact 3 strategic implication) — not a scheduling efficiency tool. This framing protects against being commoditised as a scheduling add-on and positions for the HCN and FC expansion (Capabilities #1, #3, #4).

**Why it matters:** How we frame the strategy determines which features we build next, how we price, and how we differentiate from scheduling tools. If we internally think of ourselves as "better AlayaCare scheduling," we will build scheduling features. If we think of ourselves as "the clinical intelligence layer," we will build the longitudinal pattern engine (Capability #1) and family communication features (Capability #4) as the natural next steps.

**Confidence:** High — Artifact 3's strategic implication is grounded in the gap analysis. All 6 identified gaps point to the intelligence layer, not the scheduling layer. No competitor owns this position.

**Test:** Not a testable assumption — this is a strategic choice. Validate by checking that every feature prioritisation decision in Artifact 8 and beyond is evaluated against the intelligence layer framing, not the scheduling efficiency framing.



*Do we have the right people, skills, and culture to build this?*


### T-1 — The Team Has Sufficient Home Care Domain Knowledge to Design SPP Data Model Correctly Without a Clinical Advisor
**[NEW]**

**Statement:** The founding team can design the SPP data model (preference fields, matching weights, briefing note structure) with sufficient clinical and operational accuracy — without a dedicated home care clinical advisor on the team — based on the interview evidence collected in Artifacts 2a–2d.

**Why it matters:** The SPP is the product's core data asset. If key preference fields are missing (e.g., the team doesn't know that dementia patients require specific briefing protocols beyond "familiar carers"), the matching engine produces incomplete matches and coordinators lose trust.

**Confidence:** Medium — Artifacts 2c (CC) and 2a (HCN) contain rich domain knowledge. Angela and Tom can serve as ongoing domain advisors during E1/E2. But neither Angela, Tom, nor the PM Lead has formal clinical training.

**Test:** During E2 — after populating 10 SPPs, review the SPP data model with Angela. Ask: "Are there fields that are important to you that this template doesn't capture?" If Angela names 5+ missing fields, the domain knowledge gap is material.


### T-2 — The Team Can Build the Lambda Matching Pipeline + SPP Store + WhatsApp Integration to a Testable Prototype in 8 Weeks
**[NEW]**

**Statement:** Starting from the E1 concierge validation, the engineering team can build a functional v1 matching pipeline (ENG-1 + ENG-3 + ENG-2) to a state where real coordinators use it in production within 8 weeks.

**Why it matters:** If the build horizon is 16+ weeks, the competitive window narrows and the team's runway is consumed before product-market fit signals are available.

**Confidence:** Low — no engineering capacity estimate has been made. The assumption is that Lambda + DynamoDB + WhatsApp API is straightforward infrastructure. But healthcare data handling (SPP privacy, audit logging, HITL design) adds compliance overhead that pure engineering estimates often undercount.

**Test:** Sprint 0 sizing — before committing to a build timeline, have the engineering lead produce a 3-point estimate (optimistic/likely/pessimistic) for ENG-1 + ENG-3 alone (matching pipeline + SPP store). If the likely estimate exceeds 6 weeks for these two components, the 8-week total is not achievable.


### T-3 — Privacy Counsel Can Be Engaged on a Retainer Basis for APP 8 Review Without a Full-Time Legal Hire
**[NEW]**

**Statement:** A privacy law firm with Australian Privacy Act and health data expertise can be engaged on a retainer or project basis to review the product's data flows, classify SPP data under APP, and advise on APP 8 WhatsApp obligations — without requiring a full-time in-house legal hire at this stage.

**Why it matters:** Multiple legal/privacy assumptions require external counsel (A7, E-1, E-5, VI-4). If counsel engagement is only possible at full-time hire cost, the legal risk mitigation plan is not executable at pre-revenue stage.

**Confidence:** High — privacy counsel retainers for startup stage are standard in Australia. Firms specialising in health data and APP exist in major cities (Melbourne, Sydney). This is an operational question, not a strategic one.

**Test:** Obtain 3 quotes from Australian privacy law firms for a "health tech startup APP compliance review" retainer. Target: < $5,000 AUD for initial review + ongoing retainer option.


### T-4 — The PM Lead Can Maintain Research Relationships With Angela and Tom Through 4+ Months of Experiments
**[NEW]**

**Statement:** Angela (CC-001) and Tom (CC-002) will remain engaged as research and pretotype participants through E1, E2, E3, and any subsequent experiment cycles — without relationship fatigue, agency policy changes, or coordinator turnover disrupting access.

**Why it matters:** The entire experiment strategy (E1, E2, E3) depends on access to these two specific coordinators. If Angela leaves CareBridge, or if CareBridge's management restricts external research participation, the beachhead validation strategy loses its primary data sources.

**Confidence:** Medium — both coordinators were enthusiastic and engaged through 40+ minute interviews. But 4 months of active participation (including a 2-week daily pretotype engagement) is a significantly larger commitment.

**Test:** Before E1 begins — obtain written consent from both the coordinator and their agency management for participation in a 4-month product research and pretotype programme. This converts a relationship assumption into a documented commitment.


### T-5 — The Team Has the Emotional Resilience to Apply the 75% Assumption Failure Rate Honestly
**[NEW]**

**Statement:** When experiment results come back negative — when E1 shows coordinators still calling carers manually, when E2 shows SPP completeness at 40%, when E3 shows coordinators override the top-ranked candidate 60% of the time — the team updates the product strategy rather than reinterpreting the data to confirm existing beliefs.

**Why it matters:** This is a team culture assumption, not a technical or market one. It is also the assumption most frequently violated in product development. Per CLAUDE.md Article III: "75% assumption failure rate — assume three-quarters of ideas will not perform as hoped. Design experiments, not roadmaps."

**Confidence:** Low — no evidence either way. All teams believe they will update on negative data. Most do not.

**Test:** Not testable before experiments run. After E1, conduct an honest post-experiment review: list the assumptions the experiment was designed to test, state the result for each, and explicitly state whether the product strategy is updated or unchanged. Share this document with an external advisor or investor for an outside perspective.



| ID | Category | Assumption (Short) | Confidence | Risk | Test Method |
|---|---|---|---|---|---|
| V-1 | Value | SPP match produces better clinical/relational outcomes | Medium | High | E1 — track distress events + churn |
| V-2 | Value | Coordinator trusts machine ranking to approve without calling | Medium | High | E3 — fake door, acceptance rate |
| V-3 | Value | SPP has standalone value before matching engine | Medium | High | E2 — WTP probe at session end |
| V-4 | Value | Briefing notification reduces post-assignment phone calls | Low | High | E1 — observe whether coordinator still calls carers |
| V-5 | Value | Agency owners perceive coordinator departure as business risk | Low | High | Interview 2 agency owners (Mom Test) |
| V-6 | Value | Family notification reduces client churn | Medium | Medium | E1 — send notifications, track retention |
| U-1 | Usability | 3-tap flow completable at 6:30 AM without training | Medium | High | E3 — unguided prototype test |
| U-2 | Usability | 3 candidates is the right decision surface | Medium | Medium | E3 — compare 3 vs. 5 candidates |
| U-3 | Usability | Familiarity flag is the trust-producing field | Medium | Medium | E3 — verbal think-aloud |
| U-4 | Usability | Tom and Angela served by same interface | Medium | Medium | E1 — observe interface differences needed |
| U-5 | Usability | Onboarding wizard produces accurate SPP without high correction | Low | High | E2 — NLP extraction vs. form comparison |
| VI-1 | Viability | Agencies pay for standalone tool without EMR integration | Low | High | Interview 2 agency owners |
| VI-2 | Viability | Per-agency subscription covers COGS at target margins | Low | High | Unit economics model (Strategy Plugin) |
| VI-3 | Viability | Australian market is large enough for 24-month growth | Low | High | Secondary research — ACFA, NDIS data |
| VI-4 | Viability | APP 8 resolved by design + privacy notice (not per-client consent) | Medium | High | Privacy counsel review |
| VI-5 | Viability | SPP moat drives churn < 2% post-3 months | Low | High | 6-month post-launch cohort metric |
| VI-6 | Viability | NDIS compliance doesn't block adoption | Low | Medium | Interview 1 NDIS-registered agency manager |
| F-1 | Feasibility | Staff update availability reliably in app | Low | High | E1 — observe availability update behaviour |
| F-2 | Feasibility | Rule-based SPP score correlates with coordinator judgment r > 0.70 | Medium | High | E1 — compare algorithm vs. coordinator ranking |
| F-3 | Feasibility | Google Maps API accurate for regional Australian matching | High | Low | Technical spike — 10 address pairs |
| F-4 | Feasibility | DynamoDB SPP query < 200ms at 60-client scale | High | Low | Technical spike — load test |
| F-5 | Feasibility | WhatsApp reply parsing reliable for single-character commands | Medium | Medium | Technical spike — 50 synthetic reply variants |
| F-6 | Feasibility | Twilio SMS reliable for international family contacts | Medium | Low | Twilio docs + pricing model |
| E-1 | Ethics | SPP does not create discriminatory carer selection | Low | **CRITICAL** | Legal opinion — anti-discrimination law |
| E-2 | Ethics | Matching doesn't amplify coordinator bias in SPP data | Low | High | E2 — probe preference source (direct vs. inferred) |
| E-3 | Ethics | Family notification never precedes patient notification | High | **CRITICAL** | Structural gate in agentic-logic-spec |
| E-4 | Ethics | Carer location data = availability input, not GPS surveillance | Medium | High | Legal/HR review — Fair Work + Privacy Act |
| E-5 | Ethics | SPP fields classified correctly under APP as personal/sensitive info | Medium | High | Privacy counsel review |
| E-6 | Ethics | SPP does not create "performing wellness" dynamic for clients | Medium | Medium | 6-month longitudinal indicator |
| GTM-1 | Go-to-Market | CC is both champion and veto player | High | High | E1 — observe how coordinators describe product to owners |
| GTM-2 | Go-to-Market | Peer referral is primary acquisition channel | Medium | Medium | Ask Angela + Tom how they discover new tools |
| GTM-3 | Go-to-Market | E1 participants become willing reference customers | Medium | High | Ask at E1 end — willing to be a reference? |
| GTM-4 | Go-to-Market | 30-day trial includes enough incidents for evaluation | High | Low | Track incident rate during E1 |
| GTM-5 | Go-to-Market | "Bus-proof" messaging resonates more than efficiency messaging | Low | Medium | Landing page A/B test |
| GTM-6 | Go-to-Market | Concierge-to-product transition doesn't erode coordinator trust | Low | High | Blind transition test at E1 week 3 |
| S-1 | Strategy | AlayaCare doesn't add soft preference matching in 12–18 months | Medium | High | Competitive intelligence — monitor every 6 weeks |
| S-2 | Strategy | CC beachhead unlocks HCN/FC without separate sales motion | Medium | High | Ask Angela + Tom at 3-month review |
| S-3 | Strategy | SPP data moat is deep enough to prevent switching | Low | High | E2 — ask how long to rebuild SPP if deleted |
| S-4 | Strategy | Regulatory environment stable for 24-month horizon | Medium | Medium | Aged care regulatory briefing |
| S-5 | Strategy | Clinical intelligence framing, not scheduling tool | High | Low | Strategic alignment check — ongoing |
| T-1 | Team | Team domain knowledge sufficient without clinical advisor | Medium | Medium | E2 — ask Angela for missing SPP fields |
| T-2 | Team | Build Lambda + SPP + WhatsApp to prototype in 8 weeks | Low | High | Sprint 0 engineering estimate |
| T-3 | Team | Privacy counsel available on retainer basis | High | Low | Get 3 quotes |
| T-4 | Team | Angela + Tom engagement sustainable for 4+ months | Medium | High | Written consent from coordinator + agency management |
| T-5 | Team | Team applies 75% failure rate honestly to experiment results | Low | Medium | Post-E1 honest review with external advisor |



| ID | Assumption | Why Critical | Required Before |
|---|---|---|---|
| E-1 | SPP does not create discriminatory carer selection | Potential breach of Sex Discrimination Act / Disability Discrimination Act — cannot ship matching engine without legal opinion | ENG-1 / SPP build |
| E-3 | Family notification never precedes patient notification | Arthur Kovacs constraint — structural HITL gate required | S6 / ENG-4 build |
| VI-4 | APP 8 resolved by design + privacy notice | If per-client consent is required, ENG-2 may be unviable | ENG-2 build |
| VI-1 | Agencies pay without EMR integration | If agencies require integration at purchase, GTM model fails | Any sales motion |



| ID | From Artifact | To Next Skill | What Transfers |
|---|---|---|---|
| HS-DISC-ASM-01 | Artifact 7 — Full 45-assumption map | `prioritize-assumptions` (Skill 8) | All assumptions → Impact × Risk matrix + ICE scoring |
| HS-DISC-ASM-02 | Artifact 7 — E-1, E-3 (Critical) | `ethics-trust-mapping` (Skill 9) | Critical ethics assumptions → Green/Yellow/Red data classification |
| HS-DISC-ASM-03 | Artifact 7 — E-3, E-5, E-6 | `ethics-trust-mapping` (Skill 9) | SPP data fields → data sensitivity classification |
| HS-DISC-ASM-04 | Artifact 7 — F-1 through F-6 | `agentic-safety-discovery` (Skill 10) | Feasibility constraints on agentic actions → Level 1/2/3 classification |
| HS-DISC-ASM-05 | Artifact 7 — Critical section | `identify-assumptions-new` next cycle | After E1/E2/E3 results — re-score confidence on V-1, V-2, F-1, F-2 |



| Date | Owner | Action |
|---|---|---|
| 2026-03-27 | PM Lead | Run `prioritize-assumptions` (Skill 8) using Summary Table — feed all 45 assumptions into Impact × Risk matrix |
| 2026-03-27 | PM Lead | Engage privacy counsel — APP 8 + anti-discrimination law review (covers VI-4, E-1, E-4, E-5) |
| 2026-03-27 | PM Lead | Secondary market research — Australian home care agency count at 20–200 client scale (VI-3) |
| 2026-03-28 | PM Lead | Interview 2 agency owners using Mom Test framing — VI-1 (standalone tool) + V-5 (bus risk) |
| 2026-03-28 | Engineer | Sprint 0 sizing — ENG-1 + ENG-3 3-point estimate (T-2) |
| 2026-03-28 | Engineer | Technical spike — DynamoDB SPP query latency (F-4) and Google Maps API accuracy (F-3) |
| 2026-03-29 | PM Lead | Obtain written consent from Angela + Tom for 4-month research programme (T-4) |


*Assumptions note: 45 assumptions across 8 categories. Per CLAUDE.md Article III — assume three-quarters will not perform as hoped. The four Critical assumptions (E-1, E-3, VI-4, VI-1) must be resolved before any component enters the build pipeline. Remaining assumptions enter the Impact × Risk matrix in Artifact 8, which determines which assumptions are designed into experiments first.*
