# The Intelligence Point Audit Framework - Process Design Method

**Type:** Practical Framework / Decision Tool
**Created:** 2025-11-12
**Tags:** #framework #process-design #ai-agents #decision-making #methodology

---

## Purpose

A systematic method for analyzing any business process and making specific decisions about where to introduce AI agents (intelligence points) versus where to use workflow automation.

**Solves:** The question "Should we automate this with AI or workflows?" at each step of a process.

---

## The Four-Step Method

### Step 1: Map the Process Flow

**Task:** Write out the process as a linear sequence of steps.

**Don't decide yet** whether each step needs intelligence or workflow—just capture the flow.

**Example: Hiring Process**
1. Job posting goes live
2. Applications come in
3. Screen resumes
4. Schedule interviews
5. Conduct interviews
6. Make decision
7. Send offer
8. Onboard new hire

---

### Step 2: Score Each Step on 4 Dimensions

Rate each step on a 1-10 scale:

| Dimension | Low Score (1-3) | Mid Score (4-7) | High Score (8-10) |
|-----------|----------------|-----------------|-------------------|
| **Uncertainty** | Highly predictable, routine, known patterns | Some variation, mostly predictable | Novel, variable, unique situations |
| **Judgment Required** | Clear rules exist, mechanical | Some nuance needed | Complex evaluation, intuition needed |
| **Cost of Error** | Low stakes, easily fixable | Moderate impact, recoverable | High stakes, irreversible, critical |
| **Volume** | Rare occurrence (< weekly) | Regular occurrence | High frequency (daily/hourly) |

**Example Scoring:**

| Step | Uncertainty | Judgment | Cost of Error | Volume |
|------|-------------|----------|---------------|--------|
| 1. Post job | 2 | 3 | 4 | 3 |
| 2. Receive applications | 1 | 1 | 1 | 10 |
| 3. Screen resumes | 5 | 7 | 6 | 9 |
| 4. Schedule interviews | 2 | 2 | 3 | 8 |
| 5. Conduct interviews | 8 | 9 | 9 | 5 |
| 6. Make hiring decision | 7 | 10 | 10 | 3 |
| 7. Send offer | 1 | 2 | 8 | 3 |
| 8. Onboard | 3 | 4 | 7 | 5 |

---

### Step 3: Apply Decision Rules

Use scores to classify each step:

#### Intelligence Point (AI Agent) When:

**Condition:** (Uncertainty ≥ 7 OR Judgment ≥ 8) AND Cost of Error ≥ 6

**Why:** Novel/complex situations requiring nuanced judgment with high stakes

**Examples from hiring:**
- Conduct interviews (Uncertainty: 8, Judgment: 9, Cost: 9)
- Make decision (Uncertainty: 7, Judgment: 10, Cost: 10)

#### Workflow (Automation) When:

**Condition:** Uncertainty ≤ 4 AND Judgment ≤ 5

**OR:** Volume ≥ 8 (automation ROI justifies complexity)

**Why:** Predictable, rule-based steps or high-volume repetitive tasks

**Examples from hiring:**
- Receive applications (Volume: 10, low judgment)
- Schedule interviews (low uncertainty, low judgment)
- Send offer (template-based, low judgment)

#### Hybrid (Intelligence → Crystallize → Workflow) When:

**Condition:** Currently high judgment BUT repeating patterns exist

**Why:** Agent can learn the pattern, then codify it into automated scoring/rules

**Examples from hiring:**
- Screen resumes (Judgment: 7) → Agent learns criteria → Becomes scoring model

---

### Step 4: Design the System

Place intelligence points where needed, workflows everywhere else.

**System Design for Hiring:**

```
[Job Post Workflow - Template]
    ↓
[Auto-Collect Applications - Workflow]
    ↓
INTELLIGENCE POINT 1: Resume Screening Agent (→ learns → scoring workflow)
    ↓ (top candidates)
[Schedule Interview Workflow - Calendly automation]
    ↓
INTELLIGENCE POINT 2: Human Interview + AI Note-Taking Agent
    ↓
INTELLIGENCE POINT 3: Decision Synthesis Agent (provides recommendations)
    ↓
[Offer Workflow - Template + review gate]
    ↓
[Onboarding Workflow - Checklist automation]
```

**Result:** 3 intelligence points in 8-step process, with 1 designed to crystallize over time.

---

## Decision Matrix Visualization

```
High Judgment
    │
    │  Hybrid Zone           Intelligence Point
    │  (Learn → Automate)    (AI Agent Required)
    │
────┼────────────────────────────────────────
    │
    │  Workflow              Workflow
    │  (Automation)          (High-volume automation)
    │
Low Judgment

    Low Uncertainty ────────────────→ High Uncertainty
```

---

## Advanced Considerations

### When to Add Human-in-Loop

Even at intelligence points, consider human oversight when:
- Cost of Error = 10 (catastrophic)
- Judgment involves ethics or values
- Legal/regulatory requirements
- Low trust phase (learning period)

