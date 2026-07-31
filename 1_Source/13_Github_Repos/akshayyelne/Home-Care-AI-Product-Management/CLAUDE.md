# Extracted from: akshayyelne/Home-Care-AI-Product-Management/CLAUDE.md
# Generated: 2026-07-31T00:49:45.199Z

**Product:** Agentic AI EMR for senior home care — fall detection, medication adherence, HIPAA-compliant.
**AI Framework:** Three-plugin system (Discovery → Strategy → Execution) operating as a sequential, handshake-linked pipeline.
**Prime Directive:** Every artifact produced by any skill traces back to a customer interview, is gated by compliance, and is validated by synthetic data before a single line of production code is written.



| Plugin | Purpose | Skills |
|---|---|---|
| **pm-product-discovery** | Understand the problem before solving it | 11 skills across 5 stages |
| **pm-product-strategy** | Define position, value, compliance, and economics | 8 skills across 5 stages |
| **pm-execution** | Translate strategy into compliant, testable code | 6 skills across 4 stages |

**The cardinal rule: plugins run in order. You cannot run Strategy without Discovery evidence. You cannot run Execution without a Strategy output. Skipping a plugin produces artifacts without grounding.**



```
DISCOVERY (Plugin 1)          STRATEGY (Plugin 2)           EXECUTION (Plugin 3)
─────────────────────         ─────────────────────         ─────────────────────
interview-script               startup-canvas                create-prd
summarize-interview            swot-analysis                 prioritization-frameworks
        │                             │                             │
competitive-gap-analysis       value-proposition              agentic-logic-spec
market-segmentation            user-journey-map               user-stories
        │                             │                             │
opportunity-solution-tree      compliance-privacy-audit       synthetic-phi-generator
brainstorm-ideas-new                  │                             │
        │                      partnership-mapping            [Claude Code / ECC]
identify-assumptions-new       positioning-statement                │
prioritize-assumptions                │                      harness-audit-grader
ethics-trust-mapping           ai-unit-economics                    │
agentic-safety-discovery              │                      VERDICT: PASS / FAIL
        │                             │                             │
brainstorm-experiments ────► feeds PRD ──────────────────► ships to production
```



### Execution Sequence

**Stage 1 — Customer Research**
1. `interview-script` — Mom Test principles; past behavior only; 80/20 listening ratio
2. `summarize-interview` — Verbatim quotes mandatory for Key Insights and Problems; no paraphrasing

**Stage 2 — Market Intelligence**
3. `competitive-gap-analysis` — Analyze 2–3 competitors across Utility / Usability / Trust friction layers; output 3–5 OST opportunity statements
4. `market-segmentation-deep-dive` — Score on Pain Severity, WTP, Competitor Neglect; show math; Right to Win justification per segment; identify Beachhead Market

**Stage 3 — Opportunity Mapping**
5. `opportunity-solution-tree` — 4-level OST: Desired Outcome → Opportunities → Solutions → Experiments; score using Importance × (1 − Satisfaction); 3+ solutions per opportunity
6. `brainstorm-ideas-new` — 5 ideas per perspective (PM / Designer / Engineer); Engineer must prioritize proven cloud infrastructure; top 5 with assumptions to test

**Stage 4 — Risk & Ethics Gating**
7. `identify-assumptions-new` — 8 risk categories: Value, Usability, Viability, Feasibility, Ethics, Go-to-Market, Strategy, Team
8. `prioritize-assumptions` — Impact × Risk matrix; show ICE math; High Impact + High Risk = design experiment
9. `ethics-trust-mapping` — Green (collect by default) / Yellow (opt-in) / Red (emergency-only); Creepiness vs. Care test; flag compound combinations
10. `agentic-safety-discovery` — Level 1 (Informer) / Level 2 (Verifier) / Level 3 (Escalator); Fallback Protocol + False Positive cost for every Level 3 action

**Stage 5 — Validation Design**
11. `brainstorm-experiments-new` — XYZ hypothesis; 2–3 pretotypes; Skin-in-the-Game (willingness to pay); YODA (first-party data only)

### Discovery Hard Rules

