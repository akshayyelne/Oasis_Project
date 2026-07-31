# GitHub Integration Reference Card

**Print this. Keep it handy.**

---

## 🎯 Your Role

**You** approve or reject proposals from agents that reference GitHub knowledge base (284+ indexed files).

---

## 📚 The 3 Essential Reads (In Order)

| Priority | File | Read Time | What It Is |
|----------|------|-----------|-----------|
| 1 | `60_GitHub_Staging/QUICK_START.md` | 10 min | Overview + how to use |
| 2 | `agents/branding_engine/GITHUB_REFERENCE_CONFIG.md` | 15 min | Branding engine setup |
| 3 | `agents/community_agent/GITHUB_REFERENCE_CONFIG.md` | 15 min | Community agent setup |

---

## 📁 Where Things Live

```
GitHub Data:
  agents/branding_engine/tools/github_ingest/output/latest_github_ingest.md

Branding Config:
  agents/branding_engine/GITHUB_REFERENCE_CONFIG.md

Community Config:
  agents/community_agent/GITHUB_REFERENCE_CONFIG.md

YOUR REVIEW:
  Oasis_Project/60_GitHub_Staging/branding/      ← Proposals
  Oasis_Project/60_GitHub_Staging/community/     ← Responses
  Oasis_Project/60_GitHub_Staging/.archive/      ← History
```

---

## 🔄 Your Weekly Workflow

### Friday (20 minutes)

```
1. Check 60_GitHub_Staging/branding/
   - Any new proposals? (*.md files)
   
2. Check 60_GitHub_Staging/community/
   - Any new responses? (*.md files)

3. For EACH file:
   ✓ Read it
   ✓ Check GitHub reference
   ✓ Decide: APPROVE / REVISE / REJECT

4. Archive decision:
   - APPROVED → Move to .archive/[date]/[name]_APPROVED.md
   - REVISE → Add comments, copy to .archive/[date]/[name]_REVISE.md
   - REJECT → Copy to .archive/[date]/[name]_REJECTED.md

5. For APPROVED content:
   - Branding: Move to Oasis_Project/30_Branding/
   - Community: Mark as sent to community
```

---

## ✅ Approval Checklist

### Before Approving Branding Proposal
- [ ] GitHub reference is accurate?
- [ ] Authentic to actual code/approach?
- [ ] Maintains Buzz & Echo persona?
- [ ] Portfolio-appropriate tone?
- [ ] No sensitive code exposed?

### Before Approving Community Response
- [ ] Answers their actual question?
- [ ] Empathetic and clear?
- [ ] GitHub evidence accurate?
- [ ] No private code exposed?
- [ ] Ready to send?

---

## 📝 What You'll See

### Branding Proposal Example
```
File: 2026-07-22_async-patterns_linkedin_DRAFT.md

Contains:
- Proposed LinkedIn post
- GitHub reference (what code inspired it)
- Why it matters
- Your approval checkboxes
```

### Community Response Example
```
File: 2026-07-22_error-handling_DRAFT.md

Contains:
- Original query summary
- Proposed response (ready to send)
- GitHub code example
- Your approval checkboxes
```

---

## 🎯 Quick Decisions

### "This is great"
```bash
# Branding: Move to 30_Branding/
mv "60_GitHub_Staging/branding/DATE_topic_DRAFT.md" \
   "30_Branding/DATE_topic.md"
   
# Community: Mark approved, send
Archive to: .archive/[date]/[name]_APPROVED.md
```

### "Needs changes"
```
Add comment to file with feedback
Wait for agent to re-draft (or manually fix)
Re-submit for review
```

### "Not using this"
```
Archive to: .archive/[date]/[name]_REJECTED.md
Move on
```

---

## 🔐 Safety Principles

✅ **Nothing auto-publishes** - You approve first  
✅ **Nothing auto-applies** - You decide everything  
✅ **Privacy protected** - Human verifies code before exposure  
✅ **Easy to disable** - Just don't use it  
✅ **Easy to roll back** - Just reject it  

---

## ⚡ Quick Commands

### Update GitHub data (weekly optional)
```bash
cd C:\Users\aksha\.openclaw\agents\branding_engine\tools\github_ingest
node index.js
```

### Check what's waiting for review
```bash
ls C:\Users\aksha\Oasis_Project\60_GitHub_Staging\branding/
ls C:\Users\aksha\Oasis_Project\60_GitHub_Staging\community/
```

### See your approval history
```bash
ls C:\Users\aksha\Oasis_Project\60_GitHub_Staging\.archive/[DATE]/
```

---

## 📊 By the Numbers

- **GitHub Files Indexed**: 284+
- **Documentation Written**: 10,000+ lines
- **Prompt Templates**: 9 (4 branding, 5 community)
- **Configuration Files**: 2 (branding + community)
- **Your Staging Directories**: 4 (branding, community, archive + root)
- **Non-breaking Changes**: 0 (everything is add-on)

---

## 🚀 First Time Using This

### You:
1. Read QUICK_START.md (10 min)
2. Skim README.md in this directory (5 min)
3. See agent use GitHub reference in a draft
4. Review and approve in 60_GitHub_Staging/
5. Move approved content to final location
6. Archive decision

### Result:
✅ You understand the flow  
✅ You control all approvals  
✅ Nothing breaks existing workflows  

---

## 💡 Key Concepts

**GitHub Reference**: The consolidated knowledge base (latest_github_ingest.md) containing 284+ indexed files from your repositories

**Staged Proposal**: A draft (LinkedIn post, portfolio blurb, community response) that references GitHub and awaits your approval

**Staging Directory**: Safe holding area for all GitHub-informed proposals before you decide

**Archive**: Historical record of your approval/revision/rejection decisions

**Non-Breaking**: Primary workflows (20_Tech_Notes → branding, queries → community) continue exactly unchanged

---

## 🔗 Where to Get Help

| Question | File |
|----------|------|
| "How do I use this?" | QUICK_START.md (this directory) |
| "How does staging work?" | README.md (this directory) |
| "How do I configure branding?" | agents/branding_engine/GITHUB_REFERENCE_CONFIG.md |
| "How do I configure community?" | agents/community_agent/GITHUB_REFERENCE_CONFIG.md |
| "Show me everything" | agents/branding_engine/GITHUB_INTEGRATION_GUIDE.md |
| "What was created?" | SETUP_SUMMARY.md (this directory) |

---

## ⏰ Time Commitments

- **Initial Setup**: ✅ Already done
- **First Read**: 30-40 minutes total
- **Weekly Review**: ~15-20 minutes
- **Per Proposal**: 3-5 minutes to review
- **Optional Deep Dive**: 45-60 minutes for full guide

---

## 🎯 Next 24 Hours

- [ ] Read this reference card (you're doing it!)
- [ ] Read QUICK_START.md (10 min)
- [ ] Read GITHUB_REFERENCE_CONFIG.md for one engine (15 min)
- [ ] You're ready to use it

---

## 🛡️ The Safety Promise

**I promise:**
✅ Nothing is automatic  
✅ Everything staged first  
✅ You approve everything  
✅ No privacy leaks  
✅ Easy to disable  

**You get:**
✅ Full control  
✅ Clear workflow  
✅ Time to review  
✅ Easy to reject  
✅ Primary workflows unchanged  

---

**Status**: ✅ READY TO USE  
**Date**: 2026-07-22  
**Your Next Step**: Read QUICK_START.md

---

## One-Line Summary

Your agents can now reference your GitHub codebase (284+ files) to enhance branding and community content, with all proposals staged for your human review before application.

**Everything requires your approval. Nothing is automatic.**

---
