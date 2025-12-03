# Intelligence Points - Discrete Decision Nodes in Process Flows

**Type:** Original Framework / Mental Model
**Created:** 2025-11-12
**Tags:** #ai-agents #process-design #decision-making #systems-architecture #framework

---

## Core Insight

Any complex system can be modeled as a **sequence of workflow executions punctuated by discrete intelligence points**—moments where judgment, adaptation, or non-algorithmic decision-making occurs.

Instead of asking "intelligence-first OR workflow-first?", ask:

**"Where do we place the intelligence points in the process flow?"**

---

## The Model

### Horizontal View (Process Flow)

```
[Workflow] → (Intelligence Point) → [Workflow] → (Intelligence Point) → [Workflow]
```

Think of a river (workflow) with rocks (intelligence points) where water decides which direction to flow.

### Vertical View (Layer Cake)

```
Layer 1: Intelligence (strategic planning)
Layer 2: Workflow (execution steps)
Layer 3: Intelligence (sub-decisions)
Layer 4: Workflow (sub-execution)
... continues recursively
```

### The Fractal Nature

**Zoom out:** System looks intelligence-first (agent exploring)
**Zoom in:** It's workflow-first (executing N8N automation)
**Zoom in more:** Intelligence points (agent choosing which tool)
**Zoom in more:** Workflow-first (tool executes its algorithm)

**At every resolution level, you see both paradigms operating.**

---

## Example: N8N Workflow with Agent Node

```
[N8N Workflow runs] (workflow-first)
    ↓
[Hits Agent Node] (INTELLIGENCE POINT)
    ↓
[Agent has tools that are... more workflows] (workflow-first)
    ↓
[Agent decides which tool to call] (INTELLIGENCE POINT)
    ↓
[That workflow executes] (workflow-first)
    ↓
[Until next decision point...]
```

**The realization:** Even "workflow-first" systems have intelligence points embedded. Even "intelligence-first" agents execute workflows between decisions.

---

## Design Implications

### The Key Question Shifts

From: "Should we use agents or workflows?"

To: **"What's the minimum number of intelligence points needed for this system to adapt effectively?"**

### Why Minimize Intelligence Points?

**Intelligence (agents) is:**
- Expensive (API costs, compute)
- Slow (latency from LLM calls)
- Unpredictable (output variance)

**Workflow (automation) is:**
- Cheap (deterministic code)
- Fast (no API calls)
- Predictable (same input → same output)

**Design goal:** Minimize intelligence points while maximizing system adaptability.

### Design Trade-offs

**More intelligence points:**
- ✅ More adaptive to novel situations
- ✅ Handles edge cases better
- ❌ Higher cost and latency
- ❌ More unpredictable behavior

**Fewer intelligence points:**
- ✅ Faster, cheaper, more predictable
- ✅ Easier to audit and debug
- ❌ Brittle in novel situations
- ❌ Requires more upfront design

---

## The Intelligence Point Audit Framework

Practical method for analyzing where to place intelligence points in any business process.

### Step 1: Map Process Flow

Write the process as a linear sequence (don't decide intelligence vs workflow yet).

### Step 2: Score Each Step (1-10 scale)

| Dimension | Meaning |
|-----------|---------|
| **Uncertainty** | How predictable/variable is this step? |
| **Judgment Required** | How much nuanced evaluation needed? |
| **Cost of Error** | How bad if this step fails? |
| **Volume** | How frequently does this happen? |

### Step 3: Apply Decision Rules

**Use Intelligence Point when:**
- Uncertainty ≥ 7 OR Judgment ≥ 8
- AND Cost of Error ≥ 6

**Use Workflow when:**
- Uncertainty ≤ 4 AND Judgment ≤ 5
- OR Volume ≥ 8 (automation ROI justifies even complex workflow)

**Use Hybrid (Intelligence → Crystallize → Workflow) when:**
- Currently requires judgment BUT patterns are emerging
- Agent learns → Codifies rules → Becomes automated workflow

### Step 4: Design System

Place intelligence points (agents) at high-score steps, workflows everywhere else.

---

## Example Application: Customer Support System

**Process:**
1. Ticket arrives
2. Route to category
3. Gather required info
4. Attempt solution
5. Verify resolution

**Analysis:**

| Step | Uncertainty | Judgment | Cost of Error | Volume | Decision |
|------|-------------|----------|---------------|--------|----------|
| 1. Arrive | 1 | 1 | 1 | 10 | Workflow (auto-capture) |
| 2. Route | 6 | 7 | 8 | 10 | **INTELLIGENCE POINT** |
| 3. Gather info | 3 | 4 | 3 | 10 | Workflow (form automation) |
| 4. Solution | 7 | 8 | 9 | 8 | **INTELLIGENCE POINT** |
| 5. Verify | 5 | 6 | 7 | 10 | **INTELLIGENCE POINT** (→ learns → workflow) |

**System Design:**

```
[Auto-capture]
    → INTELLIGENCE: Route ticket (Agent)
    → [Gather info workflow]
    → INTELLIGENCE: Diagnose & solve (Agent)
    → INTELLIGENCE: Verify resolution (Agent → learns patterns → automated checks)
```

**Result:** 3 intelligence points in a 5-step process, with 1 designed to crystallize into workflow over time.

---

## Key Questions This Framework Answers

✅ **"Should we automate this step?"**
- Check uncertainty and judgment scores

✅ **"Do we need an AI agent here?"**
- High uncertainty + high judgment = yes

✅ **"Can this agent become a workflow later?"**
- Is it learning a repeating pattern? → Hybrid approach

✅ **"Where's the ROI?"**
- High volume + low judgment = automation wins

✅ **"What's the risk?"**
- Cost of error + uncertainty = need safeguards (human-in-loop, constraints)

✅ **"How many intelligence points should we have?"**
- Minimum needed to handle uncertainty while keeping costs/latency acceptable

---

## Connections

- [[Intelligence-First vs Workflow-First - Locus of Control in AI Systems]] - Parent framework
- [[Hierarchical Systems Need Both Paradigms at Different Layers]] - Why both are needed
- [[Intelligence-First Systems Crystallize Into Workflow-First Components]] - How intelligence points become workflows over time
- [[The Folder Paradigm]] - How agents store context between intelligence points
- [[Dopamine and Uncertainty]] - Why uncertainty requires intelligence (pattern matching under ambiguity)
- [[Decision-Making Under Uncertainty]] - Related to when intelligence points are needed
- [[Mental Models Taxonomy]] - Tools/frameworks for judgment at intelligence points

---

## Implications

1. **System design becomes placement strategy** - Where to insert intelligence points
2. **Cost-performance trade-offs become explicit** - Each intelligence point has quantifiable cost/latency
3. **Evolution path becomes clear** - Intelligence points can crystallize into workflows
4. **Debugging becomes targeted** - Issues trace to specific intelligence points or workflow steps
5. **Hybrid systems become default** - Pure intelligence-first or workflow-first are edge cases

---

## Meta-Insight

This framework reveals that **intelligence-first vs workflow-first isn't a binary choice but a spectrum defined by density of intelligence points**.

- **High density** (intelligence point every few steps) = Intelligence-first system
- **Low density** (intelligence points rare) = Workflow-first system
- **Variable density** (intelligence where needed) = Optimal hybrid system

**The architecture question becomes:** "What's the optimal intelligence point density for this process given our constraints (cost, speed, adaptability requirements)?"

---

## Sources
- Original conversation 2025-11-12
- Process design theory
- Systems architecture patterns
- Decision-making frameworks (Kahneman, Tetlock)