| Rule | Constraint |
|---|---|
| **No pitching in interviews** | Never ask "would you use X?" — ask about past behavior only |
| **Verbatim or nothing** | Key Insights and Problems must use exact customer words; synthesis goes below the quote |
| **Beachhead before expansion** | Only one primary segment enters the OST. Secondary segments are logged but not acted on until Beachhead is validated. |
| **75% assumption failure rate** | Assume three-quarters of ideas will not perform as hoped. Design experiments, not roadmaps. |
| **Ethics gates features** | A Red-zone data type from `ethics-trust-mapping` cannot be implemented without DPIA + explicit consent — regardless of how valuable the feature is. |
| **Discovery loops back** | After `brainstorm-experiments-new`, the next action is a new interview cycle — not a build cycle. Build only after experiment data is collected. |



### Execution Sequence

**Stage 1 — Strategic Frame**
1. `startup-canvas` — 9-section canvas: vision, segments, value props, channels, moat, defensibility, cost structure, revenue streams, key metrics. This is the north star all downstream skills read from.
2. `swot-analysis` — SO/WO/ST/WT cross-reference. Outputs Build / Defend / Pivot / Exit signals.
   - **⚠ Re-calibration Gate:** If SWOT returns PIVOT or EXIT on any quadrant, update `startup-canvas` before proceeding to Stage 2. A PIVOT signal revises Target Segment or Value Props. An EXIT signal revises Moat or Defensibility. Do not carry a false strategic premise into the value proposition.

**Stage 2 — Customer Value Definition**
3. `value-proposition` — 6-part JTBD template: Who / Why / What Before / How / What After / Alternatives. Input: canvas segments + SWOT strengths. The "What After" outcome becomes the OKR metric in the PRD (Rule 9).
4. `user-journey-map` — One Persona × Phase deep dive per session. Never map all 4 archetypes in one pass. Output: Emotional arc, Moment of Truth, Level 1/2/3 AI Intervention Opportunities, Data Required per touchpoint.

**Stage 3 — Compliance & Risk Gate**
5. `compliance-privacy-audit` — Input: journey map data touchpoints + all AI Intervention Opportunities. Output: Compliance Risk Score, Data Inventory Map (PII/PHI), Inference Privacy Risk Table, Mitigation Requirements, Audit Log Template.
   - **⚠ Inference Risk Instruction:** For every AI Intervention Opportunity from the journey map, evaluate whether it creates an indirect health inference. Level 3 Interventions are automatically candidates for the High-Risk Compound Combination check. The journey's "Data Required" column feeds the audit's Data Inventory Map row directly.
   - **⚠ Compliance Gate:** No CRITICAL findings may remain open when entering Stage 4. An open CRITICAL finding is an illegal data flow.

**Stage 4 — Go-to-Market Architecture**
6. `partnership-mapping` — Map Healthcare Value Chain: Integration Partners [SC], Validation Partners [CV], Distribution Partners [NE]. Moat-Builder Score = Switching Cost (1–5) + Network Effect (1–5). End with "Moat Summary for Positioning" row — confirmed vs. aspirational moats.
7. `positioning-statement` — Reads partnership map first. Moat scores capped at 3/5 for any unconfirmed moat type (flagged ⚠ Unvalidated). Output: Geoffrey Moore statement, ERRC Grid, Messaging Hierarchy, evidence-gated Moat Assessment.

**Stage 5 — Business Model Validation**
8. `ai-unit-economics` — Price only after compliance costs, partnership complexity, and feature set are known. Must include Hidden System Prompt Overhead (1,550–4,000 token floor per HIPAA-compliant agent action). Output: Cost-per-User, Gross Margin Projection, Scalability Threshold, Token Efficiency Strategy, Infrastructure Scaling Roadmap.

### Strategy Hard Rules

| # | Rule | Constraint |
|---|---|---|
| 1 | **Canvas before everything** | No strategy skill runs without a completed `startup-canvas`. It is the context contract. |
| 2 | **SWOT re-calibrates the canvas** | PIVOT or EXIT signal = update canvas before Stage 2. False premise propagates to every downstream artifact. |
| 3 | **Journey validates value** | No value prop is final without one `user-journey-map` deep dive confirming emotional resonance. |
| 4 | **Compliance is a gate** | Zero CRITICAL findings before Stage 4. CRITICAL = illegal data flow. Cannot ship. |
| 5 | **Partnership feeds positioning** | `positioning-statement` cannot run before `partnership-mapping`. Moat claims without confirmed partners are capped and flagged. |
| 6 | **Price last** | `ai-unit-economics` is the final strategy skill. Running it earlier produces inaccurate margins. |
| 7 | **Compliance as a Logic Constraint** | Every High-Risk Compound Combination from the audit must appear in the PRD's Constraints section. This prevents engineers from unknowingly building illegal data flows. |
| 8 | **Moat-Gated Stories** | A user story cannot be "Ready for Dev" if it depends on a Tier 1 Partner not yet validated in `partnership-mapping`. |
| 9 | **Outcomes-to-OKRs Bridge** | The "What After" from `value-proposition` is the exact metric in the PRD's SMART OKRs. No vanity metrics. |

