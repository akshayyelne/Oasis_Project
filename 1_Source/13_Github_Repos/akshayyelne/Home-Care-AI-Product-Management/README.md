# Extracted from: akshayyelne/Home-Care-AI-Product-Management/README.md
# Generated: 2026-07-31T00:49:45.200Z

### Trust-Weighted Vacancy Matching for Australian Home Care

> *"Not just who's available — who does this patient trust. That's what takes me eleven phone calls."*
> — Angela Morrison, Care Coordinator, 60+ active clients



At 6:30 AM, a carer calls in sick. Somewhere in Australia, a home care coordinator puts down her coffee and starts making phone calls.

Eleven calls. Thirty to sixty minutes. One in five visits still cancelled.

The first four calls find someone available. The next seven find someone the client will actually open the door for — because no scheduling system knows who Mrs. Kim trusts. That knowledge lives on a coordinator's sticky notes, in her memory, and nowhere else.

When no replacement is found, the client sits in their chair — dressed and ready — and waits. The family finds out when nobody shows up. *"Her father had been waiting in his chair. He gets anxious when the routine changes. She was furious, and she was right to be."* — Angela, recounting the Arthur Kovacs incident.

This is not a rare edge case. It is the default outcome. Three incidents per week, at every agency, for every coordinator — that is over two hours of panic calls that produce nothing but exhaustion and a 20% cancellation rate.

The deeper problem is structural: *"If I get hit by a bus tomorrow, half the knowledge about our clients walks out the door with me. That scares me."* The coordinator is not just the scheduler. She is the institution. When she leaves, the care quality leaves with her.

**Home-Care-AI is built to solve both failures** — the daily cascade and the long-term knowledge fragility — with a single product architecture.



### The Strategic Intersection

Home-Care-AI occupies white space that no competitor has entered: **trust-weighted matching combined with coordinator-approved agentic workflow**.

| | Availability-Only Matching | Trust-Weighted Matching |
|---|---|---|
| **Fully Manual** | Spreadsheets + 11 phone calls | Coordinator memory + 11 phone calls |
| **Coordinator-Approved Agentic** |  Vacant Visit Agent | **★ Home-Care-AI** |

 matches on availability and qualifications. It does not know who Mrs. Kim will open the door for. That is why coordinators make seven calls *after*  suggests someone. Home-Care-AI is the trust layer  does not have. It does not replace the EMR. It replaces the seven calls.

### Brand Promise

> **"The right person. Every visit."**

### One-Sentence Positioning (Coordinator-Facing)

> "The only home care scheduling tool that matches replacements on who the client trusts — not just who's free — and always notifies the client before their family."

### The Two Confirmed Moats

**1. Soft Preference Profile (SPP) — Data Gravity Moat (4/5 Confirmed)**

The SPP is a structured, per-client knowledge record — familiarity thresholds, entry protocols, care preferences — built from the coordinator's institutional knowledge and deepened with every visit logged. It converts sticky-note memory into a transferable product asset.

- A new coordinator onboards from the SPP on Day 1, not after months of shadowing.
- An agency's accumulated preference history cannot be migrated to a competitor. The switching cost grows with every active week.
-  can copy the schema. They cannot copy 18 months of structured preference history.

**2. Compliance-by-Design Architecture — Regulatory Moat (4/5 Confirmed)**

Every compliance requirement — Australian Privacy Act 1988, APP 8 data sovereignty, anti-discrimination gating, 7-year immutable audit log — is a structural code constraint, not a policy document. The E-3 notification gate does not remind coordinators to call the client before the family. It makes it architecturally impossible not to.

Any new entrant needs 6–12 months of privacy counsel, DPIA completion, and architectural refactoring to reach parity. As Australian AI regulation tightens — particularly in aged care — this lead compounds. First-mover compliance is a feature, not a project.



### The Beachhead: Care Coordinators at Independent Australian Agencies

**Who:** Coordinators managing 20–200 active home care clients. Time-poor, mobile-first, operating alone or with a small team. Responsible for both care quality and compliance, with no single system that handles both.

