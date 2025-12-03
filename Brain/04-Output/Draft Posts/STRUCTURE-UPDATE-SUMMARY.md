# Draft Posts Structure - Documentation Update Summary

**Date:** 2025-10-28
**Action:** Updated all documentation files to reflect new Draft Posts folder structure

---

## New Folder Structure

```
Brain/04-Output/
├── Articles/              [Long-form published articles]
├── Frameworks/            [Original frameworks and models]
├── LinkedIn Insights/     [Published LinkedIn posts]
├── Projects/              [Ongoing projects and research]
└── Draft Posts/           [Platform-ready drafts organized by topic]
    └── [Topic Name]/      [Each post gets own subfolder with all platform versions]
        ├── README.md      [Post metadata and summary]
        ├── [Topic] - Master.md
        ├── [Topic] - LinkedIn Version.md
        ├── [Topic] - Twitter Thread Version.md
        ├── [Topic] - Threads Version.md
        ├── [Topic] - Instagram Version.md
        └── [Topic] - YouTube Version.md
```

---

## Organization Principle

**Each post gets its own topic-named subfolder containing:**
- Master draft with full framework and insights
- Platform-specific versions tailored to each channel's:
  - Character limits
  - Tone and style
  - Format (thread vs single post)
  - Visual requirements
- README.md with metadata, connections, and tags

---

## Files Updated

### 1. ✅ `/knowledge-base-analysis.md`
**Section:** Primary Organization & Information Flow
**Changes:**
- Added Draft Posts subfolder to folder tree
- Updated information flow to include: `→ Draft Posts → Platform Publishing`
- Added platform list: LinkedIn/Twitter/Threads/Instagram/YouTube

---

### 2. ✅ `/Brain/README.md`
**Sections:** Folder Structure, Workflow, Quick Links
**Changes:**
- Added detailed 04-Output subfolder breakdown
- Updated workflow: `→ Draft → Publish → Platform Posts`
- Added Quick Link: `04-Output/Draft Posts/` - Platform-ready drafts (by topic)

---

### 3. ✅ `/.claude/agents/vault-manager.md`
**Section:** Organization Standards
**Changes:**
- Added: `Brain/04-Output/Draft Posts/[Topic Name]/` - Platform-ready drafts organized by topic (each subfolder contains versions for all platforms)
- Ensures agents understand and respect the new structure

---

## Usage Guidelines

### When to Use Draft Posts Folder

**Use Draft Posts when:**
- Creating multi-platform content from knowledge base insights
- Drafting social media posts based on permanent notes or articles
- Preparing content for distribution across channels
- Building content libraries organized by topic

**Workflow:**
1. Synthesize insights from permanent notes
2. Create master draft with full framework
3. Generate platform-specific versions
4. Save all versions in topic-named subfolder
5. Add README with metadata and connections
6. Post to platforms as needed

---

## Example: Grokipedia Post

```
Brain/04-Output/Draft Posts/
└── Grokipedia - Dopamine Economics of Bias/
    ├── README.md
    ├── Grokipedia vs Wikipedia - The Dopamine Economics of Bias.md (Master)
    ├── Grokipedia Post - LinkedIn Version.md
    ├── Grokipedia Post - Twitter Thread Version.md
    ├── Grokipedia Post - Threads Version.md
    ├── Grokipedia Post - Instagram Version.md
    └── Grokipedia Post - YouTube Version.md
```

---

## Benefits

1. **Organization:** Each topic self-contained in own folder
2. **Platform Optimization:** Each version tailored to specific platform requirements
3. **Knowledge Links:** README connects drafts back to source permanent notes
4. **Discoverability:** Easy to find all versions of a post in one place
5. **Scalability:** Can create unlimited topic folders as needed

---

## Agent Awareness

All agents now recognize the Draft Posts structure:
- **Vault Manager:** Knows where to save platform-specific drafts
- **Insight Extractor:** Can suggest posts from extracted insights
- **Connection Finder:** Can surface related notes for post development

---

**Status:** ✅ All documentation updated and synchronized

---

## Update 2025-10-28: LinkedIn Insights Folder Correction

**Issue Identified:** The LinkedIn Insights folder contained 24 extracted insights FROM LinkedIn posts, not posts ready TO publish.

**Actions Taken:**
1. ✅ Moved all 24 files from `04-Output/LinkedIn Insights/` to `AI Extracted Notes/`
2. ✅ Updated documentation to clarify LinkedIn Insights is for posts ready to publish
3. ✅ Updated all references to AI Extracted Notes folder location

**Files Updated:**
- `/knowledge-base-analysis.md` - Updated folder structure and content topology
- `/Brain/README.md` - Added AI Extracted Notes to folder tree
- `/.claude/agents/vault-manager.md` - Added AI Extracted Notes to organization standards

**Clarification:**
- `04-Output/LinkedIn Insights/` - For LinkedIn posts ready to post or already published
- `AI Extracted Notes/` - For insights extracted from LinkedIn and other external sources

---

**Next Step:** Create additional draft posts following this structure