### Vertical Handshake — Strategy → Execution

| ID | From (Strategy) | To (Execution) | What Must Transfer |
|---|---|---|---|
| **HS-STRAT-01** | `user-journey-map` | `create-prd` | Moment of Truth + all Level 3 AI Interventions → Priority 1 features in PRD §7.2. A Level 3 intervention absent from the PRD breaks the safety chain: no spec → no logic gate → no audit → ships unvalidated. |
| **HS-STRAT-02** | `compliance-privacy-audit` | `agentic-logic-spec` | Mitigation Requirements → Non-Functional Requirements (NFRs) in the Logic Spec. Each NFR maps to: (a) a named threshold constant or state gate, and (b) a specific `HIPAAAuditLogEntry` field. High-Risk Compound Combinations become explicit IF-THEN guards in pseudocode. |
| **HS-STRAT-03** | `ai-unit-economics` | `agentic-logic-spec` | Max Token Budget per Agentic Action → model selection. If budget cannot support a large model at scale, the Logic Spec specifies SLM (Claude Haiku) for routine actions. Large model (Claude Sonnet) is reserved for Level 3 Escalator decisions only. |



### Execution Sequence

**Stage A — The Definition (Intent)**
1. `create-prd` — 8-section PRD. Input: HS-STRAT-01 journey artifacts + HS-STRAT-02 compliance NFRs + "What After" OKR metric from value-proposition. This is the Source of Truth — if PRD changes, restart from Stage A.
2. `prioritization-frameworks` — Apply to PRD §7 Solution section. Rank using Opportunity Score (Importance × (1−Satisfaction)) or ICE. Only ranked problems enter Stage B.

**Stage B — The Engineering Blueprint (Logic)**
3. `agentic-logic-spec` — 9-step spec: Inputs/States/Outputs → Pseudocode Gates → Threshold Constants → Mermaid Diagrams (3 paths: happy, HITL confirm/reject, HITL timeout) → Autonomy Classification → Edge Cases → HIPAA Audit Log Schema → Implementation Notes. The Mermaid timeout loop is mandatory — the system can never be left in a hanging ALERT_PENDING state.
4. `user-stories` — Each story's Confirmation (acceptance criteria) must reference specific `HIPAAAuditLogEntry` fields from the Logic Spec. Stories written before the Logic Spec are invalid inputs to ECC.

**Stage C — The Validation Environment (Data)**
5. `synthetic-phi-generator` — Input: Threshold Constants + event type registry from Logic Spec. Output: patients.json (5 fictitious patients), sensors.json (24h telemetry with discrete abnormal events + mandatory Data Drift scenario), alerts.sql (ground truth + validation query). Instruction to ECC: "Build this feature so it passes the tests in sensors.json, including the Data Drift scenarios."

**Stage D — The Build & Audit (Action)**
- Hand PRD + Logic Spec + User Stories + Synthetic Data to Claude Code (ECC).
6. `harness-audit-grader` — Two defect categories: Security Debt (8 check groups) and Requirement Drift (6 check groups). SD-01B (Audit Log Completeness) is the merge gate. Loop: Agent Fix Queue → ECC fixes → re-run grader → until OVERALL VERDICT = PASS.

### Execution Hard Rules

