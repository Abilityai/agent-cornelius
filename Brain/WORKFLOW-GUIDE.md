# Knowledge Base Workflow Guide

**Updated:** 2025-10-26
**Status:** Active

## 📁 Folder Structure

```
Brain/
├── 00-Inbox/
│   ├── Quick Captures/           → Fleeting thoughts, quick notes
│   └── Content Extractions/      → Raw content analysis folders
│
├── 01-Sources/
│   ├── Books/                    → Full book notes
│   ├── Articles/                 → Articles, papers
│   └── Videos/                   → Video/podcast notes
│
├── 02-Permanent/                 → Your original atomic insights
│
├── 03-MOCs/                      → Maps of Content (navigation)
│
├── 04-Output/
│   ├── Articles/                 → Published writing
│   ├── LinkedIn Insights/        → All LinkedIn insights
│   └── Frameworks/               → Original frameworks you've developed
│
└── 05-Meta/
    ├── Changelogs/               → Discovery session logs
    └── Templates/                → Note templates
```

## 🔄 Content Extraction Workflow

### Stage 1: Raw Content → Insight Extraction

**When:** You give raw content (article, conversation, video transcript, etc.)

**Process:**
1. Create folder in `00-Inbox/Content Extractions/{Source Name}/`
2. Save raw content as `_RAW.md`
3. AI extracts insights using Insight Extractor agent
4. Each insight saved as separate `.md` file in the folder
5. Create `_EXTRACTION-SUMMARY.md` with overview

**Example:**
```
00-Inbox/Content Extractions/
└── 2025-10-26 Podcast with Naval/
    ├── _RAW.md
    ├── Insight - Specific beats general.md
    ├── Insight - Leverage hierarchy.md
    ├── Insight - Reading is faster than listening.md
    └── _EXTRACTION-SUMMARY.md
```

### Stage 2: Insights → Permanent Notes

**When:** You're ready to integrate insights into knowledge base (can be days/weeks later)

**Process:**
1. Review extraction folder
2. For each insight:
   - Does it connect to existing permanent notes? → Add to those notes
   - Is it genuinely new/original? → Create new permanent note in `02-Permanent/`
   - Is it just interesting but not permanent? → Keep in extraction folder
3. Tag new permanent notes with source: `Source: {extraction folder}`
4. Update relevant MOCs with new permanent notes

### Stage 3: Permanent Notes → Connections

**When:** Periodic connection discovery sessions (weekly/monthly/whenever)

**Process:**
1. Run Connection Finder agent on new permanent notes
2. Use Auto-Discovery agent to find cross-domain patterns
3. Creates changelog in `05-Meta/Changelogs/`
4. Update MOCs with new connections discovered
5. Identify synthesis opportunities

### Stage 4: Connections → Synthesis

**When:** You want to create output (article, LinkedIn insight, framework)

**Process:**
1. Use MOCs to gather related permanent notes
2. Read connection maps from changelogs
3. Draft in `04-Output/{Type}/`
4. Publish and mark as complete

## 🎯 Asynchronous Workflow Rules

**No fixed schedule** - Jump between stages whenever you want:

- Drop raw content → Extract insights when you have time
- Extract insights → Convert to permanent notes when you're ready
- Have existing permanent notes → Run connection discovery anytime
- Find interesting connections → Synthesize into output when inspired

**The system supports:**
- ✅ Long gaps between stages (days, weeks, months)
- ✅ Batch processing (process 5 extraction folders at once)
- ✅ Jumping back (re-analyze old extractions with new knowledge)
- ✅ Parallel work (extract from new content while synthesizing old insights)

## 📝 Note Types & Naming

### Quick Captures
`YYYY-MM-DD Quick thought.md`
→ Fleeting, may never become permanent

### Content Extractions
Folder: `YYYY-MM-DD Source Name/`
Files: `Insight - {Title}.md`

### Sources
`Author - Book Title.md`
`YYYY-MM-DD Article Title - Author.md`

### Permanent Notes
`{Descriptive Title}.md`
Example: `Dopamine rewards uncertainty.md`

### LinkedIn Insights
`YYYY-MM-DD Insight title.md`

### MOCs
`MOC - {Cluster Name}.md`

## 🤖 AI Agent Usage

### Insight Extractor
**When:** Raw content → Insights
**Input:** Raw content file or text
**Output:** Extraction folder with individual insights
**Location:** `00-Inbox/Content Extractions/`

### Connection Finder
**When:** Find connections around specific note/topic
**Input:** Note name or topic
**Output:** Changelog with connections discovered
**Location:** `05-Meta/Changelogs/`

### Auto-Discovery
**When:** Periodic serendipitous discovery
**Input:** Runs autonomously across vault
**Output:** Changelog with non-obvious cross-domain connections
**Location:** `05-Meta/Changelogs/`

### Vault Manager
**When:** Batch operations, cleanup, organization
**Input:** Instructions for CRUD operations
**Output:** Changelog with changes made
**Location:** `05-Meta/Changelogs/`

## 🔍 Finding Things

**By Theme:** Use MOCs in `03-MOCs/`
**By Date:** Check extraction folders or LinkedIn Insights dates
**By Source:** Look in `01-Sources/` or search `Source:` tag
**By Connection:** Read changelogs in `05-Meta/Changelogs/`

## ⚡ Quick Actions

**New raw content to analyze:**
→ Drop in new extraction folder or ping AI with content

**Want to write article:**
→ Check MOC for theme → Read permanent notes → Draft in `04-Output/Articles/`

**Feeling curious:**
→ Run Auto-Discovery agent → Read changelog → Explore connections

**Need specific info:**
→ Use `/recall` or `/search-vault` commands

**Want to see what's new:**
→ Check `05-Meta/Changelogs/` for recent discovery sessions

## 🎨 Philosophy

This system supports your **asynchronous, insight-driven workflow**:
- Capture anytime (Inbox)
- Process when ready (Extractions → Permanent)
- Connect periodically (Agents + MOCs)
- Synthesize when inspired (Output)

No pressure for daily work. No strict progression. Just a clear path for knowledge to flow through when you're ready to work with it.

---

**Last Updated:** 2025-10-26
**Next Review:** When workflow feels friction