**Their defining characteristic:** They carry the entire agency's institutional knowledge inside their heads. They are a single point of failure — for scheduling, for care continuity, and for compliance.

**Opportunity score:** 0.90/1.0 — the highest possible rating. Every coordinator has a version of the 11-call cascade. Every coordinator has an Arthur Kovacs incident. The entire problem space is unserved.

### The Moment of Truth — The 3-Tap Approval Flow

The product's core innovation is the coordinator approval card. When a carer calls in sick, the system surfaces a shortlist in under 60 seconds. The coordinator sees one card:

| Signal | What They See | Why It Matters |
|---|---|---|
| **Familiarity Fact** | "2 prior visits with Mrs. Kim" | A human fact, not an algorithmic score. The coordinator can picture it. |
| **Qualifications Confirmed** | ✓ Cert III · First Aid current | The hard gate already ran. No need to verify. |
| **Notification Preview** | "Client → Carer → Family will be notified in this order" | No surprises. The coordinator knows exactly what happens next. |

Three trust signals. One tap to confirm. The system handles the rest — carer assignment, client notification, family notification — in the right order, without a single call.

**The OMTM (One Metric That Matters):** ≥ 70% of vacancy incidents resolved with a single coordinator approval and zero outbound calls. This is the hypothesis the entire product stands on.

### The E-3 Notification Gate

The Arthur Kovacs failure case — family finding out before the client — is made structurally impossible by the E-3 gate. This is not a policy. It is a code constraint: `family_notified` cannot be set to `true` until `client_notified = true`. No coordinator override. No configuration option. Architecture as ethics.

**Coordinator benefit:** *"The client always knows before the family does. I don't have to remember to call — it happens automatically."*



Home-Care-AI operates under the **Australian Privacy Act 1988 (APP)** as its primary legal framework, with HIPAA-grade security applied as the engineering design floor.

### Three-Level Agentic Control Matrix

Every AI action in the system is classified at one of three autonomy levels — set in the engineering spec and enforced by the audit harness:

| Level | Name | What It Does | Human Required? |
|---|---|---|---|
| **Level 1** | Informer | Monitoring, logging, push notifications | No |
| **Level 2** | Verifier | Flags for coordinator review before acting | Yes — gates Level 3 |
| **Level 3** | Escalator | EMS dispatch, vacancy escalation — irreversible | Mandatory HITL approval |

The coordinator's 3-Tap Approval is a Level 2 gate. No carer is assigned, no notification is sent, without explicit coordinator confirmation. The system proposes. The coordinator decides.

### HITL Escalation Protocol

When a vacancy cannot be resolved — when no suitable carer is found before the visit time — the system escalates through a defined protocol with no hanging states:

```
Vacancy unresolved
  └─ Escalate to Care Coordinator (2-min SLA)
       ├── Responds → Manual override or cancellation decision
       └── Timeout → Escalate to Clinical Lead (1-min SLA)
                ├── Responds → Override decision
                └── Timeout → Auto-escalation + log HITL_DOUBLE_TIMEOUT
                              (safety default — documented, not a bypass)
```

The system cannot be left in a hanging state. Every path resolves.

### Immutable Audit Architecture

Every state transition — vacancy detected, match proposed, coordinator approval, carer notified, client notified, family notified — writes an immutable `APPAuditLogEntry` to write-once AWS S3 (Object Lock, COMPLIANCE mode). The log is hash-chained: each entry carries the SHA-256 of all prior entries. Tamper detection is structural.

**No application role may delete or update a log entry.** A role with UPDATE access to the audit log is a CRITICAL compliance finding.

**7-year minimum retention.** Every replacement decision is permanently auditable — coordinator ID, match rationale, notification delivery receipts, timestamp chain.

### Compliance Gate Record

The compliance audit (Artifact 16) identified four CRITICAL findings before any code was written. All four were resolved before Stage 4 began. Current status: **zero open CRITICAL findings**. The product entered engineering with a clean compliance gate.



