---
description: Analyze knowledge base structure and update the knowledge-base-analysis.md report
---

Analyze the Obsidian knowledge base structure and regenerate a **condensed, manageable** analysis report.

Follow these steps:

1. Get vault statistics using `mcp__smart-connections__get_stats`
2. List all notes with full directory tree using `Bash` find:
   ```bash
   find $VAULT_BASE_PATH/Brain -name "*.md" -type f | head -50
   ```
3. Use `Glob` to explore directory structure:
   - All notes: `Brain/**/*.md`
   - Permanent notes: `Brain/02-Permanent/*.md`
   - MOCs: `Brain/03-MOCs/*.md`
   - Sources: `Brain/01-Sources/**/*.md`
4. Read key hub notes from major clusters using `Read` tool (Dopamine, Self/Buddhism, Decision-Making, Flow, etc.)
5. Use `mcp__smart-connections__get_similar_notes` to identify highly connected notes
6. Use `mcp__smart-connections__get_connection_graph` to map relationship networks
7. Analyze thematic clusters, hierarchical organization, and conceptual architecture
8. Use `Edit` or `Write` to update the `knowledge-base-analysis.md` file with a **condensed report** (target: ~600-800 lines max):
   - Executive summary with key statistics
   - Hierarchical structure mapping (condensed)
   - 6 major thematic hubs with hub nodes (core thesis + key notes only)
   - Network properties and connectivity (metrics + critical bridges)
   - Content topology and source analysis (top-tier influences only)
   - Intellectual trajectory and maturity assessment (phases + current focus)
   - Recommendations for enhancement (high priority only)

**CRITICAL OUTPUT REQUIREMENTS:**

- **Length target:** 600-800 lines maximum (50% of previous verbose reports)
- **Prioritize:** Core insights, actionable frameworks, critical statistics, key bridge notes
- **Eliminate:** Excessive examples, redundant explanations, verbose elaborations
- **Focus:** What's unique, what's actionable, what's growing, what's next
- **Style:** Bullet points over paragraphs, tables over lists where appropriate
- **No duplication:** Say things once, clearly, then move on

Generate a **condensed, scannable, high-signal** report that reveals the knowledge base's personality, cognitive fingerprint, and growth opportunities without overwhelming detail.
