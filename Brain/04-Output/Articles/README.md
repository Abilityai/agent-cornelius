# Articles Directory

**Location**: `/Brain/04-Output/Articles/`
**Purpose**: Published and draft articles with associated visual assets

---

## Directory Structure

### New Articles (Organized Structure)
Articles created after 2025-10-27 follow this structure:

```
/Articles/
└── [Article-Title]/
    ├── [Article-Title].md        # Main article content
    └── images/                   # Article-specific diagrams
        ├── diagram-1.png
        ├── diagram-2.png
        └── diagram-3.png
```

**Example**:
```
/Articles/
├── The-Dopamine-Economy/
│   ├── The Dopamine Economy - How AI Agents Compete for Attention Like Digital Organisms.md
│   └── images/
│       ├── ivr-dopamine-volatility-line.png
│       ├── agent-lifecycle-attention-utility-area.png
│       └── attention-selection-pressure-mindmap.png
│
└── The-Behavioral-Economics-of-AI-Agents/
    ├── The Behavioral Economics of AI Agents - Why Consistency Doesnt Equal Trust.md
    └── images/
        └── (diagrams specific to this article)
```

### Legacy Articles (Flat Structure)
Older articles remain in flat structure:
- `Confirmation Bias Article.md`
- `Dopamine Article.md`
- `Mental Models Article.md`
- etc.

**Migration**: Can be organized into folders as needed

---

## Naming Conventions

### Article Folders
- **Format**: `[Title-With-Hyphens]/`
- **Examples**:
  - `The-Dopamine-Economy/`
  - `The-Behavioral-Economics-of-AI-Agents/`
  - `Decision-Making-Under-Uncertainty/`

### Image Files
- **Format**: `[topic]-[charttype]-[description].png`
- **Examples**:
  - `attention-selection-mindmap.png`
  - `ivr-dopamine-volatility-line.png`
  - `agent-fitness-comparison-columns.png`
  - `rpe-cycle-flow.png`

### Article Files
- Keep descriptive titles with proper capitalization
- Can include hyphens or spaces (folder structure provides organization)

---

## Image References in Articles

Use relative paths from article to images:

```markdown
![Descriptive Alt Text](./images/diagram-filename.png)
```

**Example**:
```markdown
![IVR Dopamine Volatility Pattern](./images/ivr-dopamine-volatility-line.png)

This chart shows how Intermittent Variable Reinforcement creates
unpredictable dopamine spikes compared to stable baseline...
```

---

## Creating New Articles

### Manual Process

1. **Create folder structure**:
   ```bash
   mkdir -p "/path/to/Articles/[Article-Title]/images"
   ```

2. **Create article markdown**:
   ```bash
   touch "/path/to/Articles/[Article-Title]/[Article-Title].md"
   ```

3. **Generate diagrams** (see Diagram Generator section below)

4. **Add image references** in article markdown

### Using Diagram Generator Agent

The `diagram-generator` sub-agent automates this:

```bash
/task Create diagrams for article on [topic]
```

The agent will:
- Create proper folder structure
- Generate brand-consistent diagrams
- Save images with descriptive names
- Provide markdown references for insertion

---

## Diagram Generator Agent

**Location**: `.claude/agents/diagram-generator.md`

**Capabilities**:
- Generate 20+ chart types (mind maps, flow diagrams, sankey, radar, etc.)
- Apply brand style guide automatically
- Create proper folder structure
- Save images with descriptive filenames
- Provide markdown references

**Usage**:
```bash
# Create diagrams for new article
/task diagram-generator: Create 5 diagrams for my article on [topic]

# Add diagrams to existing article
/task diagram-generator: Generate a sankey diagram showing [concept] for [Article-Name]

# Get visualization recommendations
/task diagram-generator: Suggest diagrams for article about [topic]
```

**Brand Style**:
- Colors: Red (#FF0000), Dark Gray (#363B45), Soft Red (#FFE6E6)
- Theme: Academy (professional, clean)
- Dimensions: 900x600px (standard)
- High contrast for thumbnail readability

---

## Legacy Images Folder

**Location**: `/Articles/images/`

Contains shared diagrams used across multiple articles or created before the organized structure. These can be:
- Referenced by multiple articles
- Moved to specific article folders as needed
- Kept as shared assets library

---

## Article Templates

### Standard Article Structure

```markdown
# Article Title

**Author:** Eugene Kurogo
**Date:** YYYY-MM-DD
**Topic:** [Main Topic]
**Key Concepts:** [Concept 1, Concept 2, Concept 3]

---

## Introduction

[Opening paragraphs...]

![Diagram 1 Description](./images/diagram-1.png)

## Section 1: [Title]

[Content...]

![Diagram 2 Description](./images/diagram-2.png)

## Section 2: [Title]

[Content...]

## Conclusion

[Closing thoughts...]

---

## References & Further Reading

[Sources...]

**Tags:** #tag1 #tag2 #tag3
```

---

## Maintenance

### Adding Images to Existing Articles

1. Navigate to article folder
2. Add images to `images/` subfolder
3. Update article markdown with new references

### Moving Legacy Articles

To migrate an older article:
```bash
mkdir -p "/path/to/Articles/[Article-Title]/images"
mv "[Old-Article].md" "[Article-Title]/[Article-Title].md"
# Move associated images if any
```

### Cleaning Up

Periodically review:
- Unused images in legacy `images/` folder
- Articles that should be organized into folders
- Diagram consistency across articles

---

## Best Practices

1. **One folder per article** (even if no images initially)
2. **Descriptive image filenames** (not "diagram1.png")
3. **Relative image paths** (portable across systems)
4. **Brand-consistent diagrams** (use diagram-generator agent)
5. **Alt text for accessibility** (describe what diagram shows)
6. **Organize as you go** (don't accumulate flat files)

---

## Chart Style Guide

Full style guide available at: `/Brain/05-Meta/chart-style-guide.md`

**Quick Reference**:
- Mind maps: Conceptual relationships
- Flow diagrams: Processes, decisions
- Sankey: Transformations, flows
- Radar: Multi-dimensional comparisons
- Line charts: Trends, volatility
- Scatter plots: Correlations, clustering
- Funnels: Conversion, survival rates

---

## Future Enhancements

Potential improvements:
- [ ] Automated index generation (list all articles with thumbnails)
- [ ] Diagram versioning system
- [ ] Article metadata extraction
- [ ] Cross-article image reuse tracking
- [ ] Publication workflow automation

---

**Last Updated**: 2025-10-27
**Maintained By**: Eugene Kurogo
**Sub-Agent**: `diagram-generator` (for diagram creation)
