# Artifact 2d — Senior Resident (SR) Consolidated Interview Summary

**Project:** Home-Care-AI
**Stage:** Discovery → Stage 1 (Customer Research)
**Artifact:** 2d
**Persona Group:** Senior Resident (SR)
**Source Interviews:** SR-001 (Lin Chen), SR-002 (Arthur Kovacs)
**Synthesis Date:** 2026-04-03
**Interviewer:** PM Lead
**Next Step:** Feed into `competitive-gap-analysis` alongside Artifacts 2a, 2b, 2c

---

## Header

**Dates:** SR-001: 2026-04-02 (40 min) | SR-002: 2026-04-03 (52 min)

**Participants:**
- Lin Chen — Senior Resident (SR-001). 78 years old. Lives alone. Widowed. Daughter Sarah (FC-001) is primary caregiver — visits twice/week. Nurse Maria visits Thursdays. Former mathematics teacher. Mentally sharp, physically cautious. Deliberately manages the information flow to her daughter and care team.
- Arthur Kovacs — Senior Resident (SR-002). 82 years old. Widowed 18 months ago (Elena). Lives alone in apartment. Son Michael visits Sundays. Nurse twice/week, care workers three times/week. Former mechanical engineer. Grief-defined daily existence. Negative prior AI monitoring experience has changed how he communicates.

**Background:**
Lin and Arthur are both widowed seniors living independently with formal home care and family oversight. Lin is relatively mobile and cognitively intact; her primary driver is preserving independence and preventing the "care home conversation." Arthur is more physically and emotionally isolated; his primary driver is not dying undiscovered, while simultaneously managing grief and maintaining personhood. Both have had falls. Both have experienced the care system as something that happens to them rather than with them. Both are more strategic about their health information than their carers and families realise.

---

## Current Solution

| Resident | Primary Tools | What Failed |
|---|---|---|
| Lin (SR-001) | Pill organiser (filled by Sarah, gamed by Lin), morning tea routine as self-proof, iPad for grandchildren/news, walking shoes (repositioned), pendant alarm (drawer) | Pendant alarm (worn 2 days, felt like "a hospital patient in my own home"); wristband app data sent to Sarah created anxiety without insight |
| Arthur (SR-002) | Emergency wall button (35 min response), pill organiser (confusion on weekends), phone on pillow, hallway light all night, only bathes on visit days | Previous AI voice wellness monitoring (falsely flagged as depressed, notified son and GP before Arthur; changed how he communicates) |

---

## What They Like About Current Solution

| Job to Be Done | What Works | Importance | Satisfaction |
|---|---|---|---|
| Human connection during visits | Maria's relationship-first approach (Lin) | Critical | High — but only with trusted carers |
| Daily structure | Morning routine as capability proof (Lin); Meals on Wheels as weekday anchor (Arthur) | High | Medium — weekends fail both |
| Emergency alert | Wall button (Arthur) | High | Low — 35 min response, outcome uncertain |
| Care access | iPad for video calls (Lin) | Medium | Medium — would use for care info if available |

---

## Problems With Current Solution

### Problem 1 — Assistive Technology Feels Like a Concession That Threatens Independence

**Job:** Stay safely in own home.
**Desired outcome:** Safety tools that don't signal incapacity or trigger the "care home conversation."
**Importance:** Critical — this is not a usability problem; it is an identity and survival problem.
**Satisfaction:** Very low — every safety tool tried by either resident has been abandoned or gamed because it felt like admitting defeat.

> "I wore it for two days. Then I caught myself in the bathroom mirror wearing this plastic thing around my neck and **I looked like a hospital patient. In my own home. In my own bathroom.** I took it off and put it in the drawer."
> — Lin, SR-001

> "Everything I do is proof that I can still live here. Every pill I take on time, every morning I make my own tea, every walk around the block. **The moment I start wearing emergency buttons and setting alarms for my medication, I've admitted something I'm not ready to admit.**"
> — Lin, SR-001

> "**I'm not afraid of dying. I'm afraid of losing my home.** Everything I do is proof I can still live here. The moment I can't prove that, they'll move me."
> — Lin, SR-001

