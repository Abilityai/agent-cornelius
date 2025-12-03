# ReAct Pattern - Reasoning and Acting Create Synergistic Loop

**Source**: ReAct: Synergizing Reasoning and Acting in Language Models (arXiv 2210.03629, ICLR 2023)
**Authors**: Multiple (foundational work widely adopted 2024-2025)
**Year**: 2023 (foundational), 2024-2025 (widespread adoption)
**Document Type**: Research Paper
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agents Research 2024-2025

---

## Core Insight

ReAct combines chain-of-thought (CoT) reasoning with external tool use in an **alternating pattern** where reasoning traces help induce, track, and update action plans while actions allow interfacing with external sources for additional information. This creates **greater synergy** than either reasoning or acting alone, overcoming hallucination and error propagation through environmental feedback.

---

## Context & Evidence

**ReAct Formal Pattern** (Thought → Action → Observation cycle):
1. **Thoughts**: Verbalized CoT reasoning steps decompose larger tasks into manageable subtasks
2. **Actions**: Predefined tools, API calls, external source gathering (search engines, knowledge bases)
3. **Observations**: Model reevaluates progress, delivers final answer or informs next thought

**Key Mechanism**:
- **Reasoning → Acting**: Thoughts help plan and track actions
- **Acting → Reasoning**: Observations from actions inform subsequent reasoning
- **Bidirectional feedback**: External environment grounds reasoning in reality

**Performance Results**:
- **HotpotQA & Fever benchmarks**: Overcomes hallucination by interacting with Wikipedia API
- **Error recovery**: Environmental feedback corrects reasoning errors
- **Exception handling**: Actions reveal edge cases, reasoning adapts strategy

**Recent Enhancement (2024-2025): Pre-Act**:
- Multi-step planning and reasoning improves LLM agent performance
- Fine-tuning strategy allows smaller models to achieve performance comparable to larger LLMs
- Lower latency and cost while maintaining effectiveness

---

## Context & Evidence (Continued)

**Why ReAct Works**:

**Problem with Pure Reasoning**:
- Chain-of-thought alone can hallucinate facts
- No grounding in external reality
- Error propagation through reasoning chains

**Problem with Pure Acting**:
- Tools/actions without reasoning lack strategic planning
- No decomposition of complex tasks
- Reactive rather than proactive

**ReAct Synergy**:
- **Reasoning provides**: Task decomposition, strategy, error detection, plan updates
- **Acting provides**: Ground truth, factual information, environmental feedback
- **Together**: Reasoning plans what to do; acting validates assumptions; cycle continues

**Critical Insight**: The **alternating pattern** is key. Not reasoning THEN acting, but reasoning → acting → reasoning → acting in iterative cycles. Each informs the other.

---

## Connections to Knowledge Base

- **[[Context engineering replaces prompt engineering]]** - ReAct is architectural pattern for providing dynamic context via tool results
- **[[Design agents to function without memory then enhance]]** - ReAct enables stateless operation (each cycle self-contained)
- **Buddhism → AI**: ReAct mirrors Buddhist teaching of **direct experience** (observation) correcting **conceptualization** (reasoning)
- **[[Flow is impossible without Autonomy]]** - ReAct gives agents autonomy to act and reason without human intervention
- **Decision-Making**: ReAct = System 2 (reasoning) + System 1 (quick action) + Environmental feedback loop
- **Scientific Method**: ReAct mirrors hypothesis (reasoning) → experiment (action) → observation cycle
- **Dopamine & Learning**: Observations = reward prediction error signals that update reasoning strategy

**Novel Bridge to Buddhism**: Buddhist emphasis on **direct experience over conceptualization** parallels ReAct's use of **observations to ground reasoning**. Pure reasoning = wandering in conceptual space; observations = return to reality.

**Novel Bridge to Neuroscience**: ReAct mirrors **perception-action loop** in motor control - motor cortex (reasoning/planning) → movement (action) → sensory feedback (observation) → motor adjustment.

---

**Tags**: #document-insight #react-pattern #reasoning-acting-synergy #chain-of-thought #tool-use #architecture #buddhism-parallel #neuroscience-parallel #research-finding
