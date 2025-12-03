# Chart Style Guide for Articles
**Based on YouTube Thumbnail Visual Guide**
**Created:** 2025-10-27

---

## Core Visual Style for Charts

### Color Palette
- **Primary Colors**:
  - Soft red (#FFE6E6) - for backgrounds or accent elements
  - Bright red (#FF0000) - for strategic highlights, important nodes
  - Dark gray (#363B45) - for text, primary data
  - Light gray (#F0F0F0) - for backgrounds, secondary elements
  - White (#FFFFFF) - for cards, contrast

- **Data Visualization Colors**:
  - Primary data: Dark gray (#363B45)
  - Emphasis data: Red (#FF0000)
  - Secondary data: Medium gray (#9CA3AF)
  - Tertiary data: Light gray (#D1D5DB)

### Design Principles for Charts
- **High contrast** for readability even when scaled down
- **Clean, modern aesthetic** with plenty of negative space
- **Professional, tech-forward appearance**
- **Minimal yet impactful** - no chart junk
- **Layered depth** using subtle shadows and overlays
- **Rounded corners** (10-15px radius) for softer feel on cards/boxes

### Theme Selection
- **Preferred theme**: `academy` (professional, clean)
- **Alternative themes**: `default` (when academy unavailable), `dark` (for dark mode content)
- **Background**: Always use light backgrounds or transparent

### Dimensions
- **Standard size**: 900x600px (3:2 ratio)
- **Large diagrams**: 1200x800px for complex networks/flows
- **Compact diagrams**: 700x500px for simple concepts
- **Always maintain aspect ratio** for consistency

---

## Chart Type Guidelines

### Mind Maps
```json
{
  "theme": "academy",
  "width": 900,
  "height": 600,
  "style": {
    "backgroundColor": "#FFFFFF",
    "palette": ["#FF0000", "#363B45", "#9CA3AF", "#FFE6E6", "#D1D5DB"]
  }
}
```
**Use for**: Conceptual relationships, taxonomy, domain exploration

### Flow Diagrams
```json
{
  "theme": "academy",
  "width": 900,
  "height": 600,
  "style": {
    "texture": "default"
  }
}
```
**Use for**: Processes, decision trees, state transitions

### Fishbone Diagrams
```json
{
  "theme": "academy",
  "width": 900,
  "height": 600
}
```
**Use for**: Cause-effect analysis, multi-factor exploration

### Sankey Diagrams
```json
{
  "title": "[Clear, Descriptive Title]",
  "theme": "academy",
  "width": 900,
  "height": 600,
  "style": {
    "backgroundColor": "#FFFFFF",
    "palette": ["#FF0000", "#FFE6E6", "#363B45", "#9CA3AF", "#D1D5DB"]
  }
}
```
**Use for**: Flows, transformations, pathways, resource allocation

### Column/Bar Charts
```json
{
  "title": "[Chart Title]",
  "axisXTitle": "[X-axis label]",
  "axisYTitle": "[Y-axis label]",
  "theme": "academy",
  "width": 900,
  "height": 600,
  "group": true,
  "style": {
    "backgroundColor": "#FFFFFF",
    "palette": ["#363B45", "#FF0000", "#9CA3AF"]
  }
}
```
**Use for**: Comparisons, categorical data, before/after

### Network Graphs
```json
{
  "theme": "academy",
  "width": 900,
  "height": 600,
  "style": {
    "texture": "default"
  }
}
```
**Use for**: Relationships, dependencies, interconnected systems

### Radar Charts
```json
{
  "title": "[Comparison Title]",
  "theme": "academy",
  "width": 900,
  "height": 600,
  "style": {
    "backgroundColor": "#FFFFFF",
    "palette": ["#363B45", "#FF0000"],
    "lineWidth": 3
  }
}
```
**Use for**: Multi-dimensional comparisons, archetypes, profiles

---

## Typography for Charts

### Text Guidelines
- **Titles**: Bold, clear, descriptive (not generic)
- **Axis labels**: Concise, specific units
- **Data labels**: Only when necessary for clarity
- **Node labels**: Short phrases, line breaks for readability

### Text Hierarchy
1. **Primary**: Chart title (largest, bold)
2. **Secondary**: Axis titles, section headers
3. **Tertiary**: Data labels, annotations

---

## Layout Principles

### Composition
- **Text/data occupies 60-70% of space**
- **Maintain 30-40% negative space** minimum
- **Position elements slightly off-center** for dynamic feel
- **Left-to-right reading flow** where applicable

### Visual Balance
- Avoid overcrowding nodes or data points
- Use strategic spacing between elements
- Group related concepts visually
- Create clear visual hierarchy

---

## Standard Palette Configurations

### High Contrast (Default)
```json
"palette": ["#FF0000", "#363B45", "#FFE6E6", "#9CA3AF", "#D1D5DB"]
```

### Emphasis Variant
```json
"palette": ["#363B45", "#FF0000", "#F0F0F0", "#9CA3AF"]
```

### Gradient-Friendly
```json
"palette": ["#FFE6E6", "#FF0000", "#363B45", "#F0F0F0", "#9CA3AF"]
```

---

## Quality Checklist

Before finalizing any chart:
- [ ] Readable at 50% size (thumbnail test)
- [ ] High contrast between elements
- [ ] Brand colors properly implemented
- [ ] Clean, professional appearance
- [ ] Proper dimensions (900x600 standard)
- [ ] Strategic use of negative space
- [ ] Consistent visual hierarchy
- [ ] Modern, tech-forward aesthetic
- [ ] No chart junk or unnecessary decoration

---

## Common Mistakes to Avoid

1. **Too many colors**: Stick to 3-5 colors maximum
2. **Low contrast**: Always test at smaller sizes
3. **Cluttered layout**: Respect negative space
4. **Generic titles**: Use descriptive, specific titles
5. **Inconsistent styling**: Use this guide for ALL charts

---

## Example Configurations by Article Section

### Section 1: Conceptual Introduction
**Chart type**: Mind map or network graph
**Style**: High contrast, clean
**Focus**: Relationships between domains

### Section 2: Process/Mechanism
**Chart type**: Flow diagram or Sankey
**Style**: Linear, clear progression
**Focus**: Steps, transformations

### Section 3: Comparison/Analysis
**Chart type**: Column/bar or radar
**Style**: Data-focused, precise
**Focus**: Quantitative comparisons

### Section 4: Cause-Effect
**Chart type**: Fishbone or network
**Style**: Analytical, hierarchical
**Focus**: Contributing factors

---

## Usage Instructions

1. **Choose appropriate chart type** for content
2. **Apply standard configuration** from this guide
3. **Customize data** while maintaining style
4. **Test readability** at thumbnail size
5. **Save with descriptive filename**: `topic-charttype-description.png`
6. **Store in**: `/Brain/04-Output/Articles/images/`

---

**Version**: 1.0
**Last Updated**: 2025-10-27
**Based on**: YouTube Thumbnail Visual Guide (Eugene Personal Brand)