*Synthesis: Lin articulated the core tension of the SR persona with rare clarity. The safety tools her daughter provides are experienced as evidence against her — proof that she cannot manage. Wearing the pendant is not just uncomfortable; it is a concession in the ongoing argument Lin is having with her family about whether she should stay at home. This is not irrational behaviour. It is a calculated strategy for self-preservation. Any product designed to protect Lin must be invisible to this calculation — or it will be rejected, gamed, or sabotaged.*

---

### Problem 2 — Information Asymmetry: Residents Are Excluded from Their Own Care

**Job:** Understand what the care team is doing, why, and what the plan is.
**Desired outcome:** Access to own care plan, next visit schedule, and medication changes — in accessible language.
**Importance:** High — exclusion from care decisions drives the data gaming behaviour both residents exhibit.
**Satisfaction:** Very low — neither resident has ever seen their own care plan; care decisions are communicated through family, not directly.

> "Sarah talks to Maria. Maria talks to the doctor. Then Sarah calls me and tells me what they decided. **I'm right here. Nobody asks me.** I taught mathematics for thirty-five years. I can understand my own blood pressure numbers, thank you."
> — Lin, SR-001

> "I'd like to be a participant, not a subject."
> — Lin, SR-001

> "**I don't know what my care plan says. Nobody has ever shown it to me.** I assume there's a plan because people keep showing up, but what are they looking for? What am I supposed to be doing? I'd like to know."
> — Arthur, SR-002

*Synthesis: Both Lin and Arthur are cognitively capable adults who are being managed around rather than engaged with. Lin is a former maths teacher who can interpret her own blood pressure numbers. Arthur is a former mechanical engineer. Both are excluded from care decisions that directly affect their lives. This exclusion is not inadvertent — it is the default architecture of the care system, which routes information through family caregivers and clinical teams, not through the patient. The consequence: residents who feel excluded from their own care have no reason to cooperate with monitoring. They cooperate with Maria, because Maria treats Lin as a person. They do not cooperate with the pendant, because the pendant treats Lin as a risk.*

---

### Problem 3 — Data Gaming Undermines the Entire Monitoring System

