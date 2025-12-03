# Intelligence-First vs Workflow-First - Locus of Control in AI Systems

**Type:** Mental Model / Framework
**Created:** 2025-11-12
**Tags:** #ai-agents #architecture #decision-making #control #mental-model

---

## Core Distinction

There are two fundamental paradigms for building agentic AI systems, differing in **who/what controls the decision algorithm**:

### Workflow-First (Human Algorithm)
- **Human defines:** Sequence, decision points, fallbacks, execution flow
- **AI executes:** Within predetermined paths
- **Control mechanism:** Explicit, predictable, auditable
- **Mental model:** AI as powerful tool within human-designed machine
- **Example:** LangGraph, CrewAI with predefined workflows

### Intelligence-First (AI Algorithm)
- **Human defines:** Goals, constraints, context, values, principles
- **AI decides:** Approach, sequence, adaptation, tool selection
- **Control mechanism:** Implicit through instructions + feedback loops
- **Mental model:** AI as autonomous agent with judgment authority
- **Example:** Claude Code, Devin, autonomous CLI agents

---

## What This Reveals

### Locus of Intelligence

The choice reveals fundamental assumptions about:

1. **Knowability:** Can we anticipate all scenarios?
2. **Controllability:** Must we specify every decision point?
3. **Agency:** Who/what should have judgment authority?
4. **Trust:** Through transparency (workflow) or alignment (intelligence)?

### Underlying Beliefs

**Workflow-first assumes:**
- Humans are better at strategic decomposition
- Predictability > optimality
- Failure modes should be designed, not discovered
- Trust requires transparency

**Intelligence-first assumes:**
- AI can discover better approaches than humans pre-specify
- Adaptability > predictability
- Emergence is acceptable (even desirable)
- Trust through alignment + observation

---

## The Real Question

The debate over "agentic frameworks" obscures the deeper question:

**Not "how do we build agents?" but "who decides how agents decide?"**

This is a **meta-architectural choice** that shapes everything downstream—not a technical implementation detail.

---

## Cross-Domain Pattern

This maps to a universal pattern: **SPECIFY (workflow) vs CONSTRAIN (intelligence)**

- **Military:** Detailed orders → Mission command (intent-based)
- **Organizations:** Command-and-control → OKRs (outcomes not tactics)
- **AI Systems:** Rule-based → Constitutional AI (principles not rules)
- **Parenting:** Specific instructions → Values/principles
- **Physics:** Newtonian determinism → Quantum uncertainty
- **Psychology:** Explicit rules → Implicit learning

**The recurring shift:** From controlling HOW to defining WHY

---

## Connections

- [[Intelligence-First Systems Crystallize Into Workflow-First Components]] - Intelligence generates procedures
- [[Hierarchical Systems Need Both Paradigms at Different Layers]] - Fractal control pattern
- [[Context Engineering vs Prompt Engineering]] - Related control paradigm shift
- [[The Folder Paradigm]] - Intelligence-first architecture example
- [[AI Constitutional Enforcement]] - Constraint-based control mechanism

---

## Implications

1. **Architecture choice is epistemological**, not just technical
2. **Both paradigms are necessary** at different system layers
3. **The question isn't either/or** but when/where to apply each
4. **Trust mechanisms differ fundamentally** between paradigms
5. **Control through constraint** (intelligence-first) scales better than control through specification (workflow-first)

---

## Sources
- Original conversation 2025-11-12
- Observed patterns in Claude Code, LangGraph, CrewAI architectures
