# Artifact 2b — Family Caregiver (FC) Consolidated Interview Summary

**Project:** Home-Care-AI
**Stage:** Discovery → Stage 1 (Customer Research)
**Artifact:** 2b
**Persona Group:** Family Caregiver (FC)
**Source Interviews:** FC-001 (Sarah Chen), FC-002 (James Okafor), FC-003 (Rachel Torres)
**Synthesis Date:** 2026-03-30
**Interviewer:** PM Lead
**Next Step:** Feed into `competitive-gap-analysis` alongside Artifacts 2a, 2c, 2d

---

## Header

**Dates:** FC-001: 2026-03-28 (45 min) | FC-002: 2026-03-29 (38 min) | FC-003: 2026-03-30 (35 min)

**Participants:**
- Sarah Chen — Family Caregiver (FC-001). Full-time marketing manager, CBD. Mother Lin, 78, lives alone 40 min away. Primary and sole local caregiver. Brother David interstate (financial only).
- James Okafor — Family Caregiver (FC-002). IT consultant, works from home. Father Emmanuel, 81, early-stage dementia, Type 2 diabetes, hypertension, 7 medications. Lives in attached granny flat. Wife Adama shares care burden.
- Rachel Torres — Family Caregiver (FC-003). Part-time teacher. Mother Gloria, 74, COPD, arthritis, anxiety, 9 medications. Lives alone 20 min away. Brother in London, sister in Auckland — Rachel is sole local caregiver.

**Background:**
All three are adult children managing care for an elderly parent living independently, while working and maintaining their own family responsibilities. Sarah and Rachel are sole local caregivers with distant or absent siblings. James is closest in proximity (granny flat) but carries the highest medication management complexity (double-dose ER visit). All three have tried and abandoned at least one commercial monitoring technology. All three live in a state of chronic low-level anxiety between check-ins, punctuated by acute crisis moments (fall, ER visit, false alarm drive). The caregiving burden falls on them not because formal care is absent, but because the formal care system does not communicate across the gaps between visits.

---

## Current Solution

| Caregiver | Primary Tools | Monthly Spend | What Failed |
|---|---|---|---|
| Sarah (FC-001) | 2x daily phone calls, paper med chart, WhatsApp group, Google Doc for appointments, energy company app as activity proxy | $85/mo (unused pendant) | Wristband step tracker (data without context created anxiety + nurse friction) |
| James (FC-002) | Pill organiser, kitchen whiteboard, secret baby monitor, wife's lunch check, iPhone calendar, handwritten geriatrician notes | Not quantified | 2 medication reminder apps (patronising design, rejected by father) |
| Rachel (FC-003) | Visits every other day, colour-coded Excel med chart (45 min/week to print), medical alert necklace ($65/mo), pharmacy auto-refill, physical records binder | $95/mo (necklace + supplies) | Fall detection watch (false alarms, 3 weeks); medical alert necklace (dead battery during fall) |

---

## What They Like About Current Solution

| Job to Be Done | What Works | Importance | Satisfaction |
|---|---|---|---|
| Daily wellness check | Phone calls (Sarah, Rachel) | High | Low — binary pass/fail, no context |
| Medication structure | Pill organiser (all three) | High | Medium — confirms organisation, not adherence |
| Pharmacy reliability | Auto-refill (Rachel) | Medium | Medium — confirms dispensed, not swallowed |
| GP appointment tracking | Google Doc (Sarah), handwritten notes (James) | Medium | Low — manual, not integrated |

---

## Problems With Current Solution

### Problem 1 — The Gap Between Visits: Not Knowing What Happened

**Job:** Know in near-real-time when something changes with the parent's health or safety between caregiver visits and formal care visits.
**Desired outcome:** A reliable signal that distinguishes "nothing happened" from "something changed" — without creating constant surveillance anxiety.
**Importance:** Critical — this is the defining emotional pain of the FC persona. The "not knowing" wakes them up at night.
**Satisfaction:** Very low — no reliable mechanism across all three caregivers.

> "I didn't know my mum was on the floor for five hours. **Five hours. I was asleep in my bed forty minutes away and she was just lying there.**"
> — Sarah, FC-001

> "The ER visit from the double dose probably cost the healthcare system five thousand dollars. **One tool that prevents that pays for itself in a single incident.**"
> — James, FC-002