The build sequence is dependency-ordered, not feature-ranked. The audit log instruments every feature from its first test invocation. The SPP is the foundation everything else reads from. No wave begins until its dependency is stable.

### v1 — Beachhead Product (Waves 0–5)

| Wave | Deliverable | Strategic Purpose |
|---|---|---|
| **Wave 0** | Immutable Audit Log infrastructure | Every feature writes to the log from its first line. The compliance moat is built before the product is. |
| **Wave 1** | Soft Preference Profile (SPP) data model + coordinator capture flow | The foundation of the trust-matching moat. The SPP must be populated before the match engine has anything to read. |
| **Wave 2** | Smart Match Engine — availability, qualifications, proximity, familiarity scoring | Closes the gap between "who's available" () and "who the client trusts" (Home-Care-AI). |
| **Wave 3** | E-3 Notification Gates — client SMS + family SMS (parallel build) | Makes the Arthur Kovacs failure case architecturally impossible. Highest emotional resonance for the coordinator segment. |
| **Wave 4** | 3-Tap Coordinator Approval Flow + Carer SMS Assignment + Carer Briefing | The Moment of Truth. The hypothesis validation event. If ≥ 70% 1-tap approval is confirmed here, the product's core value proposition is proven. |
| **Wave 5** | VACANCY_UNRESOLVED Escalation (Level 3 Escalator) | The safety net. Ensures no vacancy silently falls through to a missed visit. |

### v2 — Compliance-Unlocked Expansion (Post-Beachhead)

These features are strategically valuable — and blocked by specific compliance unlock conditions that must be met before a single line of v2 code is written.

| Feature | Unlock Condition | Strategic Value |
|---|---|---|
| ** Bi-Directional Integration** | AX-02 sandbox validation confirmed | Converts EMR integration from an aspiration to a switching-cost moat. Raises EMR lock-in moat score from 2/5 to 4/5. |
| **Carer App In-App Push Notifications** | APP 8 confirmation + Carer App build complete | Highest margin impact — replaces SMS costs at scale. First v2 priority once unlocked. |
| **WhatsApp Notifications** | APP 8 legal review complete for Meta cross-border disclosure | High ease once legal cleared. Channel Wrapper already designed in v1. |
| **LLM-Personalised Notifications** | Prompt injection NFRs implemented and red-team tested | Moves briefing from template to genuine personalisation. Unlocks the "feels personal, not templated" coordinator experience. |

### The ACCPA Growth Lever

The Australian Community Care Providers Association (ACCPA) represents the distribution network for the entire beachhead segment. The right moment to initiate this relationship is before the product launches — when the ask is a seat at the table, not an endorsement of a product they have never seen.

Angela Morrison (CC-001) is the entry path. The goal: advisory board seat or ACCPA Innovation Awards submission with first real-world data by Q3 2026. ACCPA endorsement is the network effect moat pathway — the point at which peer referral scales beyond the beachhead without incremental sales effort.



This repository contains the complete product and strategy evidence base for Home-Care-AI — 26 artifacts across three sequential plugins, all 9 inter-plugin handshakes verified, zero open CRITICAL compliance findings.

| Plugin | Purpose | Status |
|---|---|---|
| **Discovery** (Artifacts 1–11) | Customer evidence, market sizing, ethics mapping, agentic safety design | Complete |
| **Strategy** (Artifacts 12–20) | Canvas, SWOT, value proposition, compliance audit, partnership map, positioning, unit economics | Complete |
| **Execution** (Artifacts 21–26) | PRD, prioritization, logic spec, user stories, synthetic data, audit grader | Complete — ready for ECC build |

Current harness audit score: **78 / 120 (65%)** — deferred items are deliberate pre-build deferrals, not gaps. See [audits/SCORES.md](audits/SCORES.md).


*Every claim in this document traces to a named first-party interview. Every moat is evidence-gated. Every compliance assertion is backed by a completed DPIA. This is not a pitch deck — it is a product built on evidence.*
