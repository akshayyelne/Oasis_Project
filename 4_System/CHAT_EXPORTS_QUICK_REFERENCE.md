# Chat Exports Integration — Quick Reference

**TL;DR**: Chat exports from Claude and Gemini are now available as optional references for branding engine (thought leadership) and community agent (authentic responses). Both use the existing staging workflow—no changes to primary workflows.

---

## Directory Map

```
1_Source/12_AI_Chats/
├── Claude/              ← Export Claude conversations here
└── Gemini/              ← Export Gemini conversations here

3_Outcome/31_Branding/
├── Linkedin/            ← LinkedIn post drafts (human-reviewed)
│   └── topic_DRAFT.md (with YAML metadata)
└── Portfolio/           ← Portfolio drafts (human-reviewed)
    └── topic_DRAFT.md (with YAML metadata)

3_Outcome/32_Community/
├── Announcement/        ← Community announcements (human-reviewed)
│   └── topic_DRAFT.md (with YAML metadata)
├── Query/               ← Responses to queries (human-reviewed)
│   └── topic_DRAFT.md (with YAML metadata)
└── Response/            ← Responses to announcements (human-reviewed)
    └── topic_DRAFT.md (with YAML metadata)
```

---

## For Branding Engine

### When to Use Chat Exports
- ✅ Portfolio case studies (narrative: problem → exploration → decision → outcome)
- ✅ LinkedIn thought leadership (show decision-making process)
- ✅ "How I think" positioning (philosophy and approach)
- ✅ Product evolution stories (authentic narrative arc)

### Workflow
```
1. Identify relevant chat export in 1_Source/12_AI_Chats/
2. Extract: decision, rationale, thinking process
3. Note: Source folder (Claude/Gemini) and topic before hyphen
4. Draft: LinkedIn post or Portfolio blurb
5. Add YAML header with Date, Source name, Chat Category, Chat Topic
6. Stage to: 3_Outcome/31_Branding/[Linkedin|Portfolio]/[topic]_DRAFT.md
7. Include: **Chat Export Reference**: [filename] - [section]
8. Await: Human review → approval → publication
```

### Example Staged File
```markdown
---
Date: 2026-07-27
Source name: AI_Chats
Chat Category: Gemini
Chat Topic: Home_Care_Labs
---

# Case Study: Home Care Labs Architecture

**Chat Export Reference**: Home_Care_Labs_-_Project_Chat-2026-07-27-11-16-47.md - Architecture Decision

[Your draft content here...]

## Chat Export Evidence
[Relevant excerpt from conversation showing thinking process]
```

### Configuration
Read: `~/.openclaw/agents/branding_engine/CHAT_EXPORTS_CONFIG.md`

---

## For Community Agent

### When to Use Chat Exports
- ✅ "How do you approach X?" (share documented thinking)
- ✅ "What's your philosophy?" (ground in real conversations)
- ✅ "Can you walk me through?" (reference decision process)
- ✅ "What changed your mind?" (show evolution in thinking)

### Workflow
```
1. Receive community query
2. Optional: Reference relevant chat export for context
3. Note: Source folder (Claude/Gemini) and topic before hyphen
4. Draft: Empathetic response with thinking process
5. Add YAML header with Date, Source name, Chat Category, Chat Topic
6. Stage to: 3_Outcome/32_Community/[Announcement|Query|Response]/[topic]_DRAFT.md
7. Include: **Chat Export Reference**: [filename] - [section]
8. Await: Human review and approval → send to community
```

### Example Staged Response
```markdown
# Query Response: Architecture Decision-Making

**Chat Export Reference**: Home_Care_Labs_Chat-2026-07-27.md - Architecture Decision

## Original Query
"How do you make architectural decisions? What's your process?"

## Response

[Empathetic response showing your actual thinking process,
grounded in the documented conversation...]

## Your Approach
When I think about architectural decisions, I consider...
[Reference thinking from chat export]
```

### Configuration
Read: `~/.openclaw/agents/community_agent/CHAT_EXPORTS_CONFIG.md`

---

## Adding New Chat Exports

