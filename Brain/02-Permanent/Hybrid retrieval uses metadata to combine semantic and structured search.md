## Hybrid retrieval uses metadata to combine semantic and structured search

**Type**: Synthesis / Technical Framework
**Source**: Understanding Memory Architecture for AI Agents (YourWay Substack, 2025)
**Uniqueness**: Specific implementation pattern for combining retrieval methods effectively

---

**Core Insight**:

Every vector record should include structured metadata:
- user_id for filtering
- timestamp for recency
- category or type for classification
- source_id for linking back to structured data

This allows you to combine semantic search with structured filtering: "Find similar conversations with this specific user in the last 30 days."

The future of agent memory is combining structured databases with vector search. This hybrid approach gives you precise retrieval when you need it, semantic discovery when it helps, and structured metadata linking both systems together.

---

**Context & Reasoning**:

The author synthesizes two retrieval paradigms (guaranteed and probabilistic) into a practical implementation pattern. This isn't just "use both technologies" - it's a specific architectural approach.

**Why hybrid works**:

**Structured metadata provides**:
- Exact filtering (user_id = specific person)
- Temporal constraints (timestamp > 30 days ago)
- Categorical boundaries (type = "support ticket")
- Cross-system linking (source_id connects to main database)

**Vector embeddings provide**:
- Semantic similarity matching
- Conceptual relevance ranking
- Discovery of related content
- Fuzzy pattern matching

**Combined power**:
The metadata constrains the semantic search space, making it both more precise and more efficient.

**Example queries enabled**:
- "Most semantically similar support tickets for user X in last month" (semantic + user + temporal)
- "Related documentation in category Y about topic Z" (semantic + categorical)
- "Similar past decisions by this team on this project" (semantic + relational + temporal)

**Implementation pattern**:
```
Vector record = {
  embedding: [0.234, -0.567, ...],  // Semantic content
  metadata: {
    user_id: "uuid",                // Structured filter
    timestamp: "2025-10-26",        // Temporal filter
    category: "support_ticket",     // Type filter
    source_id: "db_record_123"      // Link to source
  },
  content: "actual text..."
}

Query: Vector search for "login issues"
       WHERE user_id = X
       AND timestamp > 30_days_ago
       AND category = "support_ticket"
```

**The synthesis**: Neither purely semantic nor purely structured - but structured metadata constraining semantic space for best of both.

---

**Potential Connections**:
- [[Three retrieval methods for AI agent memory]] - Hybrid as third method
- [[Brain/02-Permanent/Four-Type Memory Framework for AI Agents]] - Different types need different retrieval
- [[Mental Models]] - Combining frameworks for better results
- [[Trade-offs]] - Hybrid balances precision and discovery
- [[Best of both worlds]] - Synthesis creating new capability

**Keywords**: #synthesis #framework #AI-agents #hybrid-retrieval #metadata #architecture #technical
