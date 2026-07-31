# GitHub Ingestion - Human-in-the-Loop Write Gate

**Purpose**: Enforce human review before ANY proposed code changes touch GitHub repositories  
**Status**: POLICY DOCUMENT  
**Enforcement**: Mandatory for all GitHub-sourced work

---

## 1. Core Principle

**ZERO AUTO-COMMIT POLICY**

The GitHub ingestion tool is read-only. Any proposed changes, fixes, or improvements derived from ingested code must:

1. Be saved to a local staging directory first
2. Require explicit human review and approval
3. Never be auto-committed or auto-pushed
4. Remain under user control at all times

---

## 2. Workflow: From GitHub Ingestion to Proposed Change

### Stage 1: Ingestion (Read-Only)
```
GitHub Repositories (Cloud)
         ↓ (REST API, read-only)
latest_github_ingest.md (Local Reference)
         ↓ (Branding Engine reads for patterns)
Insights + Observations
```

### Stage 2: Proposal (Local Staging Only)
```
Insights
   ↓ (Branding Engine identifies improvement opportunity)
Proposed Change
   ↓ (SAVED TO LOCAL STAGING, NO API CALLS)
60_GitHub_Staging/{owner}/{repo}/{path}.PROPOSED
   ↓ (Audit log: change proposed, timestamp, reason)
MEMORY.md (Logged for audit trail)
```

### Stage 3: Human Review (Required)
```
60_GitHub_Staging/{owner}/{repo}/{path}.PROPOSED
   ↓ (User reads file)
Human Decision
   ├─ ✅ Approve → (proceed to Stage 4)
   ├─ ❌ Reject → (delete .PROPOSED file, end)
   └─ 🔄 Modify → (edit .PROPOSED, re-review)
```

### Stage 4: Manual Execution (User-Controlled)
```
Approved Change
   ↓ (User manually applies to local repo OR GitHub UI)
Local Repository / GitHub Web Interface
   ↓ (User creates commit, PR, or applies patch)
GitHub Repository (Cloud)
```

**CRITICAL**: Tool never touches GitHub in Stage 4. User does it manually.

---

## 3. Directory Structure

```
C:\Users\aksha\Oasis_Project\60_GitHub_Staging\
├── {owner}/
│   └── {repo}/
│       ├── {file_path}.PROPOSED          ← Proposed change (waiting review)
│       ├── {file_path}.PROPOSED.APPROVED ← Approved, ready to apply
│       └── {file_path}.PROPOSED.REJECTED ← Rejected (kept for audit)
```

### Example

```
60_GitHub_Staging/
├── anthropics/
│   └── claude-code/
│       ├── src/auth.js.PROPOSED
│       ├── src/auth.js.PROPOSED.APPROVED
│       └── src/cli.js.PROPOSED.REJECTED
└── my-org/
    └── my-repo/
        └── docs/API.md.PROPOSED
```

---

## 4. File Format: `.PROPOSED`

### Header Section
```yaml
---
proposed_by: branding_engine
proposed_at: 2026-07-22T14:03:00.000Z
repository: owner/repo
file_path: src/auth.js
reason: "Security best practice: add input validation to auth handler"
urgency: normal  # normal|high|critical
confidence: high # low|medium|high
tags: [security, refactor, validation]
---

## Proposed Change

[Change description - what and why]

## Original File Location

`{owner}/{repo}/{file_path}`

## Change Type

- [ ] Bug fix
- [ ] Feature addition
- [x] Refactor
- [ ] Documentation
- [ ] Security improvement

## Before

​`​`​`javascript
[Original code snippet]
​`​`​`

## After

​`​`​`javascript
[Proposed code snippet]
​`​`​`

## Rationale

[Explanation of why this change is beneficial]

## Risks & Considerations

[Any potential issues or breaking changes]

## Testing Recommendations

[How user should test if they apply this change]

## Apply Instructions

If approved, apply by:
1. Clone/open {owner}/{repo} locally
2. Edit {file_path}
3. Copy "After" code to replace "Before"
4. Test locally
5. Commit + push (or create PR)

---

## Review Notes

[User fills in during review]
- Reviewed: ☐
- Status: ☐ Approved | ☐ Rejected | ☐ Needs refinement
- Comments: [...]
```

---

## 5. Human Review Checklist

Before approving a `.PROPOSED` change:

### Code Quality
- [ ] Change aligns with repository's coding style
- [ ] No security vulnerabilities introduced
- [ ] Code is readable and maintainable
- [ ] Comments explain non-obvious logic

