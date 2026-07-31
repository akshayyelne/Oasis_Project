# GitHub Ingestion - Output Routing to 3_Outcome

**Date Created**: 2026-07-27  
**Status**: ✅ COMPLETE - Integrated with new outcome structure  
**Safety Level**: Maximum (Read-only API, human review gates preserved)

---

## Overview

GitHub repository contents are ingested via read-only REST API and routed to our standardized `3_Outcome` folders based on content type. This aligns GitHub ingestion with our chat exports and NotebookLM pipelines.

**Source**: GitHub REST API (read-only, authenticated PAT)  
**Consolidated output**: `tools/github_ingest/output/latest_github_ingest.md`  
**Outcome routing**: `3_Outcome/31_Branding/` and `3_Outcome/32_Community/` (type-specific subdirectories)

---

## Directory Structure

### Source (GitHub API)
```
tools/github_ingest/output/latest_github_ingest.md
├── Repository Index
│   └── [owner/repo-name] — N files parsed
└── Full Content
    └── Repository: [owner/repo-name]
        └── File: [path/filename.ext]
            └── [extracted content]
```

### Outcomes (Routing by Type)

**Branding Outputs**:
```
3_Outcome/31_Branding/
├── Linkedin/
│   └── [LinkedIn posts with GITHUB reference]
└── Portfolio/
    └── [Portfolio case studies with GITHUB reference]
```

**Community Outputs**:
```
3_Outcome/32_Community/
├── Announcement/
│   └── [Community announcements from GitHub patterns]
├── Query/
│   └── [Responses to queries using GitHub code examples]
└── Response/
    └── [Responses to announcements grounded in patterns]
```

---

## File Naming Convention

### Format
```
YYYY-MM-DD_GitHub_RepositoryName_InsightName_DRAFT.md
```

### Components
- **Date**: YYYY-MM-DD (creation date)
- **Source**: Literal "GitHub" (indicates GitHub source)
- **RepositoryName**: Repository name (no spaces, no owner prefix)
- **InsightName**: kebab-case insight or topic name
- **Suffix**: _DRAFT.md (awaiting human review)

### Examples
- `2026-07-27_GitHub_DimentAI_branding-workflow-integration_DRAFT.md`
- `2026-07-27_GitHub_Claude-Code_architecture-decision-patterns_DRAFT.md`
- `2026-07-27_GitHub_OpenClaw_community-engagement-strategy_DRAFT.md`

---

## YAML Metadata Header

Every GitHub-informed draft must include:

```yaml
---
Date: YYYY-MM-DD
Source name: GitHub
Category: [Repository Name]
Topic: [Extracted or inferred topic]
---
```

### Field Explanations
- **Date**: Today's date (when content was created)
- **Source name**: Literal "GitHub" (indicates source type)
- **Category**: Repository name from GitHub (e.g., "DimentAI", "Claude-Code")
- **Topic**: Specific insight category extracted from code patterns

### Example Metadata
```yaml
---
Date: 2026-07-27
Source name: GitHub
Category: DimentAI
Topic: Graceful Degradation in Production Systems
---
```

---

## Safety Guarantees (Non-Breaking, All Preserved)

### ✅ Read-Only GitHub Access
- GitHub API scoped to `repo:read` only (no write permissions)
- All ingestion is read-only; no code modifications
- Personal Access Token (PAT) stored securely in `.env` (git-ignored)

### ✅ Human Review Gates
- All outputs saved with `_DRAFT` suffix until human review completes
- Both agents require explicit approval before any content is finalized
- Review status tracked in file naming convention

### ✅ No Auto-Commits/Pushes
- No auto-commit mechanisms exist
- No auto-push to GitHub
- All changes staged locally first
- Human approval required before any action

### ✅ No Breaking Changes
- Existing workflows unaffected
- New paths are purely organizational
- Primary `20_Tech_Notes/` source unchanged
- Community query processing unchanged

### ✅ Reference Tracking
- GitHub references mandatory when using code patterns
- Format: `**GitHub Reference**: [owner/repo] - [filename] - [specific section/function]`
- Ensures full traceability of code sources

---

## Configuration Alignment

| Component | Source | Output Path | File Naming Format | Review Gate | Status |
|-----------|--------|-------------|-------------------|------------|--------|
| **Branding (LinkedIn)** | GitHub API | `3_Outcome/31_Branding/Linkedin/` | `Date_GitHub_RepoName_InsightName_DRAFT.md` | ✅ DRAFT suffix | Ready |
| **Branding (Portfolio)** | GitHub API | `3_Outcome/31_Branding/Portfolio/` | `Date_GitHub_RepoName_InsightName_DRAFT.md` | ✅ DRAFT suffix | Ready |
| **Community (Announcement)** | GitHub API | `3_Outcome/32_Community/Announcement/` | `Date_GitHub_RepoName_TopicName_DRAFT.md` | ✅ DRAFT suffix | Ready |
| **Community (Query)** | GitHub API | `3_Outcome/32_Community/Query/` | `Date_GitHub_RepoName_TopicName_DRAFT.md` | ✅ DRAFT suffix | Ready |
| **Community (Response)** | GitHub API | `3_Outcome/32_Community/Response/` | `Date_GitHub_RepoName_TopicName_DRAFT.md` | ✅ DRAFT suffix | Ready |

