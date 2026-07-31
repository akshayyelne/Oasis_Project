# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Strategy/Artifact_17_Remediation_Decision_Record.md
# Generated: 2026-07-31T00:49:45.186Z

**Project:** Home-Care-AI
**Stage:** Strategy → Stage 3 (Compliance Gate — Remediation)
**Type:** Decision Ledger — not a skill invocation; a formal record of resolved compliance blockers
**Date:** 2026-03-27
**Authority:** PM Lead + Privacy Counsel input (CRIT-01), Legal Counsel input (CRIT-03)
**Input:** Artifact 16 (Compliance Privacy Audit) — §8 Stage 4 Gate Assessment (4 CRITICAL findings OPEN)
**Feeds into:** Artifact 16 §8 (gate status update), Artifact 12 (canvas amendment), `agentic-logic-spec` NFRs (HS-STRAT-02a–d)


> **Purpose of this artifact:** Artifact 16 returned four CRITICAL findings that blocked Stage 4 entry. This record documents the product team's settled resolution decision for each finding, the rationale, and the v2 unlock conditions where applicable. Upon this record being written, Stage 4 (partnership-mapping → positioning-statement → ai-unit-economics) is formally unblocked, subject to the one pending engineering action in §05.

> **What this artifact is not:** A technical specification. Each decision here creates a named requirement that flows into `agentic-logic-spec` (via HS-STRAT-02). The spec is where the implementation detail lives — this record is where the decision and its rationale live.



| CRIT ID | Original Finding | Previous Status | New Status | Resolution Type |
|---|---|---|---|---|
| **CRIT-01** | APP 8 cross-border disclosure — WhatsApp/Meta (US) without confirmed legal basis | OPEN — blocks Stage 4 | **RESOLVED-IN-SPEC** | Architecture decision: channel replaced |
| **CRIT-02** | Prompt injection safeguard absent from any LLM-assisted feature | OPEN — blocks Stage 4 | **RESOLVED-IN-SPEC** | Scope decision: LLM excluded from v1 external content; NFRs specified |
| **CRIT-03** | P-2 gender preference in match scoring — E-1 anti-discrimination sign-off absent | OPEN — blocks Stage 4 | **RESOLVED-IN-SPEC** | Architecture decision: P-2 removed from scoring algorithm |
| **CRIT-04** | P-9 free-text field schema exclusion not confirmed in writing | OPEN — blocks Stage 4 | **RESOLVED-PENDING** | Engineering confirmation required before Sprint 1 (see §05) |

**Stage 4 gate status: ✅ UNBLOCKED** — subject to CRIT-04 engineering confirmation (§05 Action Item AX-01).



### Decision

**All v1 external notifications use an Australian-hosted SMS gateway. WhatsApp is deferred to v2 pending APP 8 legal review.**

| Recipient | v1 Channel | Provider |
|---|---|---|
| Carer (ACT-C-01 assignment, ACT-C-02 briefing) | SMS — AU-hosted gateway | MessageMedia or AWS SNS (ap-southeast-2 Sydney region) |
| Client (ACT-P-01) | SMS — AU-hosted gateway | Same gateway |
| Family (ACT-F-01) | SMS — AU-hosted gateway | Same gateway |

### Rationale

An Australian-hosted SMS gateway processes all data within the ap-southeast-2 (Sydney) region. There is no cross-border transmission to a foreign entity (Meta/WhatsApp). APP 8 is not triggered. The compliance risk is eliminated by architecture, not by legal instrument.

SMS achieves 100% reach for all three recipient types without requiring app installation from families or clients — the segment with the lowest technology adoption profile. This is a more reliable v1 channel than WhatsApp, which requires a WhatsApp account and active app for delivery.

### WhatsApp v2 Unlock Condition

WhatsApp (or any non-SMS channel routed via a foreign-hosted platform) may re-enter the architecture in v2 if both conditions are met:

1. **APP 8 legal review completed** — Privacy Counsel confirms either: (a) the provider's DPA satisfies APP 8 "substantially similar" protection, or (b) explicit carer consent is obtained that covers cross-border disclosure.
2. **Carer App infrastructure available** — proprietary push notifications via a Home-Care-AI Carer App (in-app, encrypted, domestically hosted) is the preferred v2 channel. This is a separate product build and is not in v1 scope.

### Channel Wrapper Architecture Requirement

