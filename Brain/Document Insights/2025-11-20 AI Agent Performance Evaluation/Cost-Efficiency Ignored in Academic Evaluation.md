# Cost-Efficiency Ignored in Academic Evaluation

**Source**: Survey on Evaluation of LLM-based Agents (Yehudai et al., 2025); Multiple Industry Sources
**Document Type**: Research Paper / Industry Analysis
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

Current agent evaluations focus heavily on accuracy while neglecting cost-efficiency, safety, and robustness. Future frameworks should integrate cost efficiency as a core metric, tracking token usage, API expenses, inference time, and resource consumption to guide development of operationally viable agents.

---

## Context & Evidence

**Critical Gap Identified:**
Academic research prioritizes:
- Accuracy (primary metric: 90%+ of studies)
- Task completion rates
- Benchmark leaderboard positions

While ignoring:
- Cost per task completion
- Token usage efficiency
- API call frequency
- Resource consumption
- Economic viability at scale

**Industry Reality:**
- Cost per task can vary 100x between implementations
- Prototype agents often economically infeasible at scale
- Industries report 25-50% token spend reductions through targeted optimizations
- Concise prompting and context pruning can cut token usage by 40-50%

**The Economic Viability Problem:**
An agent that achieves 95% accuracy but costs $10/task may be useless compared to a 85% accurate agent costing $0.10/task. Academic evaluations optimize for the former, production requires the latter.

**Emerging Practices:**
- Cost-weighted scoring (accuracy per dollar)
- Budget-constrained evaluation
- Cost optimization as primary objective
- GAIA benchmark includes cost as secondary metric (rare exception)

---

## Connections to Knowledge Base

- **What gets measured gets optimized** - Academic metrics drive accuracy, ignore economics
- **[[Confirmation bias]]** - Focus on accuracy confirms narrative that agents "work"
- **Production reality gap** - Academic success ≠ commercial viability
- **[[Goodhart's Law]]** - Optimizing for benchmark accuracy while ignoring cost creates unusable systems
- **Fitness function mismatch** - Academic fitness = accuracy; production fitness = value/cost ratio

---

**Tags**: #document-insight #cost-efficiency #evaluation-metrics #academic-industry-gap #production-viability #economic-feasibility
