# Extracted from: akshayyelne/Home-Care-AI-Product-Management/.claude/skills/Strategy/Artifact_14_Value_Proposition.md
# Generated: 2026-07-31T00:49:45.179Z

**Project:** Home-Care-AI
**Stage:** Strategy → Stage 2 (Customer Value Definition)
**Skill:** value-proposition
**Date:** 2026-03-27
**Methodology:** 6-part JTBD template (Who / Why / What Before / How / What After / Alternatives)
**Input:** Artifact 12 (Startup Canvas §4), Artifact 13 (SWOT SO cross-reference), Artifacts 2b/2c (CC/FC verbatim interviews), Artifact 5 (Desired Outcome metrics)
**Regulatory Context:** Australian Privacy Act 1988 (APP). HIPAA-grade security applied as design floor.
**Feeds into:** Artifact 15 — User Journey Map (Skill 4); PRD SMART OKRs (Execution Plugin — per CLAUDE.md Rule 9)


> **CLAUDE.md Rule 9 — Outcomes-to-OKRs Bridge:** The "What After" outcomes in §§1–2 are the exact SMART OKR metrics that will appear in the PRD. They are not aspirational. They are derived from first-party interview baselines (Angela: 11 calls / 30–60 min / 20% cancellation) and confirmed experiment thresholds (Artifact 8, Artifact 11).
>
> **CLAUDE.md Rule 3 — Journey validates value:** This value proposition is *not yet final*. One `user-journey-map` deep dive must confirm emotional resonance before the value prop is locked. Pending: Artifact 15.



*Primary segment. Full 6-part treatment. "What After" = PRD OKR inputs.*


### 1.1 Six-Part JTBD Template


**1 — Who**

Home care coordinators at independent Australian agencies (20–200 active clients). Sole operators managing everything alone (Tom Bradley, CC-002: 25 clients, 1 coordinator) through small team leads managing 3–5 staff (Angela Morrison, CC-001: 60+ clients, 12 nurses and 8 care workers). Mobile-first, time-poor, operating under constant schedule pressure. Responsible for both care quality *and* compliance — with no system that unifies both.

Defining characteristic: they carry the agency's entire institutional knowledge — which clients accept which carers, who needs briefing before a new visit, who will refuse entry — inside their heads and on sticky notes. They are a single point of failure for knowledge, not just scheduling.


**2 — Why (JTBD)**

> *"When a carer calls in sick at 6:30 AM, I need to find a qualified, trusted replacement before the visit time — so that no client is stranded, no family finds out before I do, and my morning doesn't become a two-hour phone cascade."*

Desired outcome (verbatim, Angela CC-001):
> *"If the system could detect the absence, find the best available replacement based on qualifications, proximity, and client preferences, propose it to me for approval, and then notify everyone — the replacement carer, the client, and the family — that would save me forty-five minutes per incident. Three incidents a week, that's over two hours of panicked phone calls I don't have to make."*

The job has two layers:
- **Functional:** Fill the vacancy before the visit time with someone qualified and available.
- **Emotional:** Fill it with someone the client will actually accept — not just anyone, the right person. *"Not just who's available — who does this patient trust. That's what takes me eleven phone calls. The first four calls are finding availability. The next seven are finding the right person."* (Angela, CC-001)


**3 — What Before (Current Painful Reality)**

> *"A scheduling system that's basically a glorified calendar. The EMR that the nurses hate. WhatsApp groups for everything urgent. Spreadsheets for credential tracking. And sticky notes. Half the critical knowledge about our clients is on sticky notes around my monitor."* — Angela, CC-001

| Step | Current State | Time / Cost |
|---|---|---|
| Absence detected | Coordinator receives WhatsApp or call from carer at 6:30 AM | 0 min (reactive) |
| Identify candidates | Mental scan of roster; no system filters by preference | 5–10 min |
| Make 11 calls | Sequential outbound calls to find available + qualified + proximate carers | 20–30 min |
| Trust check | Additional calls to find someone the client knows / accepts | 15–20 min extra |
| Notify replacement carer | Call or WhatsApp to confirmed carer | 5 min |
| Notify client | Sometimes. Often forgotten in the chaos. | 0–5 min |
| Notify family | Ad hoc. Often not done. Family finds out when nobody shows up. | 0 min (failure case) |
| **Total per incident** | | **30–60 min, 11 calls, 20% cancellation rate** |

