# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Discovery/interviews/Interview responses by individual/HCN-002-david-nguyen.md
# Generated: 2026-07-31T00:49:45.147Z

**Project:** Home-Care-AI  
**Stage:** Discovery → Stage 1 (Customer Research)  
**Artifact:** 2 (Synthetic Interview Data)  
**Persona:** Home Care Nurse  
**Participant ID:** HCN-002  
**Next Step:** Feed into `/summarize-interview` with other HCN interviews


*Persona: Home Care Nurse | Date: 2026-03-26 | Duration: 38 min | Interviewer: PM Lead*

*Location: Café near David's last patient visit | Setting: Face-to-face, informal*

**Part A: Narrative Transcript**

**Opening & Warm-Up**

**Q: Tell me about your role --- what does a typical week look like for you?**

> I've been doing home care for about two years now. I graduated nursing three years ago. I see ten patients a week, which is lighter than the senior nurses because I'm still building up. A typical day is four visits, driving between them, and then documentation. I probably spend an hour and a half every evening typing up notes on my phone.

**Q: You type on your phone, not a laptop?**

> Yeah, I don't want to carry a laptop around. The EMR technically works on the phone but the fields are tiny. I use a lot of abbreviations and then go back and expand them later. Sometimes I forget what the abbreviation meant. Last week I wrote 'pt c/o SOB w/ ex' and when I went back to expand it that evening I couldn't remember if the exertion was climbing stairs or getting out of the bath. Different clinical context entirely.

**Block 1: Falls**

**Q: Walk me through the last time someone you care for had a fall, or you were concerned they might.**

> Mrs. Patterson, about six weeks ago. She's seventy-four, post-hip replacement. I arrived for my Thursday visit and she had a bruise on her forearm that wasn't there on Tuesday. I asked what happened and she said she 'bumped into the door.' I checked the area and it looked more like a fall impact than a door bump. But she insisted she was fine.

***[Probe]** What did you do next?*

> I documented it and flagged it for Priya to review. But honestly, I wasn't sure if I was overreacting. Is a bruise on a forearm a fall? Or did she actually bump into a door? In the hospital, I'd ask a senior. Here, I'm on my own, standing in someone's lounge room trying to make a clinical judgment with no second opinion available.

**Q: How long did it take for Priya to see your flag?**

> Three days. She reviews notes on Sundays. By then, I'd already done another visit and the bruise was fading. If it had been a fall, three days is a long time to wait for a clinical review.

**Block 2: Medications**

**Q: Tell me about the last time there was a problem with a medication.**

> This one I don't like talking about. Last month I was documenting a medication administration for a patient who takes a liquid blood thinner. The dose was 5 millilitres. I was typing on my phone in the kitchen and I entered '5 mg' instead of '5 mL.' The pharmacy caught it during reconciliation --- nobody was hurt --- but the pharmacist called my manager and there was a whole incident report.

***[Probe]** Tell me more about that feeling. What was at stake?*

> Everything. My registration, my confidence, a patient's safety. The thing is, I knew it was mL. My brain knew it was mL. My fingers typed mg because that's the default unit on the form and I was trying to enter it quickly while standing up in someone's kitchen. If the system had said 'This medication is usually measured in millilitres --- did you mean mL?' I would have caught it instantly. But there's no check. No validation. Just a free-text field and my thumbs on a phone screen.

***[Emotional note]** David's hands were shaking slightly when he described this. He said 'it still keeps me up at night.'*

> Now I triple-check every medication entry. That adds fifteen to twenty minutes to my documentation every day. So the error didn't just cost me confidence --- it costs me time, every single day, because the system doesn't help me get it right the first time.

**Block 3: Communication & Escalation**

**Q: When something concerning happens with a patient, how does that information get to you?**

> It mostly doesn't until I arrive. I check the EMR before a visit but half the time the last note is from my own previous visit. If another nurse saw my patient, their note might not be uploaded yet. I've walked into situations where a family member says 'the nurse on Monday changed the dressing' and I have no record of it. So I'm standing there guessing what was done and what supplies were used.

**Q: Have you ever made a decision --- to escalate or not --- that you later second-guessed?**

> Mrs. Patterson's bruise. I flagged it but didn't escalate to the GP. If she'd had another fall in those three days before Priya reviewed it, that would have been on me. But if I escalate everything that might be a fall, the GPs stop taking my calls. It's a balance I haven't figured out yet. In the hospital, someone else made that call. Here, it's just me.

**Block 4: Tools & Workarounds**

**Q: Walk me through how you create a care plan.**

> It's painful. I did my first care plan for Dorothy --- she's seventy-six, post-stroke --- about two months ago. I opened the template and it was completely blank. No suggestions, no guidance, nothing. I spent ninety minutes trying to figure out: what mobility goals are appropriate for her level of function? Does her blood thinner contraindicate certain exercises? How aggressive should the rehab targets be? I submitted it and Priya sent it back with six corrections.

