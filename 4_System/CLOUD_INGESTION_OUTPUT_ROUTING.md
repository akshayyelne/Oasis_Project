# Cloud Ingestion - Output Routing to 3_Outcome

**Date Created**: 2026-07-27  
**Status**: ✅ UPDATED - Direct Graph API, Standardized Outcome Routing  
**Safety Level**: Maximum (Read-only API, human review gates preserved)

---

## Overview

Cloud ingestion (OneDrive via Microsoft Graph API) fetches course materials and technical documents, then routes outputs to standardized `3_Outcome` folders based on content type. This aligns cloud ingestion with chat exports and NotebookLM pipelines.

**Source**: Microsoft Graph API (`/Documents/Study/Artificial Intelligence`)  
**Access Method**: Direct Graph API (no rclone required)  
**Fallback**: Local `1_Source/` directory (automatic, on cloud failure)  
**Consolidated output**: `tools/cloud_ingest/output/latest_ingestion.md` (raw extracted text)  
**Outcome routing**: `3_Outcome/31_Branding/` and `3_Outcome/32_Community/` (type-specific subdirectories)

---

## Directory Structure

### Source (Microsoft Graph API)
```
OneDrive: /Documents/Study/Artificial Intelligence
├── Course folders
│   ├── Module 1/
│   ├── Module 2/
│   └── [Extracted via Graph API - no local syncing]
└── [Consolidated to latest_ingestion.md]
```

### Outcomes (Routing by Type)

**Branding Outputs**:
```
3_Outcome/31_Branding/
├── Linkedin/
│   └── [LinkedIn posts with OneDrive reference]
└── Portfolio/
    └── [Portfolio case studies with OneDrive reference]
```

**Community Outputs**:
```
3_Outcome/32_Community/
├── Announcement/
│   └── [Announcements from OneDrive course materials]
├── Query/
│   └── [Responses to queries using OneDrive references]
└── Response/
    └── [Responses to community queries grounded in course content]
```

---

## File Naming Convention

### Format
```
YYYY-MM-DD_OneDrive_CourseName_InsightName_DRAFT.md
```

### Components
- **Date**: YYYY-MM-DD (creation date)
- **Source**: Literal "OneDrive" (indicates cloud ingestion source)
- **CourseName**: Course or module name from OneDrive (e.g., "Course1", "AI-Fundamentals")
- **InsightName**: kebab-case insight or topic name
- **Suffix**: _DRAFT.md (awaiting human review)

### Examples
- `2026-07-27_OneDrive_Course1_ai-architecture-overview_DRAFT.md`
- `2026-07-27_OneDrive_AI-Ethics_fairness-frameworks_DRAFT.md`
- `2026-07-27_OneDrive_ML-Applications_healthcare-use-cases_DRAFT.md`

---

## YAML Metadata Header

Every cloud-ingestion-derived output must include standardized metadata:

```yaml
---
Date: YYYY-MM-DD
Source name: Cloud_Ingestion
Category: [Course Name from OneDrive]
Topic: [Extracted or inferred topic]
---
```

### Field Explanations
- **Date**: Today's date (when content was created)
- **Source name**: Literal "Cloud_Ingestion" (constant, indicates source type)
- **Category**: Course or module name from OneDrive (e.g., "Course 1: AI Fundamentals")
- **Topic**: Specific insight category or learning objective extracted from materials

### Example Metadata
```yaml
---
Date: 2026-07-27
Source name: Cloud_Ingestion
Category: Course 1: AI Fundamentals
Topic: Machine Learning Architecture Patterns
---
```

---

## Safety Guarantees (Non-Breaking, All Preserved)

### ✅ Direct Graph API Access
- Microsoft Graph API, no rclone or file syncing required
- Hardcoded to single OneDrive path: `/Documents/Study/Artificial Intelligence`
- Device code flow (no client secret needed)
- Token cached locally, `.env` gitignored

### ✅ Graceful Fallback
- On any Graph API failure, automatically falls back to local `1_Source/`
- Same output format (ensures downstream consistency)
- Fallback reason logged to audit trail (MEMORY.md)

### ✅ Human Review Gates
- All outputs saved with `_DRAFT` suffix until human review completes
- Agents require explicit approval before any content is finalized
- Review status tracked in file naming convention

### ✅ No Auto-Commits/Pushes
- No auto-commit mechanisms
- No auto-push to GitHub or OneDrive
- All changes staged locally first
- Human approval required before any action

### ✅ No Breaking Changes
- Existing workflows unaffected
- New paths are purely organizational
- Primary local ingestion (1_Source) unchanged
- Community query processing unchanged

### ✅ Reference Tracking
- OneDrive references included when using course materials
- Format: `**OneDrive Reference**: [course-name] - [topic/file]`
- Ensures full traceability of source materials

---

## Configuration Alignment

