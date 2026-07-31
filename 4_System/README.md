# 60_GitHub_Staging - GitHub Knowledge Base Proposal Staging

**Purpose**: Safe, staged workflow for proposals informed by GitHub knowledge base integration

**Status**: ACTIVE as of 2026-07-22

---

## Overview

This directory enforces a strict human-review-first workflow for any changes or improvements proposed by the branding and community engines when they reference GitHub knowledge base data.

**Core Principle**: GitHub-informed proposals are staged here **before** application. Nothing from this directory is auto-applied. All requires explicit human review and approval.

---

## Directory Structure

```
60_GitHub_Staging/
├── README.md (this file)
├── branding/           # Branding engine proposals
│   ├── [YYYY-MM-DD]_proposal_type_DRAFT.md
│   └── [YYYY-MM-DD]_archive/ (after approval/rejection)
├── community/          # Community agent proposals
│   ├── [YYYY-MM-DD]_query-topic_DRAFT.md
│   └── [YYYY-MM-DD]_archive/ (after approval/rejection)
└── .archive/           # Historical records (read-only)
```

---

## Branding Engine Proposals

### Location
`60_GitHub_Staging/branding/`

### File Naming Convention
```
[YYYY-MM-DD]_[kebab-case-title]_[content-type]_DRAFT.md
```

**Examples**:
- `2026-07-22_async-patterns_linkedin_DRAFT.md`
- `2026-07-22_architecture-evolution_portfolio_DRAFT.md`
- `2026-07-22_tech-stack-decision_summary_DRAFT.md`

### File Structure
```markdown
# [Proposal Title]

**Date Created**: YYYY-MM-DD  
**Type**: LinkedIn Post | Portfolio Blurb | Case Study | Summary  
**Status**: DRAFT - Awaiting Human Review  
**GitHub Reference**: [file path or section from latest_github_ingest.md]

---

## Context
[Why this insight matters, what makes it relevant]

## Content Proposal
[The actual proposed content - LinkedIn post, portfolio text, etc.]

## GitHub Evidence
[Relevant code snippet, pattern, or architectural decision from the ingestion]

## Staging Rationale
[Why this is staged, what needs human judgment]

---

## Review Checklist
- [ ] Accurately reflects GitHub source
- [ ] Authentic to your actual implementations
- [ ] Maintains Buzz & Echo persona
- [ ] Portfolio-appropriate tone (if portfolio content)
- [ ] No sensitive/private code exposed
- [ ] Ready for publication or needs revision

## Human Decision
- [ ] APPROVED: Move to 30_Branding/ for publication
- [ ] REVISE: Request changes before publication
- [ ] REJECT: Archive without applying
```

### Approval Workflow
1. **Review**: Open staged proposal
2. **Verify**: Check GitHub reference against actual code
3. **Decide**:
   - ✅ APPROVED: Move to `30_Branding/` with date prefix
   - ⚠️ REVISE: Add comments, return to agent with feedback
   - ❌ REJECT: Move to `.archive/[YYYY-MM-DD]/` with reason note
4. **Archive**: After decision, file proposal to `.archive/[YYYY-MM-DD]/`

---

## Community Agent Responses

### Location
`60_GitHub_Staging/community/`

### File Naming Convention
```
[YYYY-MM-DD]_[kebab-case-query-topic]_DRAFT.md
```

**Examples**:
- `2026-07-22_async-state-management_DRAFT.md`
- `2026-07-22_error-handling-approach_DRAFT.md`
- `2026-07-22_database-optimization_DRAFT.md`

### File Structure
```markdown
# Query Response: [Topic]

**Date Created**: YYYY-MM-DD  
**Query Topic**: [What the community asked]  
**Status**: DRAFT - Awaiting Human Review  
**GitHub Reference**: [file path or section from latest_github_ingest.md]  
**Persona Check**: ENGINE_COMMUNITY.md values maintained

---

## Original Query Summary
[1-2 sentence summary of what they asked]

## Emotional Context
[Frustrated/Confused/Curious/Seeking guidance]

## Proposed Response
[The drafted community response, ready to send]

### Response Structure
1. Acknowledgment
2. Clear explanation
3. Authentic example (from GitHub reference)
4. Why it works
5. Next steps/invitation

## GitHub Evidence
[Relevant code example or pattern from your repos]

## Safety Check
- Sensitive/private code? [Yes/No - anonymized if yes]
- Maintains ENGINE_COMMUNITY.md values? [Yes/No]
- Follows CONSTRAINTS.md? [Yes/No]
- Appropriate for community? [Yes/No]

---

## Review Checklist
- [ ] Responds to actual question
- [ ] Empathetic and clear
- [ ] GitHub evidence accurate and relevant
- [ ] No private/sensitive code exposed
- [ ] Maintains community-first tone
- [ ] Ready to send or needs revision

## Human Decision
- [ ] APPROVED: Send to community (archive after sending)
- [ ] REVISE: Request changes before sending
- [ ] REJECT: Archive without sending
```

