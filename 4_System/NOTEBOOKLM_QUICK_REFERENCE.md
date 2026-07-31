# NotebookLM Integration — Quick Reference

**TL;DR**: NotebookLM study materials are now available as optional references for branding engine (thought leadership, case studies) and community agent (research-backed responses). Both use the existing staging workflow—no changes to primary workflows.

---

## Directory Map

```
1_Source/15_NotebookLM/
├── Notebook 1/
│   ├── AI in Healthcare/
│   ├── Product Strategy/
│   └── [other topics]
├── Notebook 2/
│   └── [topic folders with .md files]

3_Outcome/31_Branding/
├── Linkedin/            ← LinkedIn posts (with NotebookLM reference)
│   └── Date_NotebookLM_NotebookX_InsightName_DRAFT.md
└── Portfolio/           ← Portfolio case studies (with NotebookLM reference)
    └── Date_NotebookLM_NotebookX_InsightName_DRAFT.md

3_Outcome/32_Community/
├── Announcement/        ← Community announcements (with NotebookLM reference)
│   └── Date_Source-NotebookLM_NotebookX_TopicName_DRAFT.md
├── Query/               ← Responses to queries (with NotebookLM research)
│   └── Date_Source-NotebookLM_NotebookX_TopicName_DRAFT.md
└── Response/            ← Responses to announcements (with NotebookLM materials)
    └── Date_Source-NotebookLM_NotebookX_TopicName_DRAFT.md
```

---

## For Branding Engine

### When to Use NotebookLM
- ✅ Educational thought leadership positioning
- ✅ Portfolio case studies showing learning depth
- ✅ Domain expertise content grounded in research
- ✅ Frameworks and insights from study materials
- ✅ Credibility through documented learning

### Workflow
```
1. Find relevant materials in 1_Source/15_NotebookLM/
2. Extract: frameworks, learning progressions, domain insights
3. Draft: LinkedIn post or Portfolio blurb
4. Add: YAML metadata header
5. Stage to: 3_Outcome/31_Branding/[Linkedin|Portfolio]/
6. Include: **NotebookLM Reference**: Notebook X - [Topic] - [section]
7. Await: Human review → approval → publication
```

### Example Staged File
```yaml
---
Date: 2026-07-27
Source name: NotebookLM
Chat Category: Notebook 1 - AI in Healthcare
Chat Topic: Clinical AI Implementation
---

# How AI is Changing Clinical Decision-Making

**NotebookLM Reference**: Notebook 1 - AI in Healthcare - Clinical Decision Support Frameworks

[Your draft content here...]
```

### Configuration
Read: `~/.openclaw/agents/branding_engine/NOTEBOOKLM_CONFIG.md`

---

## For Community Agent

### When to Use NotebookLM
- ✅ Questions about domains covered in study materials
- ✅ Learning path guidance and progression
- ✅ Research-backed frameworks and concepts
- ✅ How to apply educational frameworks practically
- ✅ Announcements on learning and research topics

### Workflow
```
1. Receive community query
2. Optional: Browse 1_Source/15_NotebookLM/ for relevant materials
3. Draft: Research-backed empathetic response
4. Add: YAML metadata header
5. Stage to: 3_Outcome/32_Community/[Announcement|Query|Response]/
6. Include: **NotebookLM Reference**: Notebook X - [Topic] - [sections]
7. Await: Human review and approval → send to community
```

### Example Staged Response
```yaml
---
Date: 2026-07-27
Source name: NotebookLM
Chat Category: Notebook 1 - AI in Healthcare
Chat Topic: Learning AI Fundamentals
---

# How to Start Your AI Learning Journey

**NotebookLM Reference**: Notebook 1 - AI in Healthcare - Foundations section

[Your empathetic response with research-backed guidance...]
```

### Configuration
Read: `~/.openclaw/agents/community_agent/NOTEBOOKLM_CONFIG.md`

---

## File Naming Convention

### Format
```
Date_NotebookLM_NotebookX_InsightName_DRAFT.md
```

### Components
- **Date**: YYYY-MM-DD (when content was created)
- **Source**: Literal "Source-NotebookLM"
- **NotebookX**: Notebook number (Notebook1, Notebook2, etc.)
- **InsightName**: kebab-case insight or topic name
- **Suffix**: _DRAFT.md (awaiting human review)

### Examples
- Branding: `2026-07-27_Source-NotebookLM_Notebook1_ai-healthcare-architecture_DRAFT.md`
- Community: `2026-07-27_Source-NotebookLM_Notebook1_learning-path-ai-foundations_DRAFT.md`
- Announcement: `2026-07-27_Source-NotebookLM_Notebook2_product-strategy-frameworks_DRAFT.md`

---

## YAML Metadata Header (Required)

Every NotebookLM-informed draft must start with:

```yaml
---
Date: YYYY-MM-DD
Source name: NotebookLM
Chat Category: Notebook X - [Topic Name]
Chat Topic: [Extracted insight category]
---
```