| Component | Source | Output Path | File Naming Format | Review Gate | Status |
|-----------|--------|-------------|-------------------|------------|--------|
| **Branding (LinkedIn)** | Cloud Ingestion | `3_Outcome/31_Branding/Linkedin/` | `Date_OneDrive_CourseName_InsightName_DRAFT.md` | ✅ DRAFT suffix | Ready |
| **Branding (Portfolio)** | Cloud Ingestion | `3_Outcome/31_Branding/Portfolio/` | `Date_OneDrive_CourseName_InsightName_DRAFT.md` | ✅ DRAFT suffix | Ready |
| **Community (Announcement)** | Cloud Ingestion | `3_Outcome/32_Community/Announcement/` | `Date_OneDrive_CourseName_TopicName_DRAFT.md` | ✅ DRAFT suffix | Ready |
| **Community (Query)** | Cloud Ingestion | `3_Outcome/32_Community/Query/` | `Date_OneDrive_CourseName_TopicName_DRAFT.md` | ✅ DRAFT suffix | Ready |
| **Community (Response)** | Cloud Ingestion | `3_Outcome/32_Community/Response/` | `Date_OneDrive_CourseName_TopicName_DRAFT.md` | ✅ DRAFT suffix | Ready |

---

## How to Use Cloud Ingestion References

### For Branding Engine

1. **Access consolidated cloud output**:
   ```
   tools/cloud_ingest/output/latest_ingestion.md
   ```

2. **Extract insights**:
   - Identify key learning concepts from course materials
   - Note architectural patterns or best practices
   - Extract real-world examples

3. **Create content**:
   - Draft LinkedIn post or portfolio case study
   - Ground narrative in actual course content
   - Add YAML metadata header

4. **Stage output**:
   - Save to: `3_Outcome/31_Branding/[Linkedin|Portfolio]/`
   - Use filename: `YYYY-MM-DD_OneDrive_CourseName_InsightName_DRAFT.md`
   - Include: `**OneDrive Reference**: [course-name] - [topic/section]`

5. **Await human review**:
   - DRAFT status is mandatory gate
   - Review and approval before finalization

### For Community Agent

1. **Receive community query** (standard workflow)

2. **Optional: Reference course materials**:
   ```
   tools/cloud_ingest/output/latest_ingestion.md
   ```
   - Browse relevant course content for context
   - Extract applicable learning objectives or concepts

3. **Draft community response**:
   - Ground answer in course material examples
   - Use real-world applications from materials
   - Connect learning to practice

4. **Stage output**:
   - Save to: `3_Outcome/32_Community/[Announcement|Query|Response]/`
   - Use filename: `YYYY-MM-DD_OneDrive_CourseName_TopicName_DRAFT.md`
   - Include YAML metadata header
   - Add: `**OneDrive Reference**: [course-name] - [topics/sections used]`

5. **Await human review**:
   - DRAFT status is mandatory gate
   - Review and approval before sending to community

---

## Integration with Existing Structures

### Branding Engine
- **See**: `~/.openclaw/agents/branding_engine/CLOUD_INGESTION_CONFIG.md` (to be created)
- **Related**: GITHUB_CONFIG.md, NOTEBOOKLM_CONFIG.md
- **Primary output**: `3_Outcome/31_Branding/`

### Community Agent
- **See**: `~/.openclaw/agents/community_agent/CLOUD_INGESTION_CONFIG.md` (to be created)
- **Related**: GITHUB_CONFIG.md, NOTEBOOKLM_CONFIG.md
- **Primary output**: `3_Outcome/32_Community/`

### Existing Cloud Ingestion
- **Tool**: `~/.openclaw/agents/branding_engine/tools/cloud_ingest/`
- **Access**: Microsoft Graph API (direct, no rclone)
- **Fallback**: Local `1_Source/` directory
- **Setup**: `CLOUD_INGESTION.md` in tool directory

---

## Verification

All cloud-ingestion-derived outputs should have:
- ✅ YAML metadata header with all 4 fields (Date, Source name, Category, Topic)
- ✅ Correct filename format (`Date_OneDrive_CourseName_InsightName_DRAFT.md`)
- ✅ DRAFT suffix (mandatory review gate)
- ✅ OneDrive reference line pointing to specific source materials
- ✅ Stored in correct outcome directory (Branding or Community)
- ✅ Awaiting human review before finalization

---

## Disabling Cloud Ingestion (If Needed)

**To disable cloud ingestion references**:
1. Stop referencing `tools/cloud_ingest/output/latest_ingestion.md` in drafts
2. Optionally disable cloud ingestion tool (not required for primary workflows)
3. Optionally delete configuration files:
   - `~/.openclaw/agents/branding_engine/CLOUD_INGESTION_CONFIG.md`
   - `~/.openclaw/agents/community_agent/CLOUD_INGESTION_CONFIG.md`

**Result**: Zero impact on any workflows. All existing files remain in `3_Outcome/`.

---

## Summary

✅ **Source**: Microsoft Graph API (direct, no rclone required)  
✅ **Fallback**: Local `1_Source/` directory (automatic on cloud failure)  
✅ **Output paths**: `3_Outcome/31_Branding/` and `3_Outcome/32_Community/` with type-specific routing  
✅ **Metadata format**: YAML with Source name (Cloud_Ingestion), Category (Course Name), Topic  
✅ **File naming**: `Date_OneDrive_CourseName_InsightName_DRAFT.md`  
✅ **Safety guardrails**: Human review gates, DRAFT suffix enforcement, direct Graph API access  
✅ **Configuration**: Single hardcoded OneDrive path, no file syncing needed  
✅ **Ready for use**: Tool configured, agents ready to reference cloud materials  

---

**Update Completion Date**: 2026-07-27  
**Configuration Status**: Production-Ready  
**Safety Level**: Maximum  
**Access Method**: Microsoft Graph API (Direct, No Rclone)  
**Fallback**: Local `1_Source/` (Automatic)  
**Metadata Format**: YAML frontmatter required for all cloud-derived outputs
