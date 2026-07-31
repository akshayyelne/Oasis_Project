# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Discovery/Artifact_2a_HCN_Summary.md
# Generated: 2026-07-31T00:49:45.118Z

**Project:** Home-Care-AI
**Stage:** Discovery → Stage 1 (Customer Research)
**Artifact:** 2a
**Persona Group:** Home Care Nurse (HCN)
**Source Interviews:** HCN-001 (Maria Santos), HCN-002 (David Nguyen), HCN-003 (Priya Sharma)
**Synthesis Date:** 2026-03-27
**Interviewer:** PM Lead
**Next Step:** Feed into `competitive-gap-analysis` alongside Artifacts 2b, 2c, 2d



**Dates:** HCN-001: 2026-03-25 (42 min) | HCN-002: 2026-03-26 (38 min) | HCN-003: 2026-03-27 (48 min)

**Participants:**
- Maria Santos — Home Care Nurse, CareBridge, eastern suburbs. 14 patients/week. Senior, experienced.
- David Nguyen — Home Care Nurse, CareBridge. 10 patients/week. Junior (2 years post-graduation). First year writing care plans.
- Priya Sharma — Home Care Nurse (Team Lead), CareBridge, eastern region. 8 own patients + clinical oversight for 5 nurses / ~50 patients total. 18+ years clinical experience including coroner's inquest testimony.

**Background:**
All three are community-based registered nurses delivering home care in the eastern suburbs. They work the same agency EMR, see patients alone, and are responsible for clinical documentation, medication management, and escalation decisions — without in-person peer support. Maria represents the high-volume experienced practitioner. David represents the junior nurse navigating solo decision-making for the first time. Priya represents the team lead who holds systemic risk visibility but is structurally overloaded. Despite their different seniority levels, all three described the same core loop: visit → observe → document → hope the system catches what they missed.



All three use a shared toolkit:
- **Agency EMR** — the primary record system. Described by all three as slow, crash-prone on mobile, lacking trend views or validation logic.
- **WhatsApp** — used for urgent family and coordinator communication (Maria, all).
- **Personal workarounds** — Maria: voice recorder + paper wound notebook. David: phone abbreviations expanded later. Priya: personal spreadsheet (3–4 hrs/Sunday) + personal notebook (every visit, timestamped, for legal protection).
- **Memory** — all three cited memory as the primary carrier of patient context that no system captures.



| Job to Be Done | What Works | Importance | Satisfaction |
|---|---|---|---|
| Communicate urgent updates | WhatsApp is fast and familiar | High | Medium — informal, no audit trail |
| Document wound care | Paper notebook allows photos and freeform notes | Medium | Low — duplicates into EMR required |
| Legal/compliance documentation | Priya's personal notebook catches granular detail | High (for Priya) | Low — doubles documentation time |
| Care plan peer review | Priya's Sunday review catches ~60% of errors | High | Low — 3-day delay, covers 60% not 100% |



### Problem 1 — Pattern Blindness at Scale

**Job:** Identify patient deterioration trends before a crisis visit.
**Desired outcome:** See longitudinal data (BP, mobility, medication adherence) across multiple visits in one view.
**Importance:** Critical — missed patterns lead to preventable hospitalisations.
**Satisfaction:** Very low — zero trend view in the EMR; each visit note is an island.

> "I knew something was off with Arthur. I could feel it. But when you're seeing fourteen people a week, you can't hold all the patterns in your head. **The system should have caught that, not me.**"
> — Maria, HCN-001

> "Margaret's hospitalisation was preventable. Every single data point was in the system. **But nobody connected them because nobody has time to read eight weeks of visit notes side by side.**"
> — Priya, HCN-003