### Step 1: Export from Claude or Gemini
- Use native export feature (markdown preferred)
- Captures full conversation

### Step 2: Save to Correct Directory
```
1_Source/12_AI_Chats/Claude/    ← Claude conversations
1_Source/12_AI_Chats/Gemini/    ← Gemini conversations
```

### Step 3: Chat Exports Are Ready to Reference
Chat export filenames are in format: `[topic-name]-YYYY-MM-DD-HH-MM-SS.md`

**Examples**:
- `Home_Care_Labs_-_Project_Chat-2026-07-27-11-16-47.md` → Topic: `Home_Care_Labs`
- `Architecture-Decision-2026-07-25-14-30-22.md` → Topic: `Architecture-Decision`
- `Problem-Solving-Process-2026-07-20-09-15-10.md` → Topic: `Problem-Solving-Process`

### Step 4: Reference in Staged Proposals with YAML Metadata
```yaml
---
Date: 2026-07-27
Source name: AI_Chats
Chat Category: Gemini
Chat Topic: Home_Care_Labs
---

**Chat Export Reference**: Home_Care_Labs_-_Project_Chat-2026-07-27-11-16-47.md - Architecture Decision
```

---

## Staging Workflow (The Mandatory Gate)

### All Chat-Export-Informed Content
1. **Drafting Phase**: Create content/response with YAML metadata header and DRAFT suffix
2. **Metadata Phase**: Add YAML frontmatter with Date, Source name, Chat Category, Chat Topic
3. **Reference Phase**: Include `**Chat Export Reference**: [filename] - [section]` line
4. **Review Phase**: Await human review (not automatic)
5. **Approval Phase**: Human decides approve/revise/reject
6. **Application Phase**: Upon approval, content is published/sent

### File Naming Convention & Metadata
```yaml
---
Date: YYYY-MM-DD
Source name: AI_Chats
Chat Category: Claude | Gemini
Chat Topic: [Extracted from filename]
---

# [Insight Title]
```

**Examples**:
- Branding: `home-care-case-study_DRAFT.md` (in `3_Outcome/31_Branding/Portfolio/`)
- Community: `architecture-decisions_DRAFT.md` (in `3_Outcome/32_Community/Response/`)

### Locations
- **Branding drafts**: `3_Outcome/31_Branding/Linkedin/` and `3_Outcome/31_Branding/Portfolio/`
- **Community drafts**: `3_Outcome/32_Community/Announcement/`, `Query/`, and `Response/`

---

## Safety Checklist

Before staging a proposal:

- [ ] Content references actual chat export file (file exists in 1_Source/12_AI_Chats/)
- [ ] YAML metadata header present with all 4 fields (Date, Source name, Chat Category, Chat Topic)
- [ ] Reference line format: `**Chat Export Reference**: [filename] - [topic]`
- [ ] Filename follows convention: `[kebab-case-topic]_DRAFT.md` (no date prefix)
- [ ] File ends with `_DRAFT.md` suffix
- [ ] Content is placed in correct outcome directory
- [ ] No sensitive/private content exposed without permission
- [ ] Thinking process/philosophy accurately reflects conversation
- [ ] Source name derived from folder name (number stripped; e.g., `12_AI_Chats` → `AI_Chats`)
- [ ] Chat Category correctly identified (Claude or Gemini based on source folder)
- [ ] Chat Topic extracted from filename before first hyphen

---

## Common Tasks

### Task: Build Portfolio Case Study from Chat
```
1. Find conversation showing problem → solution → outcome in 1_Source/12_AI_Chats/
2. Note the Chat Category (Claude/Gemini) and Topic (before hyphen)
3. Create: 3_Outcome/31_Branding/Portfolio/[topic]_DRAFT.md
4. Add YAML metadata header
5. Include reference line and case study
6. Await human review
```

### Task: Ground Community Response in Your Thinking
```
1. Find conversation that demonstrates your approach in 1_Source/12_AI_Chats/
2. Note the Chat Category (Claude/Gemini) and Topic (before hyphen)
3. Create: 3_Outcome/32_Community/Response/[topic]_DRAFT.md
4. Add YAML metadata header
5. Include reference line and empathetic response
6. Await human approval
```

