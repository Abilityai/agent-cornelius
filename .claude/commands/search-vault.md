---
description: Quick search across Obsidian vault using keywords or semantic similarity
argument-hint: <search query>
allowed-tools: Read, Grep, mcp__smart-connections__search_notes
---

# Quick Vault Search

Search the Obsidian vault using both semantic and keyword-based search.

## Query
$ARGUMENTS

## Instructions

1. **Semantic Search** - Use `mcp__smart-connections__search_notes`:
   - Query: $ARGUMENTS
   - Limit: 5 results
   - Threshold: 0.5

2. **Keyword Search** - Use `Grep`:
   - Pattern: $ARGUMENTS
   - Path: $VAULT_BASE_PATH/Brain
   - Output mode: "files_with_matches" to get file list
   - Then use output mode: "content" with -C flag for context

3. **Retrieve Content** - For the top result from semantic search:
   - Use `Read` tool to get full content

## Output Format

```markdown
# Search Results: "$ARGUMENTS"

## Semantic Matches
[Top 5 notes with similarity scores]

## Keyword Matches
[Top 5 notes with context snippets from Grep]

## Top Result Content
[Full content of the most relevant note]
```

Keep results concise and actionable. Highlight the most relevant findings.