The notification dispatch layer must be built as a **Channel Wrapper** — an abstraction that routes to any channel (SMS, push, in-app, WhatsApp) based on a configuration parameter, not hardcoded logic.

```
send_notification(recipient, message, channel_config)
    → channel_config = { v1: 'SMS_AU', v2: 'CARER_APP_PUSH' | 'WHATSAPP' }
```

Migrating carers from SMS to in-app push in v2 must be a configuration change, not a code rewrite. This requirement is to be specified as NFR in `agentic-logic-spec`.

### Canvas Amendment

Artifact 12 updated in this session:
- §4A Value Proposition (CC): "WhatsApp to carer" → "SMS (AU gateway) to carer"
- §6 Supporting Metrics: "Carer WhatsApp reply rate" → "Carer SMS reply rate"
- §8 Capabilities — What We Build: notification capability description updated
- §8 What We Partner For: Twilio/WhatsApp entry replaced with MessageMedia/AWS SNS AU

*(See §08 Canvas Amendment Record for full diff.)*



### Decision

**v1 uses template-based string interpolation for all external-facing content. No LLM generates text that is transmitted to carers, clients, or families in v1.**

### v1 Content Generation Scope

| Content | v1 Method | LLM Involved? |
|---|---|---|
| Carer assignment message (ACT-C-01) | String interpolation: `[carer_first_name], [visit_time], [client_suburb]` | No |
| Carer briefing (ACT-C-02) | Structured SPP field assembly: P-5 label + P-6 label + P-3 framing branch | No |
| Client notification (ACT-P-01) | Template with P-3-aware phrasing branch (G-DS-05) | No |
| Family notification (ACT-F-01) | Template: `[client_first_name]'s visit arranged by [coordinator_name]` | No |
| Match explanation (ACT-V-07) | Rule-based: display SPP field names that contributed to score | No |

LLM is permitted in v1 for internal-only functions (match scoring computation, SPP completeness analysis) where output is a number or a structured object — not human-readable text sent externally.

### Future-Proofing NFRs (for `agentic-logic-spec`)

When LLM-generated external content is introduced in v2, the following NFRs become mandatory:

| NFR ID | Requirement |
|---|---|
| **NFR-INJ-01** | `sanitise_coordinator_input(input: str) -> str` — wraps all user input before LLM prompt concatenation. Strips prompt delimiter characters and known injection patterns. |
| **NFR-INJ-02** | `scan_llm_output_for_phi(output: str) -> ScanResult` — regex pattern matching for names, DOBs, health terms, and address patterns before any LLM completion is displayed or transmitted. Blocks delivery if PHI detected. |
| **NFR-INJ-03** | Prompt boundary enforcement — system prompt and user input must occupy separate, non-concatenated message roles. User input must never be injected into the system prompt string. |
| **NFR-INJ-04** | Red-team injection testing required before any LLM-generated external content ships to production. |

These NFRs are to be included in `agentic-logic-spec` as a future-proofing section, clearly labelled as v2+ requirements.



### Decision

**Client gender preference (P-2) carries zero weight in the v1 matching algorithm. It is stored in the SPP and displayed to the coordinator as advisory information only.**

### Implementation Specification

```
match_score(candidate) =
    qualification_gate(candidate)         // hard gate — pass/fail
    + proximity_score(candidate)          // weighted
    + spp_familiarity_score(candidate)    // weighted (P-7 visit history, P-8 binary flag)
    + availability_score(candidate)       // weighted

// P-2 is NOT a parameter in this function.
// P-2 appears in coordinator UI as: "Client preference: Female — advisory only, not scored."
```

Named constant in `agentic-logic-spec`:
```
E1_LEGAL_SIGNOFF: bool = false  // default until legal sign-off obtained
IF E1_LEGAL_SIGNOFF == false THEN
    ASSERT P2 NOT IN scoring_weights
    DISPLAY P2 to coordinator as advisory: "Client preference (advisory — not scored)"
    LOG guard_id = 'G-CC-4', guard_passed = true
```

### Why "Advisory Display" Not "Hidden"

Hiding P-2 from the coordinator creates a different risk: the coordinator does not know a preference exists and may approve a candidate that causes client distress. Advisory display respects the client's stated preference while keeping the human (coordinator) as the decision-maker. The algorithm is neutral; the coordinator is not required to be.

### Framing Correction