### Field Guide
| Field | Example | Purpose |
|-------|---------|---------|
| **Date** | 2026-07-27 | When content was created |
| **Source name** | NotebookLM | Indicates material source type |
| **Chat Category** | Notebook 1 - AI in Healthcare | Which notebook & topic |
| **Chat Topic** | Clinical AI Frameworks | Specific insight category |

---

## Safety Checklist

Before staging a proposal:

- [ ] Content references actual NotebookLM materials (files exist in 1_Source/15_NotebookLM/)
- [ ] YAML metadata header present with all 4 fields
- [ ] NotebookLM reference line included: `**NotebookLM Reference**: Notebook X - [Topic] - [section]`
- [ ] Filename follows convention: `Date_NotebookLM_NotebookX_InsightName_DRAFT.md`
- [ ] File ends with `_DRAFT.md` suffix
- [ ] Content placed in correct outcome directory
- [ ] No sensitive/private content exposed without permission
- [ ] Research/frameworks accurately reflect materials
- [ ] Source name is literal "NotebookLM"
- [ ] Chat Category formatted as "Notebook X - Topic Name"
- [ ] Chat Topic describes the specific insight

---

## Common Tasks

### Task: Create LinkedIn Post from NotebookLM Research
```
1. Find relevant materials in 1_Source/15_NotebookLM/Notebook X/[Topic]/
2. Extract: Key frameworks and insights
3. Create: 3_Outcome/31_Branding/Linkedin/[filename]_DRAFT.md
4. Add: YAML metadata and NotebookLM reference
5. Await: Human review
```

### Task: Ground Community Response in Study Materials
```
1. Receive community query
2. Find relevant materials in 1_Source/15_NotebookLM/
3. Create: 3_Outcome/32_Community/Response/[filename]_DRAFT.md
4. Add: YAML metadata and NotebookLM reference
5. Include: Research-backed guidance grounded in materials
6. Await: Human approval
```

### Task: Build Portfolio Case Study Using Learning Journey
```
1. Find progression in 1_Source/15_NotebookLM/Notebook X/[Topic]/
2. Extract: Learning arc and frameworks learned
3. Create: 3_Outcome/31_Branding/Portfolio/[filename]_DRAFT.md
4. Add: YAML metadata and NotebookLM reference
5. Show: How learning shaped your approach
6. Await: Human review
```

### Task: Create Community Announcement on Learning Topic
```
1. Identify topic in 1_Source/15_NotebookLM/
2. Extract: Key insights and frameworks for community
3. Create: 3_Outcome/32_Community/Announcement/[filename]_DRAFT.md
4. Add: YAML metadata and NotebookLM reference
5. Frame: As educational resource for community
6. Await: Human review
```

---

## What's NOT Changed

✅ **Primary workflows**: Completely intact  
✅ **Review processes**: Same human gates  
✅ **Staging workflow**: Same as AI chat references  
✅ **Constraints**: No auto-publishing (still applies)  
✅ **Personas**: SOUL.md and ENGINE_COMMUNITY.md unchanged  
✅ **Safety guardrails**: All preserved  

---

## Disabling (If Needed)

**To disable NotebookLM references**:
1. Stop referencing `1_Source/15_NotebookLM/` in drafts
2. Optionally delete config files:
   - `~/.openclaw/agents/branding_engine/NOTEBOOKLM_CONFIG.md`
   - `~/.openclaw/agents/community_agent/NOTEBOOKLM_CONFIG.md`

**Result**: Zero impact on any workflows.

---

## Key Files

| File | Purpose | Location |
|------|---------|----------|
| **NOTEBOOKLM_CONFIG.md** | Integration guide (branding) | `~/.openclaw/agents/branding_engine/` |
| **NOTEBOOKLM_CONFIG.md** | Integration guide (community) | `~/.openclaw/agents/community_agent/` |
| **NOTEBOOKLM_INTEGRATION.md** | Complete documentation | `99_System/` |
| **NotebookLM materials** | Your study materials | `1_Source/15_NotebookLM/` |
| **Staged proposals** | Awaiting review | `3_Outcome/31_Branding/` & `3_Outcome/32_Community/` |

---

## One-Minute Summary

```
NotebookLM study materials are now available as optional references for:
1. Branding Engine → Educational thought leadership, case studies, positioning
2. Community Agent → Research-backed responses, learning guidance, announcements

Process:
1. Access materials from 1_Source/15_NotebookLM/
2. Extract insights and frameworks
3. Create draft with YAML metadata header
4. Use naming: Date_NotebookLM_NotebookX_InsightName_DRAFT.md
5. Stage to 3_Outcome/ with reference line
6. Await human review before publication/sending

No changes to workflows. Completely non-breaking. Rollback trivial.
Metadata tracks notebook number, topic, and content category for all outputs.
```

---

**Last Updated**: 2026-07-27  
**Status**: Ready to Use  
**Configuration**: Complete & Deployed  
**Metadata Format**: YAML frontmatter required for all NotebookLM-informed outputs
