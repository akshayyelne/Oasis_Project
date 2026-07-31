# DRAFT - Human Review Required

**Generated**: 2026-07-31
**Agent**: branding_engine
**Type**: linkedin
**Status**: 🔴 AWAITING HUMAN REVIEW
**Provider**: ☁️ Anthropic Claude API

**Generation Metrics**:
- Tokens: 1989
- Time: 29s
- Speed: undefined tokens/sec

---

## Original Request
```
Create a LinkedIn post about Case Study 1 - Appointment Scheduling from my
portfolio. Keep it to about 250-300 words, complete the final thought, and
tell me which source files it's drawn from.
```

---

## Generated Content

## LinkedIn Post (draft — 278 words)

**What I learned building an AI appointment scheduling system for community care**

Scheduling sounds like a solved problem. It isn't — not when care workers, nurses, and occupational therapists all need to be in different homes at different times, and no one system has a complete view of who's available.

The problem I set out to solve:

→ Overlapping and conflicting schedules across care workers, nurses, and OTs
→ Clients experiencing delays or missed appointments
→ Heavy admin overhead coordinating appointments and reminders
→ Almost no visibility into provider availability or travel optimisation

The cost of that wasn't abstract. It showed up as patient dissatisfaction, wasted resources, and reduced operational efficiency.

**How I approached it**

Rather than bolting AI onto a calendar, I started with the data flow. The architecture ingests from three sources — a CRM, a FHIR-based EHR, and historical appointment data — then moves through machine learning, analytics, and consumption layers on Azure. The design goal was end-to-end traceability, governance, and responsible AI compliance built in from Stage 1, not retrofitted.

That last point matters more than the model choice. In healthcare, a scheduling recommendation is a clinical access decision. If you can't trace why a client was matched to a provider, you can't defend it to an auditor, a family member, or a regulator.

**What the case study projects**

20–30% reduction in no-shows. Improved clinic utilisation. Better patient experience through automated reminders. Lower admin workload — tracked against a KPI dashboard covering no-show rate and average wait time.

The honest caveat: these are modelled outcomes from a portfolio build, not results from a live deployment with a measured baseline. I'd rather say that clearly than let a percentage do work it hasn't earned.

Happy to talk architecture or governance design with anyone working on care coordination.

\#HealthcareAI #ResponsibleAI #ProductManagement #Azure

---

## Source Attribution

**Directly grounded in:**

| Claim | Source |
|---|---|
| Problem statement (4 bullets), impact line, all four results, KPI dashboard fields | `[OneDrive] AI Portfolio\Case Study 1 - Appointment Scheduling\Case Details_extracted.txt#chunk0` |
| Azure architecture, three data sources (CRM, FHIR EHR, appointment history), ML/analytics/consumption layers, "end-to-end traceability, governance, and responsible AI compliance" | `[OneDrive] AI Portfolio\Case Study 1 - Appointment Scheduling\Data Flow Document_extracted.txt#chunk0` |

**Inferred / written by me, not in sources:**
- The "scheduling recommendation is a clinical access decision" argument — my framing, not in the retrieved material
- "Community care" context — plausible from the care worker / nurse / OT mix, but not stated
- The caveat that results are modelled rather than measured (see below)

---

## Limitations You Should Know About

**1. Data integrity flag — likely file duplication.** `Case Study 2 - Sentiment Analysis\Case Details_extracted.txt#chunk0` contains **identical text** to Case Study 1, with the same character count (5,676). Either the Sentiment Analysis case details were never written, or the file was copied and not updated. Worth checking before you publish anything referencing Case Study 2.

**2. The 20–30% figure is unattributed.** The Case Details chunk lists it under "Results" with no baseline, no sample size, no time period, no methodology. I labelled it as projected in the post because I can't verify it's measured. **If it *is* from a real deployment, tell me and I'll rewrite that section with much stronger language** — the hedge is currently costing you impact.

**3. Only Stage 1 of the Data Flow Document was retrieved.** Chunk 0 ends at the "Stage 1: Data Sources" heading. I have the architecture's stated intent but not the actual ML approach, model type, human-in-the-loop design, or governance controls. Retrieving later chunks would let me write something far more technically specific.

**4. No fairness/bias content retrieved for this case.** Your course notes cover this well (`2026-07-14-Course-4-Evaluations-of-AI-applications-in-Healthc.md#chunk0` on MINIMAR and deployment bias), but I found nothing connecting it to Case Study 1. Scheduling optimisation has obvious equity risk — travel-time optimisation can systematically deprioritise remote or hard-to-reach clients. If the case study addresses this, it's your strongest differentiator and it's missing from the post.

**What would strengthen this most:** remaining chunks of the Data Flow Document, plus any KPI or evaluation artifact showing where the 20–30% came from.

---

## Review Checklist
- [ ] Tone aligns with agent persona
- [ ] Content is accurate and sourced
- [ ] Branding guidelines followed
- [ ] Professional quality meets standards
- [ ] Ready to publish/post

---

*Draft generated by branding_engine via Telegram (claude)*
