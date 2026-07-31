# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Discovery/interviews/Interview responses by individual/HCN-003-priya-sharma.md
# Generated: 2026-07-31T00:49:45.148Z

**Project:** Home-Care-AI  
**Stage:** Discovery → Stage 1 (Customer Research)  
**Artifact:** 2 (Synthetic Interview Data)  
**Persona:** Home Care Nurse (Team Lead)  
**Participant ID:** HCN-003  
**Next Step:** Feed into `/summarize-interview` with other HCN interviews


*Persona: Home Care Nurse (Team Lead) | Date: 2026-03-27 | Duration: 48 min | Interviewer: PM Lead*

*Location: CareBridge office, private meeting room | Setting: Face-to-face, door closed*

**Part A: Narrative Transcript**

**Opening & Warm-Up**

**Q: Tell me about your role --- what does a typical week look like for you?**

> I'm the clinical team lead for the eastern region. I see eight patients of my own, and I do clinical oversight for five nurses and their caseloads --- that's about fifty patients total. Oversight means I review care plans, audit documentation, handle complex clinical escalations, and mentor junior nurses like David. A typical week is split: three days of my own patient visits, two days of admin, review, and firefighting.

**Q: What tools does your agency currently use?**

> The same EMR everyone complains about. I also maintain a personal spreadsheet where I track risk indicators for my oversight panel --- things the EMR doesn't flag. Blood pressure trends, medication changes, missed appointments. I update it Sunday evenings by reading through the week's visit notes. It takes three to four hours.

**Block 1: Falls**

**Q: Walk me through a time when a patient's condition deteriorated and you wish the system had caught it earlier.**

> Margaret. Six months ago. Seventy-nine, COPD and heart failure. She was hospitalised with pneumonia. When I reviewed her file afterwards, the pattern was screaming at me. Her oxygen saturation had dropped slightly at each of the last six visits --- ninety-six, ninety-five, ninety-four, ninety-three. Her fatigue scores were climbing. She'd missed two GP appointments. A new medication hadn't been reconciled with her existing prescriptions. No single visit note was alarming. The trend was.

***[Probe]** Why didn't anyone catch it?*

> Because the system shows you one visit at a time. There's no trend view, no longitudinal dashboard, no flag that says 'This patient's oxygen has declined four percent over six weeks.' You'd have to open six separate visit notes, compare the numbers manually, and connect the dots yourself. Nobody has time for that across a full caseload. I tried. I proposed a weekly risk review meeting. Management said they didn't have resources.
>
> So I do it myself. Every Sunday evening, three to four hours, scrolling through fifty patients' notes looking for the ones who are about to fall off a cliff. I catch some of them. I miss others. That's not a system --- that's me being stubborn on my own time.

***[Emotional note]** Priya was calm throughout but her voice hardened here. This is frustration compressed into quiet determination.*

**Block 2: Medications**

**Q: Have you seen medication-related problems across your oversight panel?**

> Constantly. Medication reconciliation failures are probably our highest-frequency clinical risk. Changes happen at hospital discharge, at GP visits, at specialist appointments. By the time the information reaches us, the patient has already been on the wrong dose for days. And our documentation doesn't help --- the notes say 'medications reviewed, consistent with care plan.' That tells me nothing. What medications? What was the review finding? Was anything changed?
>
> This is where my history comes in. Two years ago, before CareBridge, I had to testify at a coroner's inquest. A patient at my previous agency --- Gerald, eighty-four, diabetes --- died from complications following a missed insulin dose. I had given him his insulin that day. I gave it at approximately eight-fifteen in the morning, left upper arm, BGL was six point two beforehand.

***[Probe]** What happened at the inquest?*

> The solicitor asked me what time I administered the insulin. I said about eight-fifteen. He said, 'Show me.' I looked at my notes and all they said was 'morning visit.' That could mean seven AM or eleven AM. He asked the blood glucose level. My notes said 'BGL checked, within normal limits.' Not a number. A summary. He asked the injection site. Not recorded.
>
> I was telling the truth. I provided competent care. But I couldn't prove it. The documentation system I was using at the time didn't require --- or even support --- that level of granularity. The coroner found no neglect, but I will never forget sitting in that room unable to answer basic questions about care I know I delivered.

***[Emotional note]** Priya's voice was absolutely steady but she was gripping the edge of the table. This experience clearly defined her professional identity.*

> I carry a notebook now. Every visit, I write: the time, the reading, the exact words the patient uses. Then I go home and type it all into the EMR. It takes me twice as long to document as any other nurse. But I will never sit in that room again unable to answer a simple question about what I did and when.
>
> I tell David: if you can't point to a timestamp and a number in your notes, then as far as the law is concerned, you didn't do it. He thinks I'm being dramatic. I think I'm keeping him out of a coroner's court.

**Block 3: Communication & Escalation**

**Q: How do you decide when something is an emergency vs. a watch-and-wait situation?**