*Synthesis: Both Maria and Priya experienced preventable adverse events directly caused by pattern blindness. The data existed. The signal was absent. This is the highest-severity pain in the HCN persona — it has direct patient safety consequences and generates lasting professional guilt. David has not yet experienced a patient-harm event from this cause, but his escalation uncertainty (Mrs. Patterson's bruise, 3-day review wait) shows the same structural gap manifesting at junior level.*


### Problem 2 — Documentation Burden Consuming Clinical Time

**Job:** Accurately document every patient visit.
**Desired outcome:** Capture visit details in real time, in the right structured fields, without needing to return to a desk.
**Importance:** High — both clinical quality and legal compliance depend on documentation.
**Satisfaction:** Very low — documentation happens hours after visits, from reconstructed memory.

> "I spend more time writing about care than delivering it. By the time I sit down to type up today's visits, **I've already forgotten half the details. I'm reconstructing, not documenting.**"
> — Maria, HCN-001

> "**I'm typing notes on a phone screen in someone's kitchen while their cat sits on my lap. Of course I make mistakes.**"
> — David, HCN-002

> "**The solicitor asked me what time I gave Gerald his insulin. I said about 8:15. He said, 'Show me.' All my notes said was 'morning visit.'**"
> — Priya, HCN-003

*Synthesis: Documentation failure has two distinct flavours. For Maria, it is a time and fidelity problem — she reconstructs from memory at night and loses detail. For David, it is an accuracy and safety problem — mobile entry in noisy environments causes errors (mg vs mL) that have near-miss consequences. For Priya, it is a legal protection problem — a coroner's inquest established that vague documentation is professionally indefensible regardless of whether the care was actually delivered. All three converge on the same structural cause: the documentation system was designed for a desk, not a patient's home.*


### Problem 3 — Blank-Page Care Plans with No Clinical Decision Support

**Job:** Write care plans that are clinically appropriate for each patient's specific condition profile.
**Desired outcome:** A starting-point recommendation based on assessment data, adjustable by clinical judgment.
**Importance:** High — 30% of care plans reviewed by Priya require material corrections.
**Satisfaction:** Very low — blank template, no suggestions, no contraindication checks.

> "**Every care plan I write starts from scratch. No starting point, no suggestion, nothing. Just me and a blank page.**"
> — Maria, HCN-001

> "**I stared at that blank care plan template for twenty minutes before I started typing.** I knew what Dorothy needed in general, but the specifics — I just didn't have the confidence."
> — David, HCN-002

> "If the system said: 'Based on this assessment, here are recommended goals and interventions, adjusted for this patient's medication contraindications' — **I'd spend my time refining good drafts instead of rewriting bad ones from scratch.**"
> — Priya, HCN-003

*Synthesis: The blank care plan is a consistent failure across all three HCN interviews. For Maria it means slow, effortful creation. For David it means 90-minute first attempts, submitted with low confidence, returned with six corrections. For Priya it means a 30% correction rate on junior plans, consuming 4–5 hours/week of her oversight time. The downstream impact: junior nurses develop slower, teams spend senior time on rework, and patient plans sit on incorrect goals until Priya's Sunday review cycle catches them.*


### Problem 4 — Medication Reconciliation Failures and Lack of Input Validation

**Job:** Ensure every patient is on the correct dose of every medication, with changes reconciled across all providers.
**Desired outcome:** Proactive alerts when medication changes occur; input validation at point of entry.
**Importance:** Critical — errors cause preventable harm (Arthur's hospitalisation, David's near-miss, Gerald's death).
**Satisfaction:** Very low — changes arrive late, documentation has no validation, reconciliation is manual.

> "**I'm supposed to be the one coordinating, but I'm the last person in the chain to know when something changes.** I spend thirty minutes per patient per month just reconciling medication lists. That's seven hours a month on medication admin."
> — Maria, HCN-001

> "**The mg/mL thing still keeps me up at night.** If the system had flagged it — 'this medication is usually measured in mL, did you mean mg?' — I would have caught it instantly."
> — David, HCN-002

> "Medication reconciliation failures are probably our highest-frequency clinical risk. **Changes happen at hospital discharge, at GP visits, at specialist appointments. By the time the information reaches us, the patient has already been on the wrong dose for days.**"
> — Priya, HCN-003

*Synthesis: Medication failures appear in all three interviews and across the full severity spectrum — near-misses (David's mg/mL error), preventable deterioration (Arthur's missed potassium adjustment), and death (Gerald, Priya's coroner's inquest). The failure modes are structural: no cross-provider change notifications, no input validation in the EMR, and a reconciliation process that is entirely manual and always delayed.*


### Problem 5 — Clinical Loneliness and Unstructured Escalation

**Job:** Make sound escalation decisions about ambiguous clinical situations without peer support.
**Desired outcome:** Access to prior visit context + a confidence signal before deciding whether to escalate.
**Importance:** High — under-escalation risks patient harm; over-escalation erodes GP trust.
**Satisfaction:** Very low — no real-time triage support, no priority differentiation in the review queue.

> "In the hospital, I'd ask a senior. Here, I'm on my own, standing in someone's lounge room trying to make a clinical judgment with **no second opinion available.**"
> — David, HCN-002

> "**Loneliness. Mine, I mean. Not the patients'.** Being a home care nurse is lonely. You're making clinical decisions by yourself all day. There's no one to ask 'Does this look right to you?'"
> — David, HCN-002

> "The system puts everything in the same queue with the same priority. A missed medication and a potential fall **look identical in the interface.**"
> — Priya, HCN-003

*Synthesis: This pain point is most acute for David — it surfaced unprompted and was described with visible emotion (hands shaking). Maria compensates with experience and intuition. Priya compensates with a Sunday review process. But the structural problem is the same: home care nursing removes the ward team that would normally provide real-time clinical consultation. The EMR's flat, undifferentiated review queue compounds this by failing to signal which flags are urgent.*



### Insight 1 — The 60% Problem (Priya, HCN-003)
> "I estimate I catch sixty percent of the meaningful trends in my Sunday reviews. **Sixty percent is not good enough. Margaret was in the forty percent.**"
> — Priya, HCN-003

*This is the most precise quantification of risk we have from any HCN interview. Priya — arguably the most diligent nurse in the cohort — accepts a 40% miss rate as an unavoidable consequence of a system that requires manual trend detection. Margaret's preventable hospitalisation was not a failure of Priya's skill. It was a failure of the system's inability to surface pattern information she would have acted on.*


### Insight 2 — Audit Trauma as Documentation Motivation (Priya, HCN-003)
> "The solicitor asked me what time I gave Gerald his insulin. I said about 8:15. He said, 'Show me.' All my notes said was 'morning visit.' **I was telling the truth. I provided competent care. But I couldn't prove it.**"
> — Priya, HCN-003

*Priya's coroner's inquest is a rare, high-fidelity signal: legal defensibility is not a future concern for this persona — it is a lived experience. She now double-documents every visit (notebook + EMR) as a direct result. This behaviour is a strong design signal: timestamped, field-specific, immutable documentation has inherent value to nurses beyond just clinical quality. It is professional self-protection. David does not yet have this motivation — but he may, after his mg/mL near-miss.*


### Insight 3 — The Data Parent Problem (Maria, HCN-001)
> "Sarah was sending me screenshots of her mother's step count and sleep data from a wristband app. Every week: 'Her steps are down forty percent, is something wrong?' **Each one added ten to fifteen minutes to my day** because I'd have to look at the data, compare it with what I observed, and then respond carefully so I didn't escalate Sarah's anxiety."
> — Maria, HCN-001

*Raw patient data sent directly to family members without clinical interpretation creates professional friction for nurses. This is a systems design warning: an alert system that notifies families before clinicians review the signal will increase nursing workload, not decrease it. Any notification architecture must route through clinical triage first.*


### Insight 4 — "I'm Reconstructing, Not Documenting" (Maria, HCN-001)
> "**By the time I sit down to type up today's visits, I've already forgotten half the details. I'm reconstructing, not documenting.**"
> — Maria, HCN-001

*This single sentence defines the documentation quality failure. Notes written hours after visits from reconstructed memory are clinically degraded. This is not a nurse behaviour problem — it is a system design problem. The EMR is unusable in the field; the result is deferred documentation that is structurally less accurate.*


### Insight 5 — "Let Me Just Talk" (David, HCN-002)
> "Let me just talk. I'm standing in someone's kitchen, I've just done a wound assessment. Let me say what happened and have the system figure out where it goes. **Not me typing on a phone screen with autocorrect fighting me.**"
> — David, HCN-002

*Voice-to-structured-record is not just a convenience feature for David — it is the only documentation modality that is physically compatible with the field context. This is the clearest direct feature signal in the HCN cohort.*


### Insight 6 — Pattern Recognition as the Nurse's Undelagatable Job (Priya, HCN-003)
> "**I don't need a system that replaces clinical judgment. I need a system that does the pattern recognition I can't do at scale, and then puts the pattern in front of me so I can make the judgment call.**"
> — Priya, HCN-003

*This is the sharpest articulation of the human-AI division of labour from any interview in the study. It directly defines the product's appropriate autonomy level: Level 1 (surface the pattern) and Level 2 (present it for human decision). Level 3 (act without the nurse) is explicitly not wanted.*



| Pain Theme | Maria (HCN-001) | David (HCN-002) | Priya (HCN-003) | Shared? |
|---|---|---|---|---|
| Pattern blindness / no trend view | Arthur's hospitalisation | Mrs. Patterson bruise (3-day wait) | Margaret's hospitalisation | ✅ All three |
| Documentation burden / delayed notes | 2–3 hrs nightly reconstruction | Phone errors, 10–12 hrs/week | Double-documents every visit | ✅ All three |
| Blank care plan / no decision support | 30–45 min/plan, blank start | 90 min first plan, 6 corrections | 30% of junior plans need rework | ✅ All three |
| Medication reconciliation failures | Last to know about dose changes | mg/mL near-miss | Coroner's inquest / Gerald | ✅ All three |
| Clinical loneliness | Compensated by experience | Named explicitly, visibly distressed | Compensated by Sunday reviews | ✅ All three |
| Legal / audit risk | Implicit | Near-miss incident report | Explicit — coroner's court | Escalates with seniority |



> "**I'd kill for something that just told me: 'Here's what's changed since your last visit. Here's what to watch for today.' Five sentences. That's all I need before I walk through the door.**"
> — Maria, HCN-001

> "**Let me just talk. Let me say what happened and have the system figure out where it goes.**"
> — David, HCN-002

> "**I don't need a system that replaces clinical judgment. I need a system that does the pattern recognition I can't do at scale, and then puts the pattern in front of me so I can make the judgment call.**"
> — Priya, HCN-003



These are not yet solutions — they are problem framings that point toward opportunity areas:

1. **Pre-visit briefing** — longitudinal trend digest delivered before each visit ("what's changed since you were last here")
2. **Voice-to-structured-record** — field-compatible documentation that works standing in a patient's kitchen
3. **Care plan recommendation engine** — assessment-driven starting point that nurses refine, not create from blank
4. **Medication change notification** — cross-provider alert when a dose, drug, or interaction changes
5. **Prioritised escalation queue** — flags ranked by clinical risk, not arrival order
6. **Timestamped, immutable audit log** — legal-defensible record of every clinical action



| Date | Owner | Action |
|---|---|---|
| 2026-03-28 | PM Lead | Run `competitive-gap-analysis` with HCN, FC, CC, SR pain signals |
| 2026-03-28 | PM Lead | Feed Artifact 2a into `market-segmentation-deep-dive` alongside other persona summaries |
| 2026-03-28 | PM Lead | Investigate voice-to-structured-record feasibility (field context: kitchen, phone, ambient noise) |
| 2026-03-28 | PM Lead | Quantify: documentation hours/week across HCN cohort at agency level |
| 2026-03-28 | PM Lead | Quantify: care plan correction rate — is 30% (Priya's estimate) consistent across agencies? |
| 2026-03-28 | PM Lead | Investigate audit log requirements for legal defensibility (coroner's inquest standard) |
| 2026-03-28 | PM Lead | Flag: notification routing rule — family alerts must not bypass clinical triage |


*Handshake note: This artifact feeds directly into `competitive-gap-analysis` (HS-DISC-01 predecessor) and `opportunity-solution-tree`. The verbatim desired outcomes — especially Priya's pattern recognition framing — should anchor the OST's Desired Outcome node for the HCN persona.*