### Task: Share Decision-Making Narrative
```
1. Find conversation showing decision trade-offs in 1_Source/12_AI_Chats/
2. Note the Chat Category (Claude/Gemini) and Topic (before hyphen)
3. Draft LinkedIn post
4. Stage to 3_Outcome/31_Branding/Linkedin/[topic]_DRAFT.md
5. Add YAML metadata header
6. Include: **Chat Export Reference**: [filename] - [decision type]
7. Await review → publication
```

### Task: Demonstrate Problem-Solving Approach
```
1. Find conversation similar to community member's problem in 1_Source/12_AI_Chats/
2. Note the Chat Category (Claude/Gemini) and Topic (before hyphen)
3. Extract: framing, exploration, solution
4. Create: 3_Outcome/32_Community/Query/[topic]_DRAFT.md
5. Add YAML metadata header
6. Draft response grounded in this approach
7. Include reference line
8. Await approval → send to community
```

---

## What Changed (2026-07-27 Update)

📝 **Filename format**: Now `[topic]_DRAFT.md` instead of `YYYY-MM-DD_[topic]_DRAFT.md`  
📝 **Metadata header**: All files now start with YAML frontmatter (Date, Source name, Chat Category, Chat Topic)  
📝 **Source paths**: Now `1_Source/12_AI_Chats/` instead of `70_Chat_Exports/`  
📝 **Output paths**: Now `3_Outcome/31_Branding/` and `3_Outcome/32_Community/` with type-specific subdirectories  

## What's NOT Changed

✅ **Primary workflows**: Completely intact  
✅ **Review processes**: Same human gates  
✅ **Constraints**: No auto-publishing (still applies)  
✅ **Personas**: SOUL.md and ENGINE_COMMUNITY.md unchanged  
✅ **Safety guardrails**: All preserved  

---

## Disabling (If Needed)

**To disable chat export references**:
1. Stop referencing `1_Source/12_AI_Chats/` in drafts
2. Optionally delete config files:
   - `~/.openclaw/agents/branding_engine/CHAT_EXPORTS_CONFIG.md`
   - `~/.openclaw/agents/community_agent/CHAT_EXPORTS_CONFIG.md`

**Result**: Zero impact on any workflows. All existing files remain in 3_Outcome/.

---

## Key Files

| File | Purpose | Location |
|------|---------|----------|
| **CHAT_EXPORTS_CONFIG.md** | Integration guide (branding) | `~/.openclaw/agents/branding_engine/` |
| **CHAT_EXPORTS_CONFIG.md** | Integration guide (community) | `~/.openclaw/agents/community_agent/` |
| **CHAT_EXPORTS_INTEGRATION.md** | Complete documentation | `99_System/` |
| **Chat exports** | Your conversations | `1_Source/12_AI_Chats/Claude/` & `/Gemini/` |
| **Branding outputs** | LinkedIn & Portfolio | `3_Outcome/31_Branding/Linkedin/` & `/Portfolio/` |
| **Community outputs** | Announcements & Responses | `3_Outcome/32_Community/[Announcement|Query|Response]/` |

---

## One-Minute Summary

```
Chat Exports are now available as optional references for:
1. Branding Engine → Thought leadership, case studies, positioning
2. Community Agent → Authentic responses, problem-solving narratives

Updated Process (2026-07-27):
1. Export chat from Claude/Gemini → Save to 1_Source/12_AI_Chats/
2. Create draft with YAML metadata header (Date, Source name, Chat Category, Chat Topic)
3. Reference in draft using: **Chat Export Reference**: [filename] - [topic]
4. Stage to 3_Outcome/ with filename format: [topic]_DRAFT.md (no date prefix)
5. Await human review before publication/sending

No changes to workflows. Completely non-breaking. Rollback trivial.
Metadata helps track source origin and chatbot category for all outputs.
```

---

**Last Updated**: 2026-07-27  
**Status**: Ready to Use  
**Configuration**: Complete & Deployed  
**Metadata Format**: YAML frontmatter required for all AI chat exports