The Arthur Kovacs failure case (Angela, CC-001):
> *"Her father had been waiting in his chair, dressed and ready. He gets anxious when the routine changes. She was furious, and she was right to be."*

This is not a rare edge case. It is the default outcome when no replacement is found. Every missed visit is a version of Arthur Kovacs in his chair.

Secondary pain — institutional knowledge fragility:
> *"If I get hit by a bus tomorrow, half the knowledge about our clients walks out the door with me."* — Angela, CC-001 *(said with dark humour, immediately followed by: "Actually, that scares me.")*


**4 — How (The Solution)**

**Smart Match Engine** — When a carer absence is recorded (coordinator entry or carer WhatsApp), the system:

1. **Detects the vacancy** (ACT-V-01) — identifies the open visit slot
2. **Computes a ranked shortlist** in < 30 seconds (ACT-V-02 through V-04):
   - Gate 1: Qualification match (hard binary gate — expired credentials excluded automatically)
   - Score 2: Proximity (suburb-to-suburb distance via Google Maps — no GPS tracking)
   - Score 3: SPP match score (familiarity history × preference alignment — the trust layer)
3. **Alerts coordinator** (ACT-V-05) — push notification: "Vacancy for Arthur Kovacs — 3 candidates ready"
4. **Coordinator approves in 3 taps** (ACT-A-01/02) — sees candidate card: name, qualifications badge, proximity, familiarity flag ("2 prior visits"), match score
5. **System executes** (L3 actions — all require coordinator approval first):
   - WhatsApp to replacement carer (Green data only — CC-8 compliant)
   - SMS to client ("Your visit today will be with David, who has visited you before")
   - SMS to family — **only after client is notified** (E-3 gate: Arthur Kovacs constraint enforced in code)
6. **Carer briefing sent** — entry protocol, personal sensitivities (phrased as operational guidance, not health disclosure)
7. **Audit log written** — every state transition immutable, append-only (APP-compliant)

**Soft Preference Profile (SPP)** — The knowledge that currently lives on sticky notes, structured into a transferable record:
- Gender preference (opt-in, advisory or scored pending E-1 legal opinion)
- Familiarity threshold (known carers only / briefed-acceptable / any)
- Entry protocol (ID check / introduction call / no special requirement)
- Personal sensitivities ("Do not move belongings in the lounge" — 100-char structured field)
- Continuity history (which carers have visited, how many times, last visit date)


**5 — What After (The Improved Outcome)**

*These outcomes are the SMART OKR inputs for the PRD. Source: Artifact 5 Desired Outcome metrics + Artifact 8 experiment thresholds.*

| Outcome | Metric | Baseline | Target | Measurement |
|---|---|---|---|---|
| **Time to fill** | Minutes from absence detected to replacement confirmed | 30–60 min | **< 5 min** | E1 concierge stopwatch (XP-1A) |
| **Cancellation rate** | % of vacancy incidents ending in missed visit | ~20% (Tom CC-002) | **< 2%** | E1 incident log |
| **Coordinator trust** | % approving top-ranked candidate without verification calls | 0% (no system exists) | **≥ 70%** at steady-state | XP-1B deviation log |
| **SPP completeness** | % of active clients with ≥ 3 SPP fields populated | ~0% (sticky notes only) | **≥ 80%** within 90 days | SPP database completeness score (P-10) |
| **Family notification rate** | % of confirmed replacements where family is notified | Ad hoc / near 0% | **100%** (automated, E-3 compliant) | Audit log (ACT-F-01) |
| **Institutional knowledge** | New coordinator time-to-effective | Months (shadowing) | **< 5 days** with SPP handover | Agency owner assessment at 30 days |

*In the words of the desired outcome (Artifact 5):* "Care coordinators confidently fill every vacant visit with the right person for that patient — one approval click, zero phone calls, no father sitting in a chair — while maintaining full institutional knowledge of every client's preferences, continuity history, and trust relationships."


**6 — Alternatives**