| Rule | Constraint |
|---|---|
| **PRD is the Source of Truth** | Every downstream artifact traces to a PRD section. PRD change = restart Stage A. |
| **Logic Spec before Stories** | Stories written without Threshold Constants produce untestable acceptance criteria. Invalid ECC input. |
| **Stories cite Audit Schema fields** | Every story's Confirmation section must name the `HIPAAAuditLogEntry` fields it requires. HIPAA compliance becomes a sprint-level criterion, not a post-launch audit. |
| **Synthetic data before build** | ECC gets test files as a success target. "Make these tests pass" > "build the feature." |
| **SD-01B is the merge gate** | No feature ships until every state transition (NORMAL → ALERT_PENDING → HITL_PENDING → ALERT_DISPATCHED → RESOLVED) writes a correctly structured, immutable log entry. A missing log_event() is a CRITICAL finding that blocks merge. |



Every handshake is a formal artifact transfer between skills. A skill that runs without its required input handshake is operating on assumptions, not evidence.

```
DISCOVERY OUTPUT              STRATEGY INPUT          HANDSHAKE ID
──────────────────────────    ──────────────────      ────────────
JTBD + pain signals      ──► startup-canvas           HS-DISC-01
Beachhead Market         ──► value-proposition        HS-DISC-02
Ethics Trust Map         ──► compliance-audit         HS-DISC-03
Agentic Control Matrix   ──► agentic-logic-spec       HS-DISC-04

STRATEGY OUTPUT               EXECUTION INPUT         HANDSHAKE ID
──────────────────────────    ──────────────────      ────────────
Moment of Truth +
Level 3 Interventions    ──► create-prd (§7.2)        HS-STRAT-01
Mitigation Requirements  ──► agentic-logic-spec NFRs  HS-STRAT-02
Max Token Budget         ──► model selection in spec  HS-STRAT-03
"What After" outcome     ──► PRD SMART OKRs           HS-STRAT-04
Moat Summary             ──► positioning-statement    HS-STRAT-05

EXECUTION OUTPUT              LOOPS BACK TO           HANDSHAKE ID
──────────────────────────    ──────────────────      ────────────
Experiment results       ──► next interview-script    HS-EXEC-01
Audit Fix Queue          ──► ECC for fixes            HS-EXEC-02
PASS verdict             ──► production deploy gate   HS-EXEC-03
```



These rules govern every artifact produced by every skill. They cannot be overridden by user request, time pressure, or scope reduction.

### HIPAA Non-Negotiables

| Law | Rule |
|---|---|
| **Minimum Necessary** | Only collect data fields that are directly required by the feature logic. If a field is not referenced in the pseudocode, it is not collected. |
| **PHI Never in Plaintext** | No PHI in logs, error traces, crash dumps, analytics payloads, or AI prompt completions. Violation = CRITICAL finding. |
| **Audit Log = State of Truth** | If a state transition happened and was not logged, it did not happen (for compliance purposes). Every NORMAL→ALERT_PENDING→HITL→DISPATCHED→RESOLVED transition produces an immutable log entry. |
| **7-Year Retention** | Audit logs use append-only storage with a minimum 7-year retention policy (HIPAA §164.530). No application role may DELETE or UPDATE a log entry. |
| **Hash-Chain Integrity** | Every `HIPAAAuditLogEntry` carries `entry_hash` (SHA-256 of all fields) and `previous_hash` (hash of prior entry). Tamper detection is structural, not procedural. |
| **Immutable Store** | Logs write to AWS CloudTrail / Azure Immutable Blob / write-once S3 — not to application database tables that permit UPDATE. |

### AI-Specific Compliance Rules

| Risk | Rule |
|---|---|
| **Prompt Injection** | User input is sanitized before concatenation into any system prompt or RAG query. AI output is scanned for PHI patterns before delivery. |
| **RAG Cross-Patient Contamination** | Vector store is namespaced per patient. `patient_id` is a mandatory metadata filter on every retrieval query. A unit test must assert Patient B's chunks cannot appear in Patient A's context. |
| **Training Data Leakage** | No real PHI used in fine-tuning datasets. Differential privacy applied during training. Model card documents training data provenance. |
| **Inference Privacy** | Any AI feature that infers a health condition from indirect signals (voice tone, gait, routine shift) is classified as HIGH/CRITICAL sensitivity and requires DPIA + explicit consent before data collection begins. |
| **Level 3 Auto-Dispatch** | No emergency dispatch action (dispatch_ems) executes without explicit HITL approval. The sole exception is double HITL timeout (RN + MD both unresponsive) — documented as safety default, not bypass, and logged as HITL_DOUBLE_TIMEOUT. |