> "**Every time my phone rings after nine PM, my heart stops.** Every single time. That's not a way to live."
> — Rachel, FC-003

*Synthesis: The gap problem has different acute manifestations across the three interviews — Sarah's 5-hour floor wait, James's ER visit from a double-dose, Rachel's wrist fracture with a dead alert necklace — but the underlying structure is identical. The formal care system (nurse visits 1–3x/week, GP quarterly) creates multi-day windows of no professional oversight. Caregivers fill the gap with phone calls, energy bill monitoring, and anxiety. None of these are reliable signals. All three caregivers have experienced at least one event where the gap failed them.*

---

### Problem 2 — False Alarms Erode Trust and Exhaust Caregivers

**Job:** Respond appropriately to health signals — escalate real emergencies, ignore non-events.
**Desired outcome:** A contextualised signal, not raw data — something that tells the caregiver whether a change is clinically significant.
**Importance:** High — false alarms are the primary reason monitoring tools get abandoned.
**Satisfaction:** Very low — every monitoring tool tried by FC cohort was abandoned primarily because of false alarms or data-without-context anxiety.

> "A step count without clinical context is just a number that makes you panic. **I stopped using it.**"
> — Sarah, FC-001

> "Two medication reminder apps. Both failed. Big flashing buttons. Loud alarms. **Patronising voice messages.** My father is a retired pharmacist, not a toddler."
> — James, FC-002

> "I evaluated a fall detection watch last year — too many false alarms, **mum stopped wearing it after three weeks.**"
> — Rachel, FC-003

*Synthesis: All three caregivers have been through the false alarm cycle. The tools that create too many alerts get abandoned. The tools that create no alerts provide false reassurance. What all three want is not more data — it is a clinically interpreted verdict that tells them whether a signal is real. Sarah articulated this most precisely.*

---

### Problem 3 — Raw Data Without Clinical Context Makes Things Worse

**Job:** Use available health data to make informed decisions about when to act.
**Desired outcome:** Clinical interpretation layered on top of sensor data before it reaches the caregiver.
**Importance:** High — uninterpreted data actively degrades the caregiver-nurse relationship.
**Satisfaction:** Very low — this insight was the reason Sarah stopped using the wristband tracker.

> "**A verdict. Not a graph.** Someone telling me: 'Your mother's patterns are within her normal range this week. Nothing to worry about.' Or: 'Something changed. Maria is looking into it.' Not a step count. A verdict."
> — Sarah, FC-001

> "**I want the geriatrician to see real data, not my scribbled notes from three months of guessing.** Actual patterns. What's his blood sugar been doing? How many doses did he actually miss?"
> — James, FC-002

> "**The gap between dispensed and swallowed is where everything goes wrong.**"
> — Rachel, FC-003

*Synthesis: The FC cohort is not asking for access to raw patient data — they are asking for access to interpreted conclusions. Sarah was explicit: "a verdict, not a graph." James wants a data product he can present to a geriatrician. Rachel has identified the specific gap in the current data chain (dispensed vs. swallowed) with more clinical precision than most tools currently address. The design implication is clear: any notification to a family caregiver must be a clinical interpretation, not a raw sensor reading.*

---

### Problem 4 — Medication Adherence Is Unverifiable and Actively Gamed