### Approval Workflow
1. **Review**: Open staged response
2. **Verify**: Check authenticity and tone
3. **Decide**:
   - ✅ APPROVED: Send to community, then archive
   - ⚠️ REVISE: Add comments, return to agent with feedback
   - ❌ REJECT: Move to `.archive/[YYYY-MM-DD]/` with reason note
4. **Archive**: After decision, file to `.archive/[YYYY-MM-DD]/`

---

## Archive Directory

### Purpose
Historical record of all staged proposals and decisions

### Structure
```
.archive/
├── 2026-07-22/
│   ├── branding/
│   │   ├── [YYYY-MM-DD]_proposal_APPROVED.md
│   │   ├── [YYYY-MM-DD]_proposal_REVISION_NOTES.md
│   │   └── [YYYY-MM-DD]_proposal_REJECTED.md
│   └── community/
│       ├── [YYYY-MM-DD]_response_APPROVED.md
│       ├── [YYYY-MM-DD]_response_REVISION_NOTES.md
│       └── [YYYY-MM-DD]_response_REJECTED.md
└── [older dates]/
```

### Usage
- **After approval**: Copy approved file to `.archive/[YYYY-MM-DD]/[name]_APPROVED.md`
- **After revision**: Copy with revisions and notes to `.archive/[YYYY-MM-DD]/[name]_REVISION_NOTES.md`
- **After rejection**: Copy with rejection reason to `.archive/[YYYY-MM-DD]/[name]_REJECTED.md`

---

## Weekly Review Checklist

### Every Friday
- [ ] Review staged proposals from this week
- [ ] Approve ready content
- [ ] Request revisions where needed
- [ ] Reject proposals that don't fit
- [ ] Archive all decisions
- [ ] Log decisions in agent MEMORY.md files

### Monthly
- [ ] Review archive for patterns
- [ ] Note what agents are proposing
- [ ] Identify what's resonating with community/audience
- [ ] Update agent personas or prompts if needed

---

## Safety Principles

### What This Protects
✅ Human judgment on all GitHub-informed proposals  
✅ Quality gate before any changes applied  
✅ Authentic examples with human verification  
✅ Privacy: No auto-exposure of sensitive code  
✅ Persona: No drift from Buzz/Echo or ENGINE_COMMUNITY  
✅ Reversibility: Easy to reject or revise before application  

### What This Maintains
✅ Non-breaking: Primary workflows unchanged  
✅ Opt-in: GitHub reference is available but optional  
✅ Reviewable: Every proposal visible and trackable  
✅ Transparent: Clear decision workflow  
✅ Reversible: Easy to approve/reject/revise  

---

## Quick Reference

### For Branding Engine Proposals
```markdown
1. Draft proposal referencing GitHub insights
2. Stage to: 60_GitHub_Staging/branding/[YYYY-MM-DD]_[topic]_DRAFT.md
3. Include: GitHub reference line and rationale
4. Await: Human review (approve/revise/reject)
5. Archive: After decision to .archive/[YYYY-MM-DD]/
```

### For Community Agent Responses
```markdown
1. Draft response to community query
2. If GitHub reference used, stage to: 60_GitHub_Staging/community/[YYYY-MM-DD]_[topic]_DRAFT.md
3. Include: GitHub reference line and evidence
4. Await: Human review (approve/revise/reject)
5. Archive: After decision to .archive/[YYYY-MM-DD]/
```

### For Human Reviewer (You)
```markdown
1. Check 60_GitHub_Staging/branding/ and 60_GitHub_Staging/community/
2. For each staged proposal:
   - Verify GitHub reference accuracy
   - Assess quality and authenticity
   - Approve (move to 30_Branding/ or send), Revise (add feedback), or Reject
3. Archive decision to .archive/[YYYY-MM-DD]/
4. Log summary in agent MEMORY.md
```

---

## Integration with Agent Workflows

### Branding Engine (GITHUB_REFERENCE_CONFIG.md)
- Runs weekly (Friday morning)
- Identifies insights from 20_Tech_Notes/ + optional GitHub reference
- Drafts LinkedIn + Portfolio content
- Stages GitHub-informed proposals to this directory
- Awaits your approval in 60_GitHub_Staging/branding/

### Community Agent (GITHUB_REFERENCE_CONFIG.md)
- Runs continuously (as queries arrive)
- Processes queries from 40_Community/incoming_raw.md
- Drafts responses with optional GitHub evidence
- Stages GitHub-informed responses to this directory
- Awaits your approval before sending to community

---

## Related Configuration Files

- **Branding Engine**: `agents/branding_engine/GITHUB_REFERENCE_CONFIG.md`
- **Community Agent**: `agents/community_agent/GITHUB_REFERENCE_CONFIG.md`
- **Branding Pipeline**: `agents/branding_engine/PIPELINE.md`
- **Community Triage**: `agents/community_agent/TRIAGE_WORKFLOW.md`
- **GitHub Ingestion**: `agents/branding_engine/tools/github_ingest/` (index.js, github.js, etc.)

---

**Staging Directory**: ACTIVE  
**Activation Date**: 2026-07-22  
**Review Frequency**: Weekly (Fridays recommended)  
**Human Gate**: REQUIRED (no auto-application)  
**Safety Level**: Maximum (all proposals staged, reviewed, then applied)