### Trust Zone Framework

| Zone | Data Type | Collection Rule |
|---|---|---|
| 🟢 Green | Non-intrusive operational data | Collect by default; standard privacy notice sufficient |
| 🟡 Yellow | Sensitive: location patterns, medication schedules, activity baselines | Explicit opt-in required; DPIA recommended |
| 🔴 Red | Invasive: voice tone analysis, cognitive inference, compound health signals | Emergency-only trigger; DPIA mandatory; explicit informed consent; legal review before implementation |



Every AI action in the system is classified at one of three autonomy levels. This classification is set in `agentic-logic-spec` and enforced by `harness-audit-grader`.

| Level | Name | Definition | Examples | HITL Required |
|---|---|---|---|---|
| **Level 1** | Informer | Passive observation and notification. Reversible. Low stakes. | push_notification(), log_event(), sensor alert | No |
| **Level 2** | Verifier | Requires human confirmation before action. Borderline signals. | escalate_to_hitl(), flag_for_review() | Yes — gates Level 3 |
| **Level 3** | Escalator | Irreversible or high-cost action. Cannot be undone. | dispatch_ems(), revoke_access(), override_medication() | Mandatory HITL approval |

### HITL Timeout Protocol (mandatory in every Mermaid diagram)

```
escalate_to_hitl(RN, 2-min SLA)
    │
    ├── RN responds → CONFIRM or CLEAR → log and act
    │
    └── RN timeout (120s) → log HITL_TIMEOUT
            │
            └── escalate_to_hitl(MD, 1-min SLA)
                    │
                    ├── MD responds → CONFIRM or CLEAR → log and act
                    │
                    └── MD timeout (60s) → log HITL_DOUBLE_TIMEOUT
                                │
                                └── auto dispatch_ems()
                                    [safety default — not a bypass]
                                    log EMS_DISPATCHED + HITL_DOUBLE_TIMEOUT
```

**The system must never be left in a hanging ALERT_PENDING state. Every escalation path must resolve.**



This schema is produced by `agentic-logic-spec` (Step 7) and validated by `harness-audit-grader` (SD-01B). Every skill that generates code or acceptance criteria references this schema.

```typescript
interface HIPAAAuditLogEntry {
  // Identity & Traceability (all non-nullable)
  log_id:              string;   // UUID v4 — unique per entry
  timestamp:           string;   // ISO 8601 + UTC (e.g. "2026-03-24T14:32:11.847Z")
  session_id:          string;   // Groups events within one agent session
  case_id:             string;   // Groups events within one patient incident

  // Patient & User (pseudonymized — no plaintext PHI)
  patient_id:          string;   // UUID — never name or DOB
  user_id:             string;   // UUID of human actor; null if AI-initiated
  hitl_id:             string;   // UUID of assigned reviewer; null until escalated
  reviewer_role:       string;   // 'RN' | 'MD' | 'CARE_COORDINATOR' | 'SYSTEM'

  // Event Classification (all non-nullable)
  event_type:          string;   // See event type registry below
  state_before:        string;   // Agent state before transition
  state_after:         string;   // Agent state after transition
  action_taken:        string;   // Output action executed

  // AI Decision Metadata
  ai_confidence_score: number;   // Float 0.0–1.0 (non-nullable)
  model_id:            string;   // Model + version identifier
  trigger_sensor:      string;   // Which sensor triggered this event
  trigger_value:       number | string | null;
  threshold_applied:   string;   // Named constant (e.g. 'THRESHOLD_HEART_RATE_HIGH=100')

  // HITL Metadata
  hitl_decision:       string;   // 'CONFIRM_EMERGENCY' | 'FALSE_POSITIVE' | 'TIMEOUT' | null
  hitl_response_ms:    number;   // ms between escalation and response; null if timeout
  hitl_notes:          string;   // Reviewer free text; null if system-generated

  // Compliance & Integrity (all non-nullable)
  lawful_basis:        string;   // 'Treatment' | 'Operations' | 'Emergency'
  data_sensitivity:    string;   // 'PHI' | 'PII' | 'OPERATIONAL' | 'SYNTHETIC'
  entry_hash:          string;   // SHA-256 of all fields above
  previous_hash:       string;   // Hash of prior entry (hash-chain)
}
```

### Naming Convention — Australian Deployments