### Correctness
- [ ] Logic is sound and solves stated problem
- [ ] No edge cases missed
- [ ] Existing functionality not broken
- [ ] Backwards compatible (or change is intentional)

### Testing
- [ ] Change includes test cases (if applicable)
- [ ] Instructions for testing are clear
- [ ] User can reproduce/verify locally

### Documentation
- [ ] Change is documented (if applicable)
- [ ] Comments describe intent
- [ ] README/API docs updated (if needed)

### Risk Assessment
- [ ] Change scope is clear and bounded
- [ ] No unintended side effects
- [ ] No dependencies on unreviewed code
- [ ] Risks are documented

### Alignment
- [ ] Change aligns with project goals
- [ ] Change doesn't contradict maintainers' direction
- [ ] Confidence level is justified

---

## 6. Decision Matrix

### ✅ APPROVE
- Code quality: Good
- Testing: Clear path to verify
- Risk: Low to medium
- Confidence: Medium to high

**Action**: 
1. Rename `{file}.PROPOSED` → `{file}.PROPOSED.APPROVED`
2. Note approval in `.PROPOSED` file or separate `.APPROVED` note
3. User can now apply manually

### ❌ REJECT
- Code quality: Issues found
- Testing: Insufficient
- Risk: High
- Confidence: Low

**Action**:
1. Rename `{file}.PROPOSED` → `{file}.PROPOSED.REJECTED`
2. Add rejection note in file (what issues were found)
3. Keep for audit trail

### 🔄 REQUEST CHANGES
- Code quality: Acceptable with revisions
- Testing: Needs more coverage
- Risk: Medium
- Confidence: Medium

**Action**:
1. Add comments to `.PROPOSED` file
2. Suggest specific edits
3. Wait for user to revise + re-review

---

## 7. Audit Trail

All proposed changes logged to:
```
~/.claude/projects/C--Users-aksha-Oasis-Project/memory/GITHUB_INGESTION_HUMAN_REVIEW_AUDIT.md
```

### Log Entry Format
```
### 2026-07-22 14:03 — Proposed Change
Repo: anthropics/claude-code | Path: src/auth.js | Status: ✅ APPROVED
Proposed: Security validation | Reviewer: User | Reviewed: 2026-07-22 14:15
Decision: Approved with comments | Applied: Pending
```

### Log Entry Fields
- **Timestamp**: When proposed
- **Repository**: owner/repo
- **File**: Full path to file
- **Type**: Bug fix | Feature | Refactor | Docs | Security
- **Reason**: Why branding engine proposed this
- **Status**: ✅ Approved | ❌ Rejected | 🔄 Pending | ⏭️ Skipped
- **Confidence**: low | medium | high
- **Reviewer Notes**: User's assessment
- **Applied**: Yes/No, date if yes

---

## 8. Escalation: Critical/Security Proposals

### Critical Change
**Condition**: Urgency=critical OR Confidence=high AND Type=security

**Process**:
1. Flag in output: "⚠️ CRITICAL PROPOSAL - REQUIRES IMMEDIATE REVIEW"
2. Add to MEMORY.md: "Proposal flagged for expedited review"
3. User acknowledges receipt
4. User decides: approve/reject/defer within 24 hours
5. No auto-escalation; user controls priority

### Examples
- Security vulnerability fix (high confidence)
- Data corruption mitigation (critical)
- Breaking API change (document clearly)

---

## 9. Lifetime of a Proposed Change

```
[Created]  →  [Staged]  →  [Reviewed]  →  [Applied|Rejected]  →  [Archived]
   Day 1       Day 1       Day 2-3         Day 4-30              Day 31+

File: {file}.PROPOSED
      ↓ (after review)
File: {file}.PROPOSED.APPROVED  or  {file}.PROPOSED.REJECTED
      ↓ (if approved, user applies manually)
GitHub Repository
      ↓ (if user pushes)
Commit history (permanent)
```

### Retention
- `.PROPOSED` files: Keep indefinitely
- `.PROPOSED.APPROVED/REJECTED`: Archive after 90 days to `.archive/` subdirectory
- Memory audit log: Keep permanently for compliance

---

## 10. Safety Guarantees

### ✅ What is Guaranteed
- Tool never commits anything to GitHub
- Tool never pushes anything to GitHub
- Tool never creates PRs automatically
- Tool never executes code from ingested repositories
- All changes staged locally first
- All changes require human approval
- No environment variable or secret leaks into changes

