## Inconsistent document types in vector storage creates semantic mess

**Type**: Experience-Based Wisdom / Pattern Recognition
**Source**: Understanding Memory Architecture for AI Agents (YourWay Substack, 2025)
**Uniqueness**: Hard-won lesson about vector database organization from production experience

---

**Core Insight**:

Storing different types of content in the same vector store leads to unpredictable results. Mixing user preferences, chat history, and documentation creates a semantic mess.

The fix: Store consistent types in each vector collection. "User preferences" in one, "documentation" in another.

Each vector database or table should contain the same type of information formatted consistently.

---

**Context & Reasoning**:

This insight emerged from debugging production AI agents with poor retrieval performance. The author discovered that mixing document types in vector storage causes:

**Why mixing types fails**:

1. **Semantic confusion**: "Update my settings" could match user preferences, past settings changes, or documentation about settings - all semantically similar but functionally different.

2. **Unpredictable relevance ranking**: A user preference might rank higher than critical documentation because the embedding similarity is higher, even when documentation is what's needed.

3. **Context pollution**: Irrelevant document types contaminate results, reducing precision.

**The solution - Type consistency**:
- One collection/table for user facts (all structured the same way)
- Separate collection for documentation (all formatted consistently)
- Another for chat history (consistent message structure)
- Each collection has homogeneous content

**Benefits of separation**:
- Predictable retrieval behavior
- Better relevance ranking within type
- Ability to target specific collections for specific queries
- Cleaner metadata structure per type

**Best practice**: If you're storing user facts, all records should be facts. If you're storing documentation, all records should be documentation. Don't mix them.

---

**Potential Connections**:
- [[Three retrieval methods for AI agent memory]] - Probabilistic retrieval needs structure
- [[Vector search is like shining light on a map]] - Mixed types = pins representing different things
- [[Mental Models]] - Organizing by type improves retrieval
- [[Confirmation Bias]] - Mixed types confirm wrong patterns
- [[Categorization]] - Proper categories improve thinking
- [[Reference Frames]] - Each document type provides different reference frame

**Keywords**: #experience-wisdom #pattern #AI-agents #vector-search #organization #best-practice