**Job (from the care system's perspective):** Accurately track health behaviours (medication adherence, activity, symptoms) to detect deterioration early.
**What actually happens:** Both residents actively manipulate the data that the care system relies on.
**Importance:** Critical — a monitoring system that produces gamed data generates false reassurance, not safety.
**Satisfaction:** Not applicable — the gaming is the coping mechanism for the identity threat described in Problem 1.

> "I sometimes... adjust it. If I realise I've missed a dose before Sarah visits, **I move the pills around so it looks right.** It's not lying — it's managing. If I tell them every little thing, they'll decide I can't manage."
> — Lin, SR-001

> "I move my walking shoes too. Maria checks things like that. If the shoes are in the same spot every week, she'll know I haven't been out. **So I move them to different places by the door. It's not much, but it buys me time.**"
> — Lin, SR-001

> "I cancelled the doctor because I didn't want them to find something that would give Sarah ammunition."
> — Lin, SR-001

> "Now when the nurse calls me for a check-in, I make sure I sound cheerful. I speak clearly. I say I'm fine even when I'm not. **Because if I sound tired again, who knows what the computer will decide about me this time.**"
> — Arthur, SR-002

*Synthesis: Data gaming by the SR persona is not confusion — it is strategic. Lin games the pill organiser (moves pills), fakes activity (repositions shoes), skips medical appointments (denies diagnosis), and pushes back on monitoring tools (pendant in drawer). Arthur "performs wellness" on phone calls after a previous AI system falsely flagged his voice as indicating depression. Both residents have learned that more data from them leads to more intervention against them. The rational response is less data. This is the deepest design challenge in the entire study: the population most in need of monitoring is also the population most motivated to defeat it.*

---

### Problem 4 — Strangers at the Door: Trust and Introduction Failures

**Job:** Receive safe, continuous care from people who know them.
**Desired outcome:** When a substitute carer is sent, they are introduced in advance and briefed on personal preferences before arrival.
**Importance:** High — Lin refused entry to an unannounced substitute; Arthur lost the therapeutic value of a care visit when a replacement "processed" him without human engagement.
**Satisfaction:** Very low — no advance introduction protocol exists; replacements are briefed minimally, if at all.

> "Once — about a month ago — a different nurse came. Maria was sick. This woman I'd never seen walked up to my door and said she was my nurse for today. **I didn't let her in.** How am I supposed to know who she is? Anyone could say that."
> — Lin, SR-001

> "**If Maria had called me the day before and said, 'Lin, I'm not feeling well. Karen is going to come instead of me. She's very nice. She knows you like tea first.'** Something human. Not a stranger appearing at my door unannounced."
> — Lin, SR-001

> "Three different people in the last two months. **Nobody briefs them about me. They come in, they do the checklist, they leave.** Lisa sits down for five minutes and asks about the cricket. The others do the job. There's a difference between being cared for and being processed."
> — Arthur, SR-002

*Synthesis: The trust failure at the door has two components: identity (Lin doesn't know if this person is who they say they are) and briefing (Arthur's replacements don't know him). Both are solvable with advance notice and a structured preference handoff. Lin's desired solution was explicit — a call from Maria the day before, with a human introduction. Arthur's desired solution was equally explicit: "they should already know: Arthur takes his coffee black, don't move the bathroom things, ask about the cricket." These are not complex technical requirements. They are relationship data that currently lives in no system.*

---

### Problem 5 — Reported Health Data Is Lost Between the Nurse and the Doctor

**Job:** Communicate symptoms or changes to the broader care team, confident that the information will reach the right people.
**Desired outcome:** Assurance that information given to the nurse will appear in the doctor's record and inform the next clinical decision.
**Importance:** High — when reported data is lost, residents stop reporting.
**Satisfaction:** Very low — Arthur reported swollen ankles; the GP mentioned it two weeks later as if it were new information.

> "I told the nurse last month that my ankles seemed more swollen than usual. She wrote it down. Two weeks later, my doctor mentioned it at the regular visit as if it was new information. **So what was the point of me saying anything? If the information I give the nurse doesn't reach the doctor, then I'm talking into a void. I might as well tell the wall.**"
> — Arthur, SR-002

> "**I told the nurse my ankles were more swollen. She wrote it down.** Two weeks later the doctor mentioned it like it was news. So what was the point of me saying anything?"
> — Arthur, SR-002

*Synthesis: Arthur's experience of having reported data ignored (in effect, if not in intent) has a documented behavioural consequence: he concluded that reporting is pointless and stopped. This is a data quality degradation loop — when the care system fails to close the loop on patient-reported information, patients stop providing it. Combined with the "performing wellness" behaviour triggered by the AI monitoring incident, Arthur is now systematically withholding two types of health signal: observed symptoms (because the system ignores them) and voice-based mood (because the system misclassified them). He is a high-risk patient who has learned that the safest strategy is maximum information concealment.*

---

## Key Insights

### Insight 1 — "I'm Not Afraid of Dying. I'm Afraid of Losing My Home." (Lin, SR-001)
> "**I'm not afraid of dying. I'm afraid of losing my home. Everything I do is proof I can still live here. The moment I can't prove that, they'll move me.**"
> — Lin, SR-001

*This is the most precise statement of the SR persona's core motivation in the entire study. Independence preservation — remaining in one's own home — is the organising principle of Lin's behaviour. Every piece of data management, every hidden symptom, every repositioned walking shoe, is in service of this one goal. Any product that is perceived as threatening this goal will be actively defeated. Any product that is perceived as serving this goal (Lin gets to stay home because it catches things early) may be accepted.*

---

### Insight 2 — "I Perform Wellness Now" (Arthur, SR-002)
> "**I perform wellness now. That's what I call it. I perform for the phone.** And the worst part is — the system was supposed to detect when something's wrong, but now I'll never let it detect anything. So it's actually made things worse. If I am depressed one day, truly depressed, they won't know, because I'll sound exactly the same as every other day. **They taught me to hide.**"
> — Arthur, SR-002

*This is the most damaging insight in the SR cohort — and possibly in the entire study. Arthur's "performing wellness" behaviour is a direct consequence of a previous AI monitoring system that misclassified his voice tone and notified his son and GP without his knowledge or consent. The intended safety mechanism degraded his data quality. He now produces a false wellness signal on every check-in call. The AI surveillance intended to detect deterioration has made deterioration undetectable. This is the blueprint for how AI monitoring goes wrong.*

---

### Insight 3 — "There's a Difference Between Being Cared For and Being Processed" (Arthur, SR-002)
> "**There's a difference between being cared for and being processed.** Lisa sits down for five minutes and asks about the cricket. The others do the job."
> — Arthur, SR-002

> "**Whatever you build, make it so the people who come to my home can look at me when they talk to me.** Give them whatever they need before they walk through my door so they don't have to spend my visit typing. Give me that half hour back as a human being, not a data point."
> — Arthur, SR-002

*Arthur's request is the SR cohort's design north star: technology should increase human presence during visits, not replace it. A pre-visit briefing system that loads all the clinical data before the nurse walks through the door enables that nurse to spend the visit looking at Arthur, not at a screen. The technology serves the relationship. It does not substitute for it.*

---

### Insight 4 — Receptive to Technology That Is Empowering, Not Surveilling (Both)

Lin and Arthur are not anti-technology. They are anti-surveillance.

> "If I could ask my iPad, 'When is Maria coming?' or 'What did the doctor change last time?' — **I'd use that.** I use the iPad for everything else. Why not this?"
> — Lin, SR-001

> "As long as it's for **Maria's work, not Sarah's anxiety.**"
> — Lin, SR-001

> "If it meant that when a new care worker comes, they already know: **Arthur takes his coffee black, don't move the bathroom things, ask about the cricket** — that would be good. That would be care."
> — Arthur, SR-002

*Both residents draw a precise line between technology that empowers them (access to own care info, enabling better visits) and technology that surveils them (voice monitoring, step count reporting to family). The design implication: patient-facing features must be framed as access and agency, not monitoring and reporting. Data that flows to the nurse to enable better clinical care is acceptable. Data that flows to the family to enable better surveillance is not.*

---

### Insight 5 — "Frank" as the Emotional Anchor (Arthur, SR-002)
> "Frank. My neighbour across the hall. He died eight months ago. His daughter found him on a Tuesday. The neighbours said they hadn't seen him since Saturday. **Three days. That's what I was thinking about on the bathroom floor.** Whether I was going to be Frank."
> — Arthur, SR-002

> "**I sleep with the phone on my pillow now. And the hallway light stays on all night. I'm not afraid of dying. I'm afraid of dying and nobody finding me for three days.**"
> — Arthur, SR-002

*"Frank" is Arthur's constant companion and the emotional anchor of his safety behaviour. He has modified his entire daily routine (phone on pillow, hallway light, bathing only on visit days) not because he fears death, but because he fears dying undiscovered. This is a precise, addressable fear. A system that provides Arthur with assurance that he will be found — not immediately, but quickly — directly addresses his core terror. The 35-minute emergency button response was not reassuring enough. He needs to know that if he cannot press the button, someone will notice.*

---

## Cross-Interview Pattern Summary

| Pain Theme | Lin (SR-001) | Arthur (SR-002) | Shared? |
|---|---|---|---|
| Independence preservation drives behaviour | Pendant in drawer, shoes repositioned, GP skipped | Falls not reported (first one), bathing scheduled, performance wellness | ✅ Both |
| Excluded from own care decisions | "Nobody asks me" | "Nobody has ever shown me my care plan" | ✅ Both |
| Data gaming / information concealment | Pill gaming, shoe repositioning, cancelled GP | Performing wellness on calls | ✅ Both |
| Trust failure with replacement carers | Refused entry to substitute nurse | "Processed" by replacements, belongings moved | ✅ Both |
| Reported data lost between nurse and GP | (Implicit — reduced reporting about symptoms) | Ankle swelling reported, mentioned 2 wks later as news | Arthur explicit, Lin implied |
| Technology distrust | Pendant worn 2 days; wristband data to Sarah caused friction | AI voice monitoring falsely flagged depression; "taught me to hide" | ✅ Both (different causes) |

---

## What They Need (Verbatim Desired Outcomes)

> "**If I could ask my iPad, 'When is Maria coming?' or 'What did the doctor change last time?' — I'd use that.** As long as it's for Maria's work, not Sarah's anxiety."
> — Lin, SR-001

> "I'd like to be a participant, not a subject."
> — Lin, SR-001

> "**Give them whatever they need before they walk through my door** so they don't have to spend my visit typing. Give me that half hour back as a human being, not a data point."
> — Arthur, SR-002

> "When a new care worker comes, they should already know: **Arthur takes his coffee black, don't move the bathroom things, ask about the cricket.**"
> — Arthur, SR-002

---

## Critical Design Constraints (Derived from SR Cohort)

These are not feature requests — they are hard constraints. Violating them will produce abandonment or active sabotage.

| Constraint | Evidence | Consequence of Violation |
|---|---|---|
| No surveillance-first framing | Lin's pendant in drawer; Arthur's AI incident | Tool abandoned or data actively gamed |
| No family-first notifications | Lin: "for Maria's work, not Sarah's anxiety" | Trust broken; information concealed |
| Clinical review before any inference-based notification | Arthur's AI depression flag sent to son + GP before Arthur | Patient performs wellness; data quality destroyed |
| Passive or ambient design — nothing worn or visible | Lin's mirror moment | Tool rejected before first use |
| Patient must be first to know, not last | Arthur: "A machine told my son I was mentally ill before it told me" | Full trust breakdown, permanent behaviour change |
| No data inference without explicit consent and clinical review | Arthur's voice tone classified without consent | Regulatory risk + patient harm |

---

## Opportunity Signals (Pre-OST)

1. **Patient-facing care information access** — iPad-based access to own care plan, next visit schedule, recent medication changes. Framed as empowerment, not monitoring.
2. **Pre-visit briefing card for carers** — structured preference profile delivered to carer before arrival: "Arthur takes his coffee black. Don't move bathroom items. Ask about the cricket." Eliminates the trust failure at the door.
3. **Absence-as-signal detection** — if no activity signals are present and no check-in has occurred by a defined hour, flag for clinical review (not family notification). Addresses Arthur's "Frank" fear without surveillance.
4. **Care worker continuity scoring** — track which carers each patient has met and build familiarity scores into the replacement matching algorithm (links to CC opportunity signal 1).
5. **Patient-reported symptom tracking** — structured pathway for residents to report observations directly (iPad) that feeds visibly into the nurse's next visit briefing and the GP's record. Closes the "talking into a void" loop.
6. **Closed-loop patient communication** — when a patient reports something, they receive confirmation that the nurse saw it and what they plan to do. Removes the "what was the point of saying anything?" experience.

---

## Action Items

| Date | Owner | Action |
|---|---|---|
| 2026-04-04 | PM Lead | Feed Artifact 2d into `competitive-gap-analysis` alongside 2a, 2b, 2c |
| 2026-04-04 | PM Lead | Document "performing wellness" as a data quality degradation risk in ethics-trust-mapping |
| 2026-04-04 | PM Lead | Flag hard constraint: AI-inferred health signals (voice, mood, behavioural) require L2 clinical review before ANY notification — family or otherwise |
| 2026-04-04 | PM Lead | Explore absence-as-signal design: no activity by 10 AM → clinical review flag (not family alert) |
| 2026-04-04 | PM Lead | Design patient-visible care plan in accessible language (Lin + Arthur both want this) |
| 2026-04-04 | PM Lead | Develop pre-visit briefing concept: preference card delivered to carer before arrival |
| 2026-04-04 | PM Lead | Investigate closed-loop symptom reporting: patient reports → nurse acknowledges → patient sees it was received |

---

*Handshake note: The SR cohort's "performing wellness" and "data gaming" findings are critical inputs to `ethics-trust-mapping` and `agentic-safety-discovery`. Arthur's AI monitoring incident is a documented case of inference privacy violation (voice tone → mental health inference → family notification without consent). This must map to a Red-zone data type in the ethics trust framework. Lin's independence-preservation strategy defines the consent architecture: any data collection that could be construed as surveillance will be actively defeated. Design for empowerment, not surveillance — or lose the patient as a data source entirely.*