> **Implementation class name: `APPAuditLogEntry` (not `HIPAAAuditLogEntry`)**
>
> `HIPAAAuditLogEntry` is the field-structure design floor — it defines the required fields listed above. The type name in all production code, database schemas, and acceptance criteria must be `APPAuditLogEntry` to reflect the operative legal framework (Australian Privacy Act 1988).
>
> `harness-audit-grader` classifies any production class or table named `HIPAAAuditLogEntry` as a **MEDIUM** finding: the system would appear to claim HIPAA compliance (US law) rather than APP compliance (Australian law) — a legal misrepresentation risk for Australian regulators and auditors.
>
> **Australian deployment extension fields** — appended to every `APPAuditLogEntry` beyond the base schema above:
>
> ```typescript
> // APP-specific extensions (Australian Privacy Act 1988)
> cross_border_disclosure: boolean;  // APP 8 — was this data sent outside Australia?
> app8_basis:              string;   // 'Substantially Similar Protection' | 'Consent' | 'N/A'
> consent_record_id:       string;   // UUID of linked consent record; null if not applicable
> consent_version:         string;   // Version of consent form the subject signed
> guard_id:                string;   // Named guard that fired (e.g. 'CC-8', 'G-DS-05')
> guard_passed:            boolean;  // true = guard cleared; false = guard blocked the action
> guard_block_reason:      string;   // Human-readable block reason; null when guard_passed=true
> ```

### Event Type Registry

| event_type | state_before | state_after |
|---|---|---|
| ANOMALY_DETECTED | NORMAL | ALERT_PENDING |
| CONFIRMATION_WINDOW_STARTED | ALERT_PENDING | ALERT_PENDING |
| PATIENT_RESPONDED | ALERT_PENDING | NORMAL |
| HITL_ESCALATED | ALERT_PENDING | HITL_PENDING |
| HITL_TIMEOUT | HITL_PENDING | HITL_PENDING |
| HITL_TIER_ESCALATED | HITL_PENDING | HITL_PENDING |
| HITL_CONFIRMED | HITL_PENDING | ALERT_DISPATCHED |
| HITL_CLEARED | HITL_PENDING | NORMAL |
| EMS_DISPATCHED | ALERT_DISPATCHED | ALERT_DISPATCHED |
| INCIDENT_RESOLVED | ALERT_DISPATCHED | RESOLVED |
| HITL_DOUBLE_TIMEOUT | HITL_PENDING | ALERT_DISPATCHED |
| FALSE_ALARM_CLEARED | ALERT_PENDING | NORMAL |
| SENSOR_DEGRADED | any | any |
| LOW_QUALITY_READING | any | any |
| SENSOR_OFFLINE | any | any |
| SENSOR_RESTORED | any | any |

**Non-nullable fields:** log_id, timestamp, patient_id, event_type, state_before, state_after, action_taken, ai_confidence_score, entry_hash, previous_hash. A log entry missing any of these is a CRITICAL compliance finding.



### Plugin 1 — pm-product-discovery

| Skill | Persona | Key Output | Feeds Into |
|---|---|---|---|
| interview-script | Discovery Researcher (Mom Test) | Structured guide + note template | summarize-interview |
| summarize-interview | Discovery Synthesizer | JTBD, verbatim quotes, pain signals | competitive-gap-analysis |
| competitive-gap-analysis | Strategic Market Researcher | 3 friction layers → 5 OST opportunity statements | opportunity-solution-tree |
| market-segmentation-deep-dive | Market Strategist | Beachhead Market + Right to Win | opportunity-solution-tree |
| opportunity-solution-tree | Product Trio (Teresa Torres) | 4-level OST scored by Importance × (1−Satisfaction) | brainstorm-ideas-new |
| brainstorm-ideas-new | PM + Designer + Engineer | Top 5 ideas with assumptions | identify-assumptions-new |
| identify-assumptions-new | Risk Analyst | 8-category assumption map | prioritize-assumptions |
| prioritize-assumptions | Assumption Triage Analyst | Impact × Risk matrix + experiments | ethics-trust-mapping |
| ethics-trust-mapping | AI Ethics Specialist | Green/Yellow/Red data classification | agentic-safety-discovery |
| agentic-safety-discovery | Safety Systems Engineer | Agentic Control Matrix (L1/L2/L3) | brainstorm-experiments-new |
| brainstorm-experiments-new | Lean Startup Validator | XYZ hypotheses + pretotype designs | next interview cycle |