| Alternative | What It Does | Why It Falls Short |
|---|---|---|
| **Manual phone calls (status quo)** | Coordinator calls roster manually | 11 calls, 30–60 min, 20% cancellation, zero trust-matching, zero notification automation |
| **AlayaCare Vacant Visit Agent** | Automated matching on availability + qualifications | No trust layer — matches who's available, not who the patient accepts. Coordinator still calls to verify the soft stuff. |
| **HCP / Carelink+** | Rostering, compliance, NDIS pricing | No matching logic at all — coordinators use it as a roster viewer, then call manually |
| **Spreadsheet + coordinator memory** | Coordinator knows the soft stuff — but it's locked in one person | Non-transferable. Doesn't scale. Doesn't notify anyone. One coordinator departure = full knowledge reset. |
| **Do nothing** | 20% cancellation rate | Arthur Kovacs in his chair. |


### 1.2 Value Proposition Statement

**One-sentence (Geoffrey Moore format):**

> For home care coordinators who lose 30–60 minutes and 1 in 5 visits to manual phone cascades, **Home-Care-AI** is a smart replacement matching platform that fills every vacant visit in under 5 minutes — unlike AlayaCare's vacancy agent, it matches on who the client *trusts*, not just who's available, and automatically notifies the client before their family.


### 1.3 Reusable Statements

**Marketing (awareness — problem-led):**
> *"Every time a carer calls in sick, a care coordinator makes eleven phone calls. One in five visits still gets cancelled. The client waits. The family finds out when nobody shows up. There's a better way."*

**Sales (agency owner — outcome-led):**
> *"Home-Care-AI fills your agency's vacant visits in under 5 minutes — matching on who the client trusts, not just who's available. Your coordinators stop the morning phone cascade. Your clients stop sitting in chairs waiting for someone who isn't coming."*

**Onboarding (coordinator — reassurance):**
> *"The system will never send a carer to a client without your approval. You see the shortlist, you make the call. We just save you the eleven phone calls it took to get there."*

**Compliance / trust (agency owner — risk-led):**
> *"Every replacement decision is logged, auditable, and privacy-compliant. Your coordinator approves. The system records. When the auditor asks who was sent to Mrs. Kim and why — you have an answer."*



*Secondary buyer. The coordinator is the champion; the agency owner is the budget approver and the beneficiary of the institutional knowledge moat.*


### 2.1 Six-Part JTBD Template

**1 — Who**

Owners and operations managers of independent Australian home care agencies (20–200 clients). Often the founder. Personally liable for care quality, compliance, and regulatory obligations under the Aged Care Quality Standards. Manages 1–3 coordinators. Frequently carries residual client relationship knowledge themselves — a second single point of failure. Not necessarily technology-native.


**2 — Why (JTBD)**

> *"When my key coordinator leaves, help me ensure the next person can deliver the same quality care to my clients from day 1 — so that my clients don't experience a care disruption and my agency doesn't lose the relationships I've spent years building."*