> That's the hardest part of my job. And it's the part I can't delegate. When David flagged Mrs. Patterson's bruise, it sat in my review queue for three days. Three days. If that bruise was from a fall, three days is too long. But if I reviewed every flag in real time, I'd never see my own patients. The system puts everything in the same queue with the same priority. A missed medication and a potential fall look identical in the interface.

**Block 4: Tools & Workarounds**

**Q: You mentioned reviewing junior nurses' care plans. What do you find?**

> About thirty percent of care plans I review need material corrections. Wrong intervention frequencies, goals that conflict with the patient's actual condition, missing safety considerations. The same mistakes repeat across different nurses because there's no decision support. If the system said 'Based on this assessment, here are recommended goals and interventions, adjusted for this patient's medication contraindications' --- I'd spend my time refining good drafts instead of rewriting bad ones from scratch.
>
> I don't need a system that replaces clinical judgment. I need a system that does the pattern recognition I can't do at scale, and then puts the pattern in front of me so I can make the judgment call.

**Block 5: Willingness to Prioritize**

**Q: How much time per week do you spend on oversight and review?**

> Twelve to fifteen hours. Three to four on Sunday reviews, four to five reviewing care plans, three to four on documentation audits and junior mentoring. That's on top of my own patient visits. I'm not complaining --- it's my job. But I'm doing pattern recognition that a machine should do, and I'm doing documentation review that a structured input system would prevent.

**Q: If a system could do the pattern recognition for your fifty patients, what would change?**

> I'd get my Sundays back. And more importantly, I'd catch things I currently miss. I estimate I catch sixty percent of the meaningful trends in my Sunday reviews. Sixty percent is not good enough. Margaret was in the forty percent.

**Wrap-Up**

**Q: Who else should I talk to?**

> Angela Morrison --- she's our coordinator. She holds the whole operational picture. And talk to the patients who refuse things. The ones who don't wear the pendant, who don't take their pills, who don't tell us what's really going on. That's where the real complexity lives.

**Part B: Filled Note Template**

  ------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  **Participant ID**        HCN-003

  **Persona**               HCN

  **Date**                  2026-03-27

  **Duration (min)**        48

  **Interviewer(s)**        PM Lead

  **KEY JOBS**              Clinical oversight for 50 patients across 5 nurses. Identify deterioration patterns before crises. Review and correct care plans. Mentor junior nurses. Audit documentation for compliance. Manage her own caseload of 8 patients.

  **CURRENT SOLUTION**      Agency EMR (no trend views, no longitudinal dashboard). Personal spreadsheet updated Sunday evenings (3-4 hrs). Personal notebook for timestamped clinical details (doubling documentation time). Manual care plan review of all junior nurses' work.

  **BIGGEST PAIN**\         "Margaret's hospitalisation was preventable. Every single data point was in the system. But nobody connected them because nobody has time to read eight weeks of visit notes side by side."\
  (verbatim)                \
                            "The solicitor asked me what time I gave Gerald his insulin. I said about 8:15. He said, 'Show me.' All my notes said was 'morning visit.'"\
                            \
                            "I spend my Sunday evenings scrolling through visit notes for fifty patients looking for the ones about to fall off a cliff. I catch some of them. I miss others. That's not a system --- that's me being stubborn on my own time."

  **DESIRED OUTCOME**\      "I don't need a system that replaces clinical judgment. I need a system that does the pattern recognition I can't do at scale, and then puts the pattern in front of me so I can make the judgment call."
  (verbatim)                

  **WILLINGNESS**           12-15 hrs/week on oversight. Sunday reviews are unpaid personal time. Would immediately adopt any system that surfaces longitudinal patient trends. Key criterion: clinical credibility --- must show real data patterns, not simplistic alerts.

  **EMOTIONAL INTENSITY**   Coroner's inquest testimony: gripping table edge, steady voice. Defining professional experience. Margaret's hospitalisation: hardened voice, compressed frustration. Sunday reviews: quiet determination mixed with resentment that management rejected her proposal.

  **ESCALATION BEHAVIOR**   Owns the escalation queue for 5 nurses. Reviews flags on Sundays (3-day delay). Cannot triage in real time without abandoning own patients. System treats all flags with equal priority --- missed med and potential fall look identical. Relies on clinical intuition built over 18 years.

  **SURPRISE FINDING**      AUDIT TRAUMA: Priya's coroner's inquest experience fundamentally shaped her documentation practice. She now double-documents (notebook + EMR) at significant personal time cost. This experience justifies structured, timestamped, field-specific documentation --- not for efficiency, but for legal protection.

  **TOOL MENTIONS**         Agency EMR (no trend views). Personal spreadsheet. Personal notebook. Sunday review process.

  **REFERRAL**              Angela Morrison (coordinator, operational view). Patients who refuse things --- 'that's where the real complexity lives.'

  **FOLLOW-UP ACTIONS**     [ ] Interview Angela Morrison (CC-001)\
                            [ ] Quantify 'missed patterns' rate across agency\
                            [ ] Investigate audit log requirements for legal defensibility\
                            [ ] Explore care plan recommendation engine to reduce 30% correction rate
  ------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