This decision resolves algorithmic exposure to anti-discrimination law. It is not about correcting carer behaviour or staff bias. The risk being mitigated is that **the algorithm** — not any person — was making gender-weighted recommendations. Coordinators acting on their own judgment, informed by a stated client preference, is a materially different legal position.

### P-2 v2 Unlock Condition

P-2 may re-enter algorithmic scoring in v2 if:

1. **E-1 legal sign-off obtained** — written anti-discrimination opinion from qualified Australian employment and discrimination law counsel confirming that scoring on a care recipient's stated gender preference for their carer is permissible under the Sex Discrimination Act 1984 (Cth) and applicable state equivalents.
2. The opinion addresses both the hard-filter interpretation (exclude carers not matching preference) and the weighted-score interpretation (score-boost for matching preference). These may receive different legal treatment.



### Decision

**P-9 (free-text SPP notes) is confirmed absent from the v1 data schema. Structured Baseline Indicators (SBIs) are deferred as a Future Discovery Initiative.**

### P-9 Exclusion

Free-text fields in a care coordination context will inevitably contain: diagnoses, medication names, incident descriptions, and behavioural observations. There are no field-level constraints that can reliably contain this — coordinators will write what they need to write. This makes P-9 an uncontrolled health information risk under APP 3.3, with no proportionate benefit that cannot be achieved via structured fields.

v1 SPP schema is structured fields only: categorical dropdowns, binary flags, and numeric scales (P-1 through P-8, P-10, P-11). No free-text field exists anywhere in the schema.

### Structured Baseline Indicators — Deferred

During brainstorming, two new structured fields were proposed:
- `Baseline_Speech_Score` (Categorical: Clear / Slurred-Baseline / Aphasic-Baseline)
- `Baseline_Gait_Stability` (Scale 1–5)

These are **not** SPP preference data. They are functional health status indicators that:
- Constitute health information under APP s6, requiring explicit consent under APP 3.3
- Combined, create a compound inference profile (neurological/cognitive decline signal) that triggers the CC-1 guard from Artifact 16 §4
- Move the product from scheduling/matching into clinical monitoring — a different regulatory regime requiring separate DPIA, clinical governance, and potentially TGA (Therapeutic Goods Administration) consideration

SBIs are logged as a **Future Discovery Initiative** in the product backlog. Before they are reconsidered:
- A new interview cycle must validate clinical demand from coordinators and clinical advisors
- A separate ethics mapping and compliance audit must be run for the clinical monitoring feature category
- DPIA must be completed for the compound P-3 + P-4 + SBI profile

SBIs will not be referenced in any v1 data model, PRD, logic spec, or user story.

### Bus Factor Protocol — Removed from Scope

