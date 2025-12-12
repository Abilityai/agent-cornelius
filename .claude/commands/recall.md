---
description: Retrieve relevant knowledge from Obsidian vault using 3-layer semantic search based on conversation context
argument-hint: <search query or topic>
allowed-tools: Read, mcp__smart-connections__search_notes, mcp__smart-connections__get_similar_notes, mcp__smart-connections__get_connection_graph
---

# Semantic Knowledge Retrieval

You are tasked with retrieving relevant knowledge from the Obsidian vault using multi-layer semantic search.

## Search Query
$ARGUMENTS

## Instructions

1. **First Layer - Initial Search**:
   - Use `mcp__smart-connections__search_notes` with the query above
   - Retrieve top 5 most relevant notes (threshold: 0.5)
   - Use `Read` tool to read the full content of the top 2 results

2. **Second Layer - Direct Associations**:
   - For the top result from layer 1, use `mcp__smart-connections__get_similar_notes`
   - Retrieve 5 semantically similar notes (threshold: 0.6)
   - Use `Read` tool to read the full content of the top 2 similar notes

3. **Third Layer - Extended Network**:
   - Build a connection graph using `mcp__smart-connections__get_connection_graph`
   - Parameters: depth=3, max_per_level=5, threshold=0.65
   - This reveals deeper conceptual connections

## Output Format

Present the findings in this structured format:

```markdown
# Knowledge Recall: [Query Topic]

## Layer 1: Direct Matches
[List notes found with similarity scores and key excerpts]

## Layer 2: First-Degree Associations
[List similar notes with their connections and excerpts]

## Layer 3: Extended Network
[Show the connection graph with relationship strengths]

## Key Insights
[Synthesize the main themes and connections discovered]

## Relevant Content
[Include the most pertinent excerpts from the retrieved notes]
```

## Important Notes
- Focus on quality over quantity
- Highlight unexpected connections
- Provide enough context for the user to understand the relevance
- If search returns no results, try broader terms or related concepts
