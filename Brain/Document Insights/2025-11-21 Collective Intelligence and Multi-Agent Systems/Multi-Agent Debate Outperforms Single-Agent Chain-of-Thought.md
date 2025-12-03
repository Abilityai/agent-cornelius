# Multi-Agent Debate Outperforms Single-Agent Chain-of-Thought

**Source**: Collective Intelligence and Multi-Agent AI Systems Research Report, EMNLP 2024, NeurIPS 2024
**Document Type**: Research Papers
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-21
**Session**: 2025-11-21 Collective Intelligence and Multi-Agent Systems

---

## Core Insight

Multi-agent discussion approaches outperform single-agent chain-of-thought prompting on complex reasoning benchmarks. However, critical success factors include: (1) adaptive break - knowing when to stop debating, (2) modest "tit for tat" - some back-and-forth improves outcomes but excessive cycles degrade performance, (3) diversity - diverse perspectives and cross-verification improve reasoning. Risk: similar model capabilities result in static debate dynamics converging to majority opinion (groupthink).

---

## Context & Evidence

**Multi-Agent Debate (MAD) Framework**: Multiple agents express arguments in "tit for tat" state with judge managing debate process to obtain final solution.

**Performance**: Leaps in performance most pronounced on complex reasoning tasks requiring multiple perspectives. Debate forces agents to articulate reasoning and consider counterarguments.

**Critical limitation**: Homogeneous agents with similar capabilities converge without critical evaluation, replicating human groupthink bias.

---

## Connections to Knowledge Base

- [[Mediating Assessments Protocol (MAP)]] - Structured debate parallels MAP's structured judgment process to reduce noise
- [[Confirmation bias shapes AI agent evaluation]] - Homogeneous debaters reinforce existing beliefs rather than challenge them
- [[Outside view vs inside view]] - Multiple agents provide outside perspectives on each other's reasoning
- [[Force ranking beats evaluative judgment]] - Judge mechanism provides comparative evaluation similar to force ranking

---

**Tags**: #document-insight #multi-agent #debate #reasoning #argumentation #groupthink #divergent-thinking