**Example:** Hiring decision (Intelligence Point 3) = AI recommendations + human final decision

### When to Deprecate Intelligence Points

An intelligence point can become a workflow when:
1. Pattern has been observed 50+ times
2. Success criteria are now clear
3. Edge cases are documented
4. Confidence in automated decision is high

**Example:** Resume screening agent → After 100 hires, criteria crystallize → Scoring model replaces agent

### Cost-Benefit Analysis

**Intelligence Point Costs:**
- API calls (e.g., $0.01-0.10 per decision)
- Latency (1-10 seconds per decision)
- Unpredictability (variance in output)

**Workflow Costs:**
- Upfront design time
- Brittleness (fails on edge cases)
- Maintenance (updating rules)

**Break-even calculation:**
- If Volume × Intelligence Cost > Workflow Design Cost → Consider workflow
- If Uncertainty is high → Intelligence point ROI increases

---

## Practical Questions This Answers

### "Should we automate this step?"
→ Check Uncertainty and Judgment scores. Low scores = automate.

### "Do we need an AI agent here?"
→ High Uncertainty + High Judgment = yes.

### "Can this agent become a workflow later?"
→ Is it learning a repeating pattern? Hybrid approach.

### "Where's the automation ROI?"
→ High Volume + Low Judgment = workflow wins.

### "What's the risk of automation?"
→ Cost of Error + Uncertainty = need safeguards.

### "How many AI agents should we have?"
→ Minimum needed to handle uncertainty within cost/latency constraints.

---

## Example Applications

### Customer Support Flow

| Step | Unc | Jdg | Cost | Vol | Decision |
|------|-----|-----|------|-----|----------|
| Ticket arrives | 1 | 1 | 1 | 10 | Workflow |
| Route ticket | 6 | 7 | 8 | 10 | **AGENT** |
| Gather info | 3 | 4 | 3 | 10 | Workflow |
| Solve issue | 7 | 8 | 9 | 8 | **AGENT** |
| Verify resolution | 5 | 6 | 7 | 10 | **HYBRID** |

**System:** 2 intelligence points + 1 hybrid, 3 workflows

### Content Publishing Pipeline

| Step | Unc | Jdg | Cost | Vol | Decision |
|------|-----|-----|------|-----|----------|
| Draft submitted | 1 | 1 | 1 | 7 | Workflow |
| Quality check | 6 | 8 | 8 | 7 | **AGENT** |
| Format/style | 2 | 3 | 4 | 7 | Workflow |
| SEO optimize | 5 | 7 | 6 | 7 | **HYBRID** |
| Publish | 2 | 2 | 7 | 7 | Workflow |
| Performance analysis | 7 | 8 | 5 | 7 | **AGENT** |

**System:** 2 intelligence points + 1 hybrid, 3 workflows

---

## Connections

- [[Intelligence Points - Discrete Decision Nodes in Process Flows]] - Theoretical foundation
- [[Intelligence-First vs Workflow-First - Locus of Control in AI Systems]] - Parent paradigm
- [[Hierarchical Systems Need Both Paradigms at Different Layers]] - Why hybrid approach works
- [[Intelligence-First Systems Crystallize Into Workflow-First Components]] - Evolution from agent to workflow
- [[Mental Models Taxonomy]] - Tools for judgment at intelligence points
- [[Mediating Assessments Protocol (MAP)]] - Structured decision-making at intelligence points
- [[Force Ranking Beats Evaluative Judgment]] - Relevant for scoring at intelligence points

---

## Key Insights

1. **Process design becomes explicit placement strategy** - Not "automate everything" but "automate selectively"

2. **Trade-offs become quantifiable** - Each intelligence point has measurable cost/latency/unpredictability

3. **Evolution path is built-in** - Hybrid steps crystallize from intelligence to workflow

4. **Risk is managed systematically** - High cost-of-error steps get appropriate safeguards

5. **ROI becomes calculable** - Volume × Cost per intelligence point vs workflow design cost

---

## Limitations

**This framework assumes:**
- Steps can be mapped linearly (not always true for complex adaptive processes)
- Scoring dimensions are independent (they may interact)
- Patterns will emerge at hybrid steps (not guaranteed)
- Volume/cost/latency can be estimated (requires data)

**Best used for:** Business processes with clear steps, measurable volumes, and identifiable decision points.

**Not suitable for:** Highly emergent systems, creative work with no repeating patterns, exploratory research.

---

## Meta-Framework Insight

This tool operationalizes the deeper principle: **Intelligence and workflow exist on a spectrum defined by uncertainty and judgment requirements.**

The framework gives you a systematic way to place your process at the optimal point on that spectrum given your constraints.

---

## Sources
- Original conversation 2025-11-12
- Process design methodologies
- Decision-making frameworks (Kahneman's Noise, Tetlock's Superforecasting)
- Systems architecture patterns
- Cost-benefit analysis principles