### Plugin 2 — pm-product-strategy

| Skill | Persona | Key Output | Feeds Into |
|---|---|---|---|
| startup-canvas | Startup Strategist | 9-section strategy + business model | all strategy skills |
| swot-analysis | Strategic Analyst | SO/WO/ST/WT → Build/Defend/Pivot/Exit | startup-canvas (re-calibration) |
| value-proposition | Product Strategist | 6-part JTBD + one-sentence value prop | user-journey-map + PRD OKRs |
| user-journey-map | UX Researcher | Emotional arc + Level 1/2/3 AI Interventions | compliance-privacy-audit |
| compliance-privacy-audit | DPO & Healthcare Compliance Lead | Risk Score + PII/PHI Map + Inference Risk Table | agentic-logic-spec NFRs |
| partnership-mapping | Strategic Alliances Manager | Ecosystem map + Moat-Builder Scores [SC][NE][CV] | positioning-statement |
| positioning-statement | Brand Strategist | Geoffrey Moore statement + evidence-gated Moat Assessment | go-to-market execution |
| ai-unit-economics | Product Finance Analyst | Cost-per-User + Scalability Threshold + Token Budget | agentic-logic-spec model selection |

### Plugin 3 — pm-execution

| Skill | Persona | Key Output | Feeds Into |
|---|---|---|---|
| create-prd | Experienced PM | 8-section PRD — Source of Truth | all execution skills |
| prioritization-frameworks | Strategy Reference | Ranked problem list (Opportunity Score / ICE / RICE) | agentic-logic-spec |
| agentic-logic-spec | Technical PM & Architect | Pseudocode + Mermaid (with timeout) + HIPAA Audit Log Schema | user-stories + ECC |
| user-stories | PM / Backlog Author | INVEST stories with Audit Schema fields in acceptance criteria | ECC build |
| synthetic-phi-generator | Data Engineer & Privacy Officer | patients.json + sensors.json (with Data Drift) + alerts.sql | ECC test target |
| harness-audit-grader | QA Lead / SDET | Pass/Fail report + Agent Fix Queue (SD-01B is merge gate) | ECC fix loop |



Applied consistently across `compliance-privacy-audit`, `harness-audit-grader`, and any risk assessment skill.

| Severity | Definition | Required Action |
|---|---|---|
| **CRITICAL** | Security breach, PHI exposure, illegal data flow, or complete feature absence | Block immediately — fix before any testing or downstream work |
| **HIGH** | Logic gate wrong, HITL bypass possible, auth gap, schema mismatch, missing NFR | Block PR — fix before code review approval |
| **MEDIUM** | Threshold value incorrect, missing edge case, non-critical feature absent | Fix before GA; document risk acceptance if deferred |
| **LOW** | Code quality, missing comment, non-blocking style deviation | Best-effort; acceptable with tech debt ticket |
| **PASS** | Requirement fully met | No action required |



The following are unconditional prohibitions. No user request, time constraint, or business justification overrides them.

1. **Never log PHI in plaintext** — not in stdout, application logs, error traces, analytics, or AI completions.
2. **Never dispatch EMS without HITL approval** — the only exception is documented double timeout (HITL_DOUBLE_TIMEOUT), which is a safety default, not a bypass.
3. **Never delete or update an audit log entry** — logs are append-only. A role that can UPDATE logs is a CRITICAL security finding.
4. **Never use real patient data for testing** — use `synthetic-phi-generator` output only.
5. **Never run positioning before partnership-mapping** — unvalidated moat claims are liabilities.
6. **Never write user stories before the agentic-logic-spec** — stories without Threshold Constants produce untestable acceptance criteria.
7. **Never mark a story Ready for Dev if it depends on an unvalidated Tier 1 Partner** — partner dependency = build risk.
8. **Never price the product before compliance costs and partnerships are confirmed** — early unit economics are fiction.
9. **Never skip the SWOT re-calibration** — a value prop built on a false strategic premise propagates the error to every downstream artifact.
10. **Never allow a RAG retrieval query without a patient_id metadata filter** — unfiltered retrieval is a cross-patient PHI contamination risk.
