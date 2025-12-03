## EXTRACTED INSIGHT

**Title**: [[Brain/AI Extracted Notes/Four-type memory framework for AI agents]]
**Type**: Mental Model / Original Framework
**Source**: YourWay Substack - Understanding Memory Architecture for AI Agents
**Uniqueness**: Eugene's original classification system for organizing agent memory by what aspects of reality they represent
**Extracted By**: AI (insight-extractor agent)
**Extraction Date**: 2025-10-26

---

**Core Insight** (in Eugene's voice):

"When designing memory for an agent, I find it helpful to think about what aspects of reality you want to represent."

Eugene's framework categorizes memory into four types based on what dimension of reality they capture:

---

**The Four Memory Types**:

**1. Snapshot Memory** - Current state representation
- The latest information about something that changes over time
- Examples: Championship rankings, stock positions, latest blood work, user preferences, current project state
- Storage: JSON, JSONB in PostgreSQL, document databases

**2. Temporal Memory** - Time-ordered events
- Shows how things have changed and evolved (the dimension of time)
- Examples: Chat history, last 10 game results, price changes over periods, git commits
- Storage: PostgreSQL with timestamps, time-series databases

**3. Relational Memory** - Knowledge graphs of connections
- Hierarchical information about how entities connect
- Examples: Teams-players relationships, disease-symptom-medication graphs, organizational structure
- Storage: Neo4j, PostgreSQL for simpler graphs

**4. Contextual Memory** - Semantically relevant but imprecise information
- Broadly relevant information via semantic search
- Examples: Relevant tweets, similar doctor notes, past customer interactions
- Storage: Pinecone, Qdrant, Weaviate, pgvector

**Important Note**: "You don't need all four types in every agent. Choose the types that make sense for your specific use case."

---

**Context & Reasoning**:

Eugene developed this framework from building production agents. Rather than organizing by database technology (SQL vs vector vs graph), he organizes by **what aspect of reality** the agent needs to understand:

- Current state (snapshot)
- Change over time (temporal)
- Relationships between things (relational)
- Contextually similar information (contextual)

This mental model makes memory architecture decisions clearer: "What does my agent need to know about reality?" rather than "Which database should I use?"

---

**Potential Connections**:
- [[Brain/AI Extracted Notes/All memory ultimately becomes text in context window]] - Fundamental constraint these types must fit into
- [[Agent architecture]] - How different agent types need different memory combinations
- [[Knowledge representation]] - Different ways to model reality
- [[Database selection]] - Technology choices follow from memory type needs
- [[Context relevance]] - How to determine what matters for agent decisions

**Keywords**: #mental-model #original-framework #ai-agents #memory-architecture #knowledge-representation #ai-extracted