Secondary job: compliance anxiety.
> *"I know there are care plans overdue for review. I know there are documentation gaps. I can feel where the holes are but I can't quantify them."* — Angela, CC-001 (speaking on behalf of her agency owner's exposure, not just her own)


**3 — What Before**

| Pain | Current State |
|---|---|
| Knowledge transfer | New coordinator shadows for 2–3 months. Angela's sticky notes walk out the door with Angela. |
| Replacement quality | New coordinator makes uninformed replacement decisions — doesn't know Mrs. Kim only accepts female carers, doesn't know Arthur will refuse entry to a stranger. Client complaints follow. |
| Compliance visibility | No live dashboard. Agency owner discovers compliance gaps when the auditor finds them first. "Vague anxiety, no list." (Angela, CC-001) |
| Family communication | Ad hoc. Agency owner personally manages escalated complaints from families who found out about a missed visit when nobody showed up. |
| Knowledge moat | Zero. All institutional knowledge is a person dependency — vulnerable to departure, illness, and the proverbial bus. |


**4 — How**

- **SPP as institutional asset:** Every client's preferences, care protocols, and carer familiarity history live in the system, not in one person's head. A new coordinator can read Mrs. Kim's SPP and make the same quality replacement decision Angela would have made.
- **Continuity intelligence:** Rolling 30-day carer consistency score per client. Agency owner sees where continuity is strong and where it's fragile — before a client complaint surfaces it.
- **Compliance dashboard (v1.1):** Angela's exact spec: *"Here are the seventeen things that are out of compliance. Here are the five that are critical."* Live prioritised list: overdue care plan reviews, expiring credentials, visit documentation gaps. One-tap remediation path.
- **Coordinator succession:** New coordinator onboards using the SPP as a structured briefing document. Days to effective, not months.


**5 — What After**

| Outcome | Metric | Baseline | Target |
|---|---|---|---|
| **Knowledge survivability** | Time for new coordinator to reach decision quality parity | 2–3 months shadowing | **< 5 days** with SPP handover |
| **Client retention through staff turnover** | % of clients lost within 90 days of coordinator departure | Unknown (not tracked) | **0% attributable to knowledge gap** |
| **Compliance visibility** | % of compliance items identified before audit | ~0% (discovered reactively) | **100% of flagged items visible in advance** |
| **Agency owner escalations** | Family complaint calls handled personally by owner | Frequent (ad hoc) | **Near 0** (automated E-3 notifications remove the trigger) |


**6 — Alternatives**

| Alternative | Gap |
|---|---|
| Shared Google Docs | No preference-weighted matching. No automation. Just a document. |
| AlayaCare custom fields | Can store some preferences — but no matching algorithm uses them. Coordinator still calls. |
| Staff shadowing / handover documents | 2–3 months, coordinator-dependent quality. Doesn't survive if departing coordinator is disengaged. |
| Do nothing | One coordinator departure = knowledge crisis. Status quo for most independent agencies. |


### 2.2 Value Proposition Statement

> For home care agency owners whose institutional care knowledge leaves with their coordinator, **Home-Care-AI** is a preference intelligence system that makes every client's history accessible to any coordinator from day 1 — unlike a shared document or an EMR custom field, it actively drives better replacement decisions, not just stores information.


### 2.3 Reusable Statements

**Sales (to agency owner after E1 demo):**
> *"When Angela leaves — and at some point every coordinator does — the next person will have her notes, her knowledge, and her matching logic on day 1. Not after months of shadowing. Day 1."*

**Compliance framing:**
> *"Before your next audit, you'll see exactly what's overdue. Not what you hope is overdue — what is overdue. The auditor won't find something you haven't already seen."*



*Future segment — preview only. Not in v1 scope. Unlocks after CC beachhead is validated and E-3 notification gate is live.*


**1 — Who:** Adult children and family members of home care clients. Often interstate or overseas. Responsible for their parent's wellbeing but dependent on the agency for day-to-day information.

**2 — Why:** *"When my mother's regular carer cancels, I need to know she's safe and cared for — before I have to call the agency in a panic and before she calls me upset."*

**3 — What Before:** No notification system. Rachel Chen (FC-001) finds out when her mother calls. James Osei (FC-002) calls the agency every week. Both discovered missed visits when nobody showed up — not when the coordinator knew.

**4 — How:** Automated SMS notification after coordinator has confirmed replacement AND client has been notified (E-3 gate enforced in code). Message: "Your mother's visit today will be covered by David Kim, who has visited her before. Arranged by [Agency]."

**5 — What After:** Family informed within minutes of confirmed replacement, not hours after the fact. Zero panic calls. One less reason to call the agency. Trust in the agency's communication reliability.

**6 — Alternatives:** Calling the agency. Being told by the client. Finding out when nobody shows up.

**Statement:** *"For families of home care clients who spend their days worrying about whether Mum's carer showed up, Home-Care-AI sends one message when a replacement is confirmed — before Mum calls you and before you call us."*



*Future segment — preview only. Not in v1 scope. Unlocks after SPP and continuity history data is live and validated.*


**1 — Who:** Home care nurses and case managers conducting care reviews, clinical assessments, and quality audits across multiple clients.

**2 — Why:** *"When I review a client's care plan, I need to know whether the right carers are actually visiting — so I can focus my clinical review on what matters, not on chasing coordinator records."*

**3 — What Before:** Review care plan. Open EMR (slow, nurses hate it — Angela CC-001). Call coordinator: "Who's been visiting Mrs. Kim?" Hope coordinator has time to check. Spend 10 minutes on admin before any clinical review begins.

**4 — How:** Continuity score + SPP match history shows which carers visited, how many times, whether preference-matched. Compliance dashboard shows overdue care plan reviews as a flagged item. Pre-visit intelligence packet in one screen.

**5 — What After:** Clinical review time spent on care quality, not on chasing scheduling records. Continuity gaps surfaced automatically. Coordinator and nurse share the same view of care delivery quality.

**6 — Alternatives:** Asking the coordinator. Checking the EMR (incomplete, slow). Clinical intuition.

**Statement:** *"For home care nurses who spend the first ten minutes of every care review figuring out who's actually been visiting, Home-Care-AI surfaces continuity quality before you open the care plan."*



*Blue Ocean Strategy format. Rates each competitor on the dimensions that matter to a care coordinator making a replacement decision.*

| Factor | Manual Calls | AlayaCare Vacant Visit | Spreadsheet + Memory | **Home-Care-AI** |
|---|---|---|---|---|
| Time to fill | ❌ Low (30–60 min) | ✅ High (automated) | ❌ Low (30–60 min) | ✅ **High (< 5 min)** |
| Trust / preference matching | ✅ High (coordinator knows) | ❌ None | ✅ High (but in one head) | ✅ **High (SPP-driven, transferable)** |
| Institutional knowledge capture | ❌ None | 🟡 Partial (structured fields, no matching) | ❌ Fragile (person-dependent) | ✅ **High (SPP — structured, matched, transferable)** |
| Automated carer notification | ❌ Manual call | 🟡 Partial | ❌ None | ✅ **WhatsApp + receipt confirmation** |
| Client notification (E-3) | ❌ Often missed | ❌ None | ❌ None | ✅ **Automated, E-3 gated** |
| Family notification | ❌ Ad hoc / zero | ❌ None | ❌ None | ✅ **Automated, after client** |
| Compliance visibility | ❌ None | 🟡 Partial (audit logs) | ❌ None | ✅ **Dashboard v1.1** |
| Setup complexity | ✅ Zero (no system) | ❌ High (EMR onboarding) | 🟡 Low | 🟡 **Low-medium (concierge onboarding)** |
| EMR integration required | ✅ No | 🟡 Preferred | ✅ No | ✅ **No (standalone)** |
| Privacy compliance (APP) | 🟡 Implicit | 🟡 Partial | ❌ None | ✅ **DPIA-complete, by design** |

**Blue Ocean insight:** No existing solution combines low time-to-fill (like AlayaCare's automation) with high trust-matching (like a coordinator's memory) and automated E-3-compliant notification (unique). Home-Care-AI is the only option that delivers all three simultaneously. The White Space is precisely where our product sits.

> **Note — HCP / Carelink+:** HCP appears in the §1.1 alternatives table but is excluded from this value curve. Rationale: HCP is a rostering and NDIS compliance tool with no matching logic whatsoever — coordinators use it as a roster viewer and then call manually. Including it would add a column identical to "Manual Calls" on every matching-related dimension, adding visual noise without analytical value. The alternatives table is the appropriate place to name it; the value curve compares tools that at least attempt to solve the matching problem.



*Per CLAUDE.md Rule 9: these are the exact metrics that will appear in the PRD's SMART OKRs. No vanity metrics.*

> **OKR source note:** OKR-1 through OKR-5 are CC-segment metrics grounded in named first-party interview data (Angela CC-001, Tom CC-002) and are the PRD inputs. OKR-6 is an Agency Owner metric; its baseline ("2–3 months shadowing") is directionally correct but not sourced from a named agency owner interview — it is inferred from coordinator accounts of their own onboarding experiences. The target ("< 5 days") is not yet validatable until post-launch agency owner feedback is collected. OKR-6 is included for completeness; it does not gate the PRD and will be updated after XP-2A agency owner interviews return data.

| OKR # | Outcome | Specific | Measurable | Achievable Baseline | Relevant | Time-Bound |
|---|---|---|---|---|---|---|
| **OKR-1** | Vacancy time-to-fill | < 5 minutes per incident | Stopwatch log (XP-1A) | From 30–60 min (Angela) | Core desired outcome (Artifact 5) | Within 30-day trial |
| **OKR-2** | Cancellation rate | < 2% per agency per week | Incident log | From ~20% (Tom) | Client safety + agency reputation | Within 30-day trial |
| **OKR-3** | Coordinator 1-tap trust | ≥ 70% top-candidate approval without verification calls | Deviation log (XP-1B) | 0% (no system exists today) | Decision tool, not search tool | Steady-state (post-SPP migration) |
| **OKR-4** | SPP completeness | ≥ 80% of active clients with ≥ 3 fields populated | SPP database (P-10 completeness score) | ~0% (sticky notes) | Prerequisite for match quality | Within 90 days of onboarding |
| **OKR-5** | Family notification rate | 100% of confirmed replacements trigger automated family notification | Audit log (ACT-F-01) | Ad hoc / ~0% | Arthur Kovacs constraint; E-3 compliance | v1 launch |
| **OKR-6** ⚠ | Knowledge survivability | New coordinator effective in < 5 days with SPP handover | Agency owner assessment at 30 days | 2–3 months shadowing *(directional — not sourced from a named agency owner interview; YODA baseline pending VI-1 agency owner interviews, XP-2A)* | Bus-proof institutional memory | Within 30 days of coordinator onboarding |



*Per CLAUDE.md Article IV Rule 3: "No value prop is final without one user-journey-map deep dive confirming emotional resonance."*

The value propositions in §§1–2 are grounded in first-party interview data and must be validated against the full emotional arc of a care coordinator's day. Specifically:

- **Moment of Truth** (to be identified in Artifact 15): the single point in the coordinator's workflow where Home-Care-AI's value is most acutely felt. Hypothesis: 6:30 AM, first absence of the day, before the phone cascade starts.
- **Emotional resonance check**: Does the "1-tap approval" framing feel like relief or like loss of control? (SWOT SR: trust > speed — the product must feel like trusted support, not like automation taking over.)
- **Level 3 AI Intervention Opportunities**: user-journey-map will identify where L3 actions (WhatsApp send, client notification, family notification) fall in the coordinator's emotional arc — and whether the HITL gate feels reassuring or frustrating.

**Status:** Value prop is PROVISIONAL pending Artifact 15 (user-journey-map).



| ID | From Artifact | To Next Skill | What Transfers |
|---|---|---|---|
| **HS-DISC-02** | §1 CC JTBD + Beachhead confirmation | `user-journey-map` (Strategy Skill 4) — HS-DISC-02 per master map | CC as the primary persona for the journey map deep dive; "What After" outcomes as the emotional destination |
| **HS-STRAT-04** | §6 "What After" SMART OKRs (OKR-1 through OKR-6) | `create-prd` (Execution Skill 1) | These are the exact SMART OKR metrics in PRD §3. No substitution permitted (CLAUDE.md Rule 9). |
| **HS-STRAT-VP-01** | §1.2 One-sentence value prop (CC) | `positioning-statement` (Strategy Skill 7) | Geoffrey Moore format feeds directly into the positioning statement |
| **HS-STRAT-VP-02** | §5 Value Curve | `positioning-statement` (Strategy Skill 7) | ERRC Grid inputs: which factors to Eliminate, Reduce, Raise, Create vs. AlayaCare |
| **HS-STRAT-VP-03** | §3/4 FC and HCN previews | `startup-canvas` (update trigger if journey map changes segment priority) | FC and HCN value props are previews — they become full value props only after CC beachhead is validated |



| Date | Owner | Action |
|---|---|---|
| **2026-03-27** | PM Lead | Run `user-journey-map` (Strategy Skill 4) — deep dive on CC persona to confirm emotional resonance and identify Moment of Truth |
| **2026-03-27** | PM Lead | Share OKR-1 through OKR-6 (§6) with engineering team as the PRD OKR inputs — these are locked pending journey map validation |
| **2026-03-28** | Designer | Review §1.3 onboarding statement — "The system will never send a carer without your approval" — confirm this framing appears in the coordinator onboarding flow |
| **2026-03-28** | PM Lead | Share §1.3 sales statement with agency owner LOI pitch deck (XP-2A prep) |
| **2026-04-15** | PM Lead | After user-journey-map: update "What After" if journey reveals a different Moment of Truth than the 6:30 AM hypothesis |


*Value prop note: This artifact is provisional until Artifact 15 (user-journey-map) confirms emotional resonance. The "What After" OKRs in §6 are final for PRD purposes once the journey map validates them. Per CLAUDE.md Article IV Rule 9: the "What After" outcome is the exact metric in the PRD's SMART OKRs — no vanity metrics, no substitution.*
