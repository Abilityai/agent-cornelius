## Three retrieval methods for AI agent memory

**Type**: Mental Model / Framework
**Source**: Understanding Memory Architecture for AI Agents (YourWay Substack, 2025)
**Uniqueness**: Clear categorization distinguishing databases by retrieval guarantees, not just technology

---

**Core Insight**:

When we talk about databases for AI agents, we're really talking about retrieval methods. There are three fundamental approaches:

1. **Guaranteed Retrieval** (Structured databases): Deterministic, precise - you get exactly what you asked for or nothing. No ambiguity.

2. **Probabilistic Retrieval** (Vector search): Semantic similarity in multidimensional space - you discover conceptually similar content, but cannot rely on finding all relevant matches. The ranking may surprise you.

3. **Hybrid Retrieval** (The emerging standard): Combining structured databases with vector search for both precision and discovery.

Understanding this distinction is crucial for designing effective memory systems.

---

**Context & Reasoning**:

The author reframes the database selection problem from "which technology?" to "which retrieval guarantee?"

**Guaranteed Retrieval** (PostgreSQL, MySQL):
- Best for: User profiles, transaction history, exact facts, time-ordered events
- Use when: Precision is non-negotiable
- Examples: Email address, login timestamp, account status

**Probabilistic Retrieval** (Pinecone, Qdrant, pgvector):
- Best for: Finding conceptually similar conversations, semantic search, discovering patterns
- Use when: You need "similar enough" rather than "exact"
- Metaphor: "Documents as pins on a global map - you shine a light around a location and capture all pins within the illuminated area"
- Limitation: Fundamentally imprecise but incredibly powerful for exploration

**Hybrid Retrieval**:
- Combines precise retrieval when needed with semantic discovery when helpful
- Structured metadata links both systems together
- Most production AI agents use this approach
- Example: "Find similar conversations with this specific user in the last 30 days" (semantic + structured filtering)

The key insight: **Vector search is powerful but imprecise. Don't rely on it alone for facts you must get right.**

---

**Potential Connections**:
- [[Brain/02-Permanent/Four-Type Memory Framework for AI Agents]] - Different memory types suit different retrieval methods
- [[Uncertainty]] - Probabilistic retrieval embraces uncertainty
- [[Trade-offs]] - Precision vs discovery, speed vs completeness
- [[Mental Models]] - Framework for choosing appropriate tools
- [[Causal Thinking makes us believe the world is more predictable than it is]] - Guaranteed retrieval for causal relationships, probabilistic for patterns

**Keywords**: #mental-model #framework #AI-agents #retrieval #databases #precision #probability