The "Bus Factor" protocol (formally preserving Angela's institutional knowledge as a transferable product asset) is the Agency Owner segment problem — OKR-6 in Artifact 14, flagged as directional and not YODA-sourced. It surfaces naturally in the Agency Owner value proposition and v2 roadmap. It is not a compliance remediation item and is removed from this artifact's scope.

### Pending Action — Engineering Confirmation

| Action ID | Action | Owner | Due | Gate |
|---|---|---|---|---|
| **AX-01** | Engineering lead confirms in writing: (a) `free_text_notes` field does not exist in the v1 SPP schema, and (b) no unstructured text field of any name exists in the v1 data model. | Engineer | Before Sprint 1 | CRIT-04 moves from RESOLVED-PENDING to RESOLVED-CONFIRMED |

Stage 4 (strategy work: partnership mapping, positioning, unit economics) may proceed before AX-01 is completed. AX-01 must be completed before `agentic-logic-spec` is written and before any data model is finalised.



### Gate Assessment — Updated

| Finding | Status | Blocks |
|---|---|---|
| CRIT-01 (APP 8 / WhatsApp) | ✅ RESOLVED-IN-SPEC | Nothing |
| CRIT-02 (Prompt injection) | ✅ RESOLVED-IN-SPEC | Nothing |
| CRIT-03 (P-2 / E-1 sign-off) | ✅ RESOLVED-IN-SPEC | Nothing |
| CRIT-04 (P-9 schema) | ⏳ RESOLVED-PENDING (AX-01) | Sprint 1 start only |

**Stage 4 status: ✅ AUTHORIZED**

`partnership-mapping`, `positioning-statement`, and `ai-unit-economics` may proceed.

### HIGH Findings — Acknowledged, Not Resolved

Eight HIGH findings from Artifact 16 remain open. They do not block Stage 4. They block GA. They are tracked in Artifact 16 §5 and must be resolved or formally risk-accepted before any feature ships to production.

| ID | Finding summary | Blocks |
|---|---|---|
| HIGH-01 | Consent framework for sensitive information (P-2, P-3, P-4, P-5) not specified | GA |
| HIGH-02 | Lawful basis for carer SPP disclosure (ACT-C-02) not documented | GA |
| HIGH-03 | DPIA for CC-1 compound (P-3 + P-4 + P-5) not initiated | GA |
| HIGH-04 | Google Maps API APP 8 review not confirmed | GA |
| HIGH-05 | RAG vector store isolation not architecturally specified | Any RAG build |
| HIGH-06 | Cross-session coordinator memory isolation not specified | Sprint 1 |
| HIGH-07 | CC-6 guard (match explanation in briefing) not yet in code | Sprint 1 |
| HIGH-08 | E-3 structural gate not yet in code | Sprint 1 |

HIGH-06, HIGH-07, and HIGH-08 are `agentic-logic-spec` NFRs that must be resolved before the first build sprint. HIGH-01 through HIGH-05 must be resolved before GA. Artifact 16 HS-STRAT-02 handshake table is the binding reference.



*A forward-looking record of what gates what in v2. Engineering and product may not build these features until the named condition is met.*

| Feature | V2 Unlock Condition | Owner of Sign-off |
|---|---|---|
| WhatsApp / non-AU messaging channel | APP 8 legal review completed (CRIT-01) | Privacy Counsel |
| Carer App (in-app push notifications) | APP 8 confirmation for push notification infrastructure + CRIT-01 resolved | Privacy Counsel + Engineer |
| P-2 in match scoring algorithm | E-1 anti-discrimination legal opinion obtained (CRIT-03) | Legal Counsel |
| P-9 (free-text SPP field) | DPIA completed for unstructured health data collection; v2 consent framework in place | Privacy Officer |
| Structured Baseline Indicators (SBIs) | Separate discovery cycle (new interviews + ethics map + compliance audit + DPIA) | PM Lead + Privacy Officer |
| LLM-generated external content | NFR-INJ-01 through NFR-INJ-04 implemented and red-team tested (CRIT-02) | Engineer + Security |



*Documents changes made to Artifact 12 (Startup Canvas) in this session as a direct consequence of CRIT-01 resolution.*

| Location | Previous Text | New Text | Reason |
|---|---|---|---|
| §4A Value Proposition (CC) — How row | "WhatsApp to carer, SMS to client, SMS to family" | "SMS (AU-hosted gateway) to carer, SMS to client, SMS to family" | CRIT-01: APP 8 resolved by replacing WhatsApp with AU-hosted SMS for all v1 recipients |
| §6 Supporting Metrics table | "Carer WhatsApp reply rate ≥ 70% within 15 min \| XP-4A" | "Carer SMS reply rate ≥ 70% within 15 min \| XP-4A" | Channel change — metric retained, channel label updated |
| §8 Capabilities — What We Build | "Automated notifications (WhatsApp carer, SMS client, SMS family)" | "Automated notifications (SMS gateway — AU-hosted — for all v1: carer, client, family). Channel Wrapper architecture enables v2 migration to Carer App push without code rewrite." | CRIT-01 + Channel Wrapper NFR |
| §8 What We Partner For | "SMS + WhatsApp delivery \| Twilio \| WhatsApp Business API via Twilio is the standard integration pattern." | "AU-hosted SMS gateway \| MessageMedia or AWS SNS (ap-southeast-2) \| Domestic processing — no APP 8 trigger. Twilio/WhatsApp deferred to v2 pending APP 8 legal review." | CRIT-01 partner change |


*Formal note: This artifact constitutes the product team's documented resolution of the Stage 4 compliance gate. The decisions recorded here are binding on all downstream artifacts — `agentic-logic-spec`, `user-stories`, `synthetic-phi-generator`, and `harness-audit-grader`. Any deviation from these decisions in a downstream artifact (e.g., a logic spec that includes P-2 in the scoring function, or a data model that includes a free-text SPP field) is a CRITICAL finding at `harness-audit-grader` stage — a Requirement Drift defect that blocks the merge gate.*
