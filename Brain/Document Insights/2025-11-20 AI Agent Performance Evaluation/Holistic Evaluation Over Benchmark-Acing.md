# Holistic Evaluation Over Benchmark-Acing

**Source**: Holistic Agent Leaderboard (arXiv:2510.11977, October 2024)
**Document Type**: Research Paper / Benchmark
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

Conducted 21,730 agent rollouts across 9 models and 9 benchmarks spanning coding, web navigation, science, and customer service. Goal: Shift focus from "benchmark-acing agents" to "reliably working real-world agents." Key finding: Single-benchmark performance poorly predicts real-world reliability.

---

## Context & Evidence

**Scale of Evaluation:**
- **21,730 agent rollouts**
- **9 different models** tested
- **9 diverse benchmarks** spanning:
  - Coding tasks
  - Web navigation
  - Scientific reasoning
  - Customer service interactions

**The Core Problem:**
Agents optimized for specific benchmarks show poor generalization. Strong performance on WebArena doesn't predict success on SWE-bench. Excellent coding ability doesn't transfer to customer service.

**Real-World Implication:**
Production deployments face diverse, unpredictable tasks. Benchmark-specific optimization creates brittle agents that work brilliantly in narrow domains but fail when faced with slightly different contexts.

**The Reliability Gap:**
Single-benchmark leaderboard positions give false confidence. An agent ranked #1 on one benchmark may rank #15 on another, revealing that "state-of-the-art" is domain-specific, not general.

**Holistic Approach:**
Evaluate across multiple domains, multiple benchmarks, multiple metrics to get true picture of agent reliability and robustness.

**Why This Matters:**
Challenges the entire benchmark-driven development culture. If single benchmarks don't predict real-world performance, what are we optimizing for?

---

## Connections to Knowledge Base

- **[[Benchmark overfitting]]** - Holistic evaluation as antidote
- **[[Generalization gap]]** - Narrow optimization creates brittle systems
- **Context-dependent performance** - Agents are situationally capable, not generally capable
- **[[Pattern completion]]** - Agents complete benchmark-specific patterns, not robust problem-solving
- **Fitness function mismatch** - Single benchmarks create narrow fitness functions

---

**Tags**: #document-insight #holistic-evaluation #benchmarks #generalization #real-world-reliability #multi-domain #evaluation-methodology
