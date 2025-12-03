## Four-Type Memory Framework for AI Agents

**Type**: Mental Model / Original Framework
**Source**: Understanding Memory Architecture for AI Agents (YourWay Substack, 2025)
**Uniqueness**: Original taxonomy organizing memory by what aspect of reality it represents

---

**Core Insight**:

When designing memory for an AI agent, think about what aspects of reality you want to represent. The four fundamental memory types are:

1. **Snapshot Memory**: Current, correct representation of dynamic process state (the "right now" photograph)
2. **Temporal Memory**: Time-ordered events showing how things have changed and evolved (the dimension of time)
3. **Relational Memory**: Knowledge graphs representing relationships between objects and concepts (hierarchical connections)
4. **Contextual Memory**: Broadly relevant but imprecise information retrieved through semantic search (exploratory context)

You don't need all four types in every agent - choose what makes sense for your specific use case.

---

**Context & Reasoning**:

This framework emerged from building production AI agents. The author observed that different use cases required different representations of reality:

**Snapshot Memory** (JSON/JSONB in PostgreSQL):
- Championship rankings for sports betting
- Current stock positions for trading
- Latest medical results
- User preferences and settings

**Temporal Memory** (PostgreSQL with timestamps):
- Chat history (last 10 messages)
- Recent game results for analysis
- Price changes over time periods
- Git commit history

**Relational Memory** (Neo4j, PostgreSQL):
- Sports teams and player relationships
- Disease-symptom-medication graphs
- Organizational structures
- Product dependencies

**Contextual Memory** (Vector databases):
- Similar past conversations
- Related documentation sections
- Previous decisions in similar contexts
- Tweets about topics under discussion

The framework helps designers select the right memory architecture by clarifying **what aspect of reality** needs to be represented, not just **what technology** to use.

---

**Potential Connections**:
- [[Mental Models]] - Original taxonomy for problem-solving
- [[Cynefin Framework]] - Different contexts require different approaches
- [[Brain/02-Permanent/All memory ultimately becomes text in context window]] - These types all compress to context
- [[Knowledge graphs]] - Relational memory formalized
- [[Reference Frames]] - Different memory types provide different perspectives on reality

**Keywords**: #mental-model #framework #AI-agents #taxonomy #architecture #original-thinking