***[Probe]** What would have helped?*

> If the system had said: 'Based on Dorothy's assessment, here are the recommended goals and interventions for her condition profile.' Even a starting point. I'd still review everything and adjust based on clinical judgment, but at least I wouldn't be staring at a blank page wondering where to begin. I stared at that template for twenty minutes before I typed a single word.

**Block 5: Willingness to Prioritize**

**Q: How much time per week do you spend on coordination and documentation?**

> Probably ten to twelve hours. I'm slower than the senior nurses because I double-check and triple-check everything. Especially since the mg/mL thing.

**Q: If a tool solved the documentation accuracy problem, what would that look like?**

> Let me just talk. I'm standing in someone's kitchen, I've just done a wound assessment. Let me say: 'Wound on left lower leg, three centimetres by two centimetres, edges granulating, no signs of infection, redressed with Mepilex border, patient reports pain level two out of ten.' And have the system put that in the right fields. Not me typing on a phone screen with autocorrect fighting me. Let me say what happened and have the system figure out where it goes.

**Wrap-Up**

**Q: Is there anything I didn't ask about that's important?**

> Loneliness. Mine, I mean. Not the patients'. Being a home care nurse is lonely. You're making clinical decisions by yourself all day. There's no one to ask 'Does this look right to you?' I'd love to be able to ask the system, 'What did the last nurse document about this patient's wound?' instead of scrolling through three months of visit notes trying to find it.

**Q: Who else should I talk to?**

> Maria Santos --- she's the nurse I want to be in ten years. And any patient family who's dealt with a care plan they didn't understand. They receive these plans and I don't think anyone explains what the goals actually mean.

**Part B: Filled Note Template**

  ------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  **Participant ID**        HCN-002

  **Persona**               HCN

  **Date**                  2026-03-26

  **Duration (min)**        38

  **Interviewer(s)**        PM Lead

  **KEY JOBS**              Deliver safe clinical care to 10 patients. Document accurately. Write care plans (first year doing them). Build clinical confidence as a junior nurse making solo decisions. Avoid medication errors.

  **CURRENT SOLUTION**      Agency EMR (mobile, tiny fields, no validation). Phone abbreviations expanded later. Triple-checking medication entries (post-error habit). Asking Priya for care plan review (3-day delay). Voice-to-self notes that sometimes lose context.

  **BIGGEST PAIN**\         "I stared at that blank care plan template for twenty minutes before I started typing. I knew what Dorothy needed in general, but the specifics --- I just didn't have the confidence."\
  (verbatim)                \
                            "The mg/mL thing still keeps me up at night. If the system had flagged it --- 'this medication is usually measured in mL, did you mean mg?' --- I would have caught it instantly."\
                            \
                            "I'm typing notes on a phone screen in someone's kitchen while their cat sits on my lap. Of course I make mistakes."

  **DESIRED OUTCOME**\      "Let me just talk. Let me say what happened and have the system figure out where it goes."\
  (verbatim)                \
                            "If the system had said: 'Based on Dorothy's assessment, here are the recommended goals.' Even a starting point."

  **WILLINGNESS**           10-12 hrs/week on documentation (slower due to triple-checking). Would trade 15-20 min/day of triple-checking for automated validation. Key criterion: voice input that works in a patient's home. No current personal tech spend.

  **EMOTIONAL INTENSITY**   Hands shaking when describing mg/mL error. 'Still keeps me up at night.' Anxiety about making solo clinical decisions without senior support. Frustration at blank care plan template --- stared at it for 20 min. Loneliness of home care nursing surfaced unprompted.

  **ESCALATION BEHAVIOR**   Flags concerns for Priya (3-day review cycle). Doesn't escalate directly to GP --- afraid of 'crying wolf.' Mrs. Patterson bruise: flagged but didn't escalate, second-guessed for days. Balance between over-escalating and under-escalating not yet calibrated.

  **SURPRISE FINDING**      Clinical loneliness --- home care nurses make solo decisions all day with no one to consult. The 'Does this look right to you?' moment doesn't exist in home care. Also: abbreviation memory loss ('SOB w/ ex' --- stairs or bath?) as a documentation quality issue.

  **TOOL MENTIONS**         Agency EMR (mobile, crashes, no validation). Phone abbreviations. Priya's Sunday review cycle.

  **REFERRAL**              Maria Santos (senior nurse, role model). Patient families who receive care plans they don't understand.

  **FOLLOW-UP ACTIONS**     [ ] Investigate medication field validation as safety feature\
                            [ ] Quantify care plan creation time for junior vs senior nurses\
                            [ ] Explore voice-to-structured-form as documentation approach
  ------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