---

## How to Use GitHub References

### For Branding Engine

1. **Access consolidated output**:
   ```
   tools/github_ingest/output/latest_github_ingest.md
   ```

2. **Extract insights**:
   - Identify architectural patterns
   - Note decision rationales
   - Extract code examples

3. **Create content**:
   - Draft LinkedIn post or portfolio case study
   - Add YAML metadata header
   - Reference specific repository and files

4. **Stage output**:
   - Save to: `3_Outcome/31_Branding/[Linkedin|Portfolio]/`
   - Use filename: `YYYY-MM-DD_GitHub_RepoName_InsightName_DRAFT.md`
   - Include: `**GitHub Reference**: [owner/repo] - [filename] - [specific function/class]`

5. **Await human review**:
   - DRAFT status is mandatory gate
   - Review and approval before finalization

### For Community Agent

1. **Receive community query** (standard workflow)

2. **Optional: Reference patterns**:
   ```
   tools/github_ingest/output/latest_github_ingest.md
   ```
   - Browse relevant repository code for context

3. **Draft research-backed response**:
   - Ground answer in code patterns
   - Use real examples from repository
   - Show working implementations

4. **Stage output**:
   - Save to: `3_Outcome/32_Community/[Announcement|Query|Response]/`
   - Use filename: `YYYY-MM-DD_GitHub_RepoName_TopicName_DRAFT.md`
   - Include YAML metadata header
   - Add: `**GitHub Reference**: [owner/repo] - [files used]`

5. **Await human review**:
   - DRAFT status is mandatory gate
   - Review and approval before sending to community

---

## Integration with Existing Structures

### Branding Engine
- **See**: `~/.openclaw/agents/branding_engine/GITHUB_CONFIG.md`
- **Related**: CHAT_EXPORTS_CONFIG.md, NOTEBOOKLM_CONFIG.md
- **Primary source**: 20_Tech_Notes/

### Community Agent
- **See**: `~/.openclaw/agents/community_agent/GITHUB_CONFIG.md`
- **Related**: CHAT_EXPORTS_CONFIG.md, NOTEBOOKLM_CONFIG.md
- **Primary source**: 4_Community/

### Existing GitHub Safety Policies
- **Design**: `99_System/GITHUB_INGESTION_DESIGN.md`
- **Safety**: `99_System/GITHUB_INGESTION_HUMAN_REVIEW_GATE.md`
- **Audit**: `99_System/GITHUB_CHAT_INTEGRATION_AUDIT.md`

---

## Verification

All GitHub-informed outputs should have:
- ✅ YAML metadata header with all 4 fields
- ✅ Correct filename format (`Date_GitHub_RepoName_InsightName_DRAFT.md`)
- ✅ DRAFT suffix (mandatory review gate)
- ✅ GitHub reference line pointing to specific source
- ✅ Stored in correct outcome directory
- ✅ Awaiting human review before finalization

---

## Disabling GitHub Reference (If Needed)

**To disable GitHub references**:
1. Stop referencing `tools/github_ingest/output/latest_github_ingest.md` in drafts
2. Optionally disable GitHub ingestion tool (not required)
3. Optionally delete configuration files:
   - `~/.openclaw/agents/branding_engine/GITHUB_CONFIG.md`
   - `~/.openclaw/agents/community_agent/GITHUB_CONFIG.md`

**Result**: Zero impact on any workflows. All existing files remain in 3_Outcome/.

---

## Summary

✅ **Source**: GitHub REST API (read-only, authenticated PAT)  
✅ **Output paths**: `3_Outcome/31_Branding/` and `3_Outcome/32_Community/` with type-specific routing  
✅ **Metadata format**: YAML with Source name (GitHub), Category (Repository), Topic  
✅ **File naming**: `Date_GitHub_RepositoryName_InsightName_DRAFT.md`  
✅ **Safety guardrails**: Human review gates, DRAFT suffix enforcement, read-only API  
✅ **Configuration**: All agents configured with new routing structure  
✅ **Ready for use**: All agents configured and ready to reference GitHub repositories  

---

**Update Completion Date**: 2026-07-27  
**Configuration Status**: Production-Ready  
**Safety Level**: Maximum  
**Metadata Format**: YAML frontmatter required for all GitHub-informed outputs