### ❌ What Cannot Happen
- Auto-push to main/master
- Auto-merge of PRs
- Auto-execution of build scripts
- Auto-deployment (this tool produces reference only)

---

## 11. Example: End-to-End Flow

### Day 1: Proposal Created
```
$ npm start  # Ingestion completes
# Branding engine reads latest_github_ingest.md
# Identifies opportunity: "Add TypeScript types to auth.js"
# Creates proposal file: 60_GitHub_Staging/anthropics/claude-code/src/auth.js.PROPOSED
# Logs to MEMORY.md: "Proposed change: Add TypeScript types"
```

### Day 2: Human Review
```
User opens: 60_GitHub_Staging/anthropics/claude-code/src/auth.js.PROPOSED
Reads:
  - What's proposed: Add TypeScript types
  - Why: Improve type safety, reduce bugs
  - Before/after: Side-by-side comparison
  - Testing: Instructions provided
  
User decides: ✅ APPROVE
Renames file: src/auth.js.PROPOSED.APPROVED
Adds note: "Looks good. TypeScript types match the codebase style."
```

### Day 3: Manual Application
```
User clones: anthropics/claude-code locally
Opens: src/auth.js
Copies code from .PROPOSED.APPROVED file
Applies changes manually in editor
Runs: npm test (to verify)
Creates: git commit -m "Add TypeScript types to auth handler"
Pushes: git push origin feature/typescript-auth
  OR
Creates PR on GitHub manually
```

### Day 4+: GitHub Only
```
User manages PR review/merge through GitHub web interface
This tool doesn't touch anything
User monitors: CI/CD passes, reviews approved, PR merged
Closes: Deletes/archives the .PROPOSED.APPROVED file
Logs: "Change applied; PR #123 merged" to MEMORY.md
```

---

## 12. Governance & Policy

### Who Can Propose
- Branding engine (via ingestion + pattern recognition)
- Community agent (via community insights)
- User (direct override: create .PROPOSED file manually)

### Who Must Approve
- **User** (always): Final decision-maker
- Optional: Engineering leads (if change goes to shared repo)

### Approval Authority
- User has absolute authority over their own repositories
- For shared/public repos: User decides whether to submit PR (no auto-push ever)

### Escalation Path
- Issues with tool: Document in MEMORY.md, notify Claude Code
- Security concerns: Flag proposal as critical, halt proceeding
- Conflicts with repo policy: User reviews, decides inclusion

---

## 13. Maintenance & Cleanup

### Weekly Cleanup
```bash
# Archive approved/rejected changes older than 90 days
# Move to: 60_GitHub_Staging/.archive/YYYY-MM-DD/
# Keep in audit log (MEMORY.md) forever
```

### Quarterly Review
```bash
# Review proposed changes that haven't been reviewed
# Remind user of pending approvals
# Log in MEMORY.md: "Backlog review - X items pending"
```

---

## 14. Troubleshooting & FAQ

**Q: I want to reject a proposal. How?**  
A: Rename the file to `.PROPOSED.REJECTED` and add a note explaining why.

**Q: Can I modify the proposed change?**  
A: Yes. Edit the `.PROPOSED` file directly before approving, then rename to `.PROPOSED.APPROVED`.

**Q: What if the proposal is for a file I don't own?**  
A: Review it anyway. If you approve, you'll submit a PR to the repo (via GitHub UI). The tool never pushes.

**Q: The proposal has a bug. What do I do?**  
A: Reject it (`.PROPOSED.REJECTED`), add a note explaining the bug, then re-run the ingestion tool to get a fresh proposal.

**Q: Can I batch-approve multiple proposals?**  
A: Yes. Rename multiple files to `.PROPOSED.APPROVED` at once. Apply manually as time permits.

**Q: What's the timeout for reviewing proposals?**  
A: No hard timeout. User decides when to review. Pending proposals logged in MEMORY.md for tracking.

---

## Summary

| Aspect | Rule |
|--------|------|
| **Storage** | Local staging only (`60_GitHub_Staging/`) |
| **API Calls** | Zero from tool (read ingestion only) |
| **Approval** | Required before anything leaves staging |
| **Execution** | User manually applies (CLI, git, or GitHub UI) |
| **Audit** | All decisions logged to MEMORY.md |
| **Safety** | Guaranteed read-only unless user explicitly acts |

---

**Last Updated**: 2026-07-22  
**Policy Status**: Active & Enforced  
**Violations**: Document to MEMORY.md immediately + notify user