**Job:** Verify that the parent is actually taking medications as prescribed.
**Desired outcome:** Confirmation of dose taken (not just dose dispensed), without invasive monitoring that damages trust or dignity.
**Importance:** Critical — non-adherence causes direct harm (James's ER visit) and undetectable deterioration.
**Satisfaction:** Very low — no tool in any caregiver's stack provides swallow-confirmation; pill gaming is present in two of three cases.

> "**She's been gaming the organiser. She moved pills from Thursday to Tuesday to make it look right** because she'd forgotten Tuesday's dose. She said she 'didn't want me to worry.'"
> — Sarah, FC-001

> "Last month he took his metformin twice. **His blood sugar crashed. We sat in emergency for six hours. All because of one extra pill.**"
> — James, FC-002

> "I have a university degree and I can barely keep track. Nine medications. Three times a day. **Two can't be taken together. One has to be taken with food, one on an empty stomach.**"
> — Rachel, FC-003

*Synthesis: Medication non-adherence presents differently across the three cases. For Sarah, the parent is deliberately gaming the organiser to preserve independence — the adherence failure is concealed. For James, the failure is accidental double-dosing caused by dementia — the adherence failure is dangerous. For Rachel, the failure is complexity — 9 medications with interaction constraints that require a university-educated caregiver to "barely keep track." What unifies all three: the pill organiser confirms preparation, not ingestion. The gap between dispensed and swallowed is the most precisely named insight in the FC cohort (Rachel, FC-003).*

---

### Problem 5 — Coordination Overhead Is a Second Job

**Job:** Coordinate between parent, nurse, GP, pharmacy, and specialists.
**Desired outcome:** One integrated view of care status — visits, medications, appointments — without maintaining 5 separate tools.
**Importance:** High — 8–12 hrs/week across all three caregivers is unsustainable alongside full-time work and family.
**Satisfaction:** Very low — all three use fragmented toolsets with no integration.

> "**It's ridiculous that I'm using the power bill to check if my mum is alive.**"
> — Sarah, FC-001

> "I bring handwritten notes to the quarterly appointment. **My best guess at what happened over three months.** By the appointment, I've lost half the details."
> — James, FC-002

> "**One place. Not five apps and a binder.** I carry a physical binder of medical records to every appointment. The binder weighs more than my handbag."
> — Rachel, FC-003

*Synthesis: The fragmentation of the FC toolkit is not a technology adoption problem — these are tech-capable people (James is an IT consultant; Sarah is a marketing manager). The fragmentation exists because no single system integrates the caregiving information flow. The emotional consequence is that caregivers become the integration layer — manually aggregating information from a nurse's WhatsApp message, a pharmacy auto-refill, a paper medication chart, and a power bill. This is unsustainable and produces inferior data for clinical decision-making.*

---

## Key Insights

### Insight 1 — "A Verdict, Not a Graph" (Sarah, FC-001)
> "A verdict. Not a graph. Someone — or something — telling me: 'Your mother's patterns are within her normal range this week. Nothing to worry about.' Or: 'Something changed. Maria is looking into it.' **That's it. Not a step count. Not a heart rate graph. A verdict from someone who knows what the numbers mean.**"
> — Sarah, FC-001

*This is the sharpest design specification from any FC interview. The information product the FC persona needs is binary and clinically validated — "normal" or "something changed, clinician is on it." The architecture implication: FC-facing notifications must be a post-triage output, not a raw sensor feed. Clinical triage (HCN) must precede family notification.*

---

### Insight 2 — The Interceptor vs. Reminder Distinction (James, FC-002)
> "**Something that catches the double dose before it happens, not after. I don't need a reminder — I need an interceptor.**"
> — James, FC-002

*James independently derived a product concept that is more precise than what most medication management tools offer. A reminder assumes the person forgot. An interceptor assumes the person already acted and is about to act again. These are different technical architectures. For dementia patients, reminders are often useless or distressing; interceptors are the correct safety model.*

---

### Insight 3 — Dignity Is a Non-Negotiable Design Constraint (James, FC-002)
> "His first medication app: 'Who designed this, someone who's never met an adult?' **He's right.** If the technology looked like a clinical tool instead of a toy, he'd actually use it."
> — James, FC-002

> "**He was a pharmacist for forty years.** He filled prescriptions for other people his whole career. Now he can't remember if he took his own pills twenty minutes ago. The look on his face when I have to ask him — it's humiliating for both of us."
> — James, FC-002

*Dignity-preserving design is not a feature — it is a prerequisite for adoption by the care recipient. Apps that feel patronising will be rejected by the very patients they are designed to help. Emmanuel will engage with a clinical interface. He will not engage with a consumer toy. This design constraint recurs in the SR cohort (Lin, Arthur) and must be treated as a hard constraint, not a preference.*

---

### Insight 4 — The False Alarm Cycle as Tool Abandonment Driver (All three)
All three caregivers abandoned at least one monitoring tool because of false alarms or data-without-context anxiety:
- Sarah: wristband step tracker (abandoned — data created nurse friction)
- James: 2 medication apps (abandoned — patronising, rejected by Emmanuel)
- Rachel: fall detection watch (abandoned — false alarms after 3 weeks)

*This is a convergent finding across the cohort. False alarm rate is the primary adoption and retention risk for any monitoring product targeting this persona. Every tool abandoned was abandoned because the signal-to-noise ratio was too low to justify the cognitive or financial cost.*

---

### Insight 5 — "The Gap Between Dispensed and Swallowed" (Rachel, FC-003)
> "The pharmacy auto-refill is my most reliable tool, but it only tells me medications were picked up, not taken. **The gap between dispensed and swallowed is where everything goes wrong.**"
> — Rachel, FC-003

*This is the most precise framing of the medication adherence problem in the entire study. The current data chain confirms: prescribed → dispensed. It does not confirm: dispensed → swallowed. This gap is where adherence fails. Rachel named it with clinical precision that most product designers miss.*

---

## Cross-Interview Pattern Summary

| Pain Theme | Sarah (FC-001) | James (FC-002) | Rachel (FC-003) | Shared? |
|---|---|---|---|---|
| Gap between visits / not knowing | 5-hr floor wait | ER visit from double-dose | Fracture with dead necklace | ✅ All three |
| False alarms destroying trust | Wristband abandoned | Apps rejected by Emmanuel | Watch abandoned (3 wks) | ✅ All three |
| Raw data without interpretation | Wristband data caused panic + nurse friction | Handwritten notes ≠ real data | Excel chart vs. actual adherence | ✅ All three |
| Medication adherence unverifiable | Lin games organiser | Emmanuel double-doses | 9 meds, 3x/day, interaction complexity | ✅ All three |
| Coordination overhead as second job | Power bill as proxy | Quarterly handwritten notes | Physical binder > handbag | ✅ All three |
| Dignity constraint | Not prominent | Explicit — patronising apps rejected | Implicit — binder embarrassment | Two of three |

---

## What They Need (Verbatim Desired Outcomes)

> "**A verdict. Not a graph.** Someone telling me: 'Your mother's patterns are within her normal range this week. Nothing to worry about.'"
> — Sarah, FC-001

> "**Something that catches the double dose before it happens, not after. I don't need a reminder — I need an interceptor.**"
> — James, FC-002

> "**One place where I can see: did she take her pills, has she moved around today, is anyone else checking on her today.** One place, not five apps and a binder."
> — Rachel, FC-003

---

## Opportunity Signals (Pre-OST)

1. **Clinically-interpreted verdict** — post-triage notification: "normal this week" or "something changed, clinician reviewing." No raw data.
2. **Double-dose interceptor** — detects that a dose was already taken and prevents re-administration before it happens (not a reminder, an interceptor).
3. **Dispensed-to-swallowed verification** — closes the gap Rachel named; confirms ingestion, not just supply.
4. **Device battery / status alerting to caregiver** — dead necklace on fall day (Rachel); should notify the caregiver, not the patient.
5. **Single coordination view** — visits scheduled, medications taken, next appointment, who's checking today — in one place.
6. **Dignity-first design language** — clinical aesthetic, not consumer toy; prerequisite for patient adoption.

---

## Action Items

| Date | Owner | Action |
|---|---|---|
| 2026-03-31 | PM Lead | Feed Artifact 2b into `competitive-gap-analysis` alongside 2a, 2c, 2d |
| 2026-03-31 | PM Lead | Investigate "interceptor" vs. "reminder" as distinct product architecture for dementia medication management |
| 2026-03-31 | PM Lead | Explore dispensed-to-swallowed verification technologies (smart pill dispensers, NFC, camera) |
| 2026-03-31 | PM Lead | Flag design rule: FC notifications must be post-triage clinical verdicts — never raw sensor data |
| 2026-03-31 | PM Lead | Flag design constraint: dignity-preserving clinical aesthetic is an adoption prerequisite, not a preference |
| 2026-03-31 | PM Lead | Quantify false alarm abandonment rate across current monitoring tools in home care market |

---

*Handshake note: The FC cohort's "verdict not a graph" insight directly informs the notification architecture in `agentic-logic-spec`. Family-facing outputs must be post-HITL, post-clinical-triage verdicts. The interceptor concept (James, FC-002) maps to a Level 2 Verifier action. The dispensed-to-swallowed gap (Rachel, FC-003) is an opportunity signal for the OST.*
