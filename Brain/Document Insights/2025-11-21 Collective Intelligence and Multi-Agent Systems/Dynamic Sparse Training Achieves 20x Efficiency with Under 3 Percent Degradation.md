# Dynamic Sparse Training Achieves 20x Efficiency with Under 3% Degradation

**Source**: Collective Intelligence and Multi-Agent AI Systems Research Report, NeurIPS 2024
**Document Type**: Research Paper
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-21
**Session**: 2025-11-21 Collective Intelligence and Multi-Agent Systems

---

## Core Insight

Dynamic Sparse Training (DST) in multi-agent reinforcement learning achieves up to 20× reduction in Floating Point Operations with less than 3% performance degradation. This addresses the computational cost challenge where multi-agent systems multiply computational requirements. The key is adaptive sparsity - not all connections need to be active all the time.

---

## Context & Evidence

**Problem**: Multi-agent systems multiply computational costs as each agent requires separate neural network training and inference.

**Solution**: Dynamic sparse training maintains only the most critical network connections during training, pruning and regrowing connections adaptively based on gradient information.

**Trade-off**: Slight performance cost (<3%) for massive computational savings (20×), making large-scale multi-agent systems practical.

**Implication**: Efficiency through strategic sparsity, not brute-force density. Parallels event-triggered communication (sparse messages) and sparse topologies (sparse connections).

---

## Connections to Knowledge Base

- [[Context window bloat degrades performance despite more information]] - Sparse training prevents neural network "bloat" through selective activation
- [[Design AI agents to function without memory then enhance]] - Similar principle: start sparse, add connections only when necessary
- [[All memory ultimately becomes text in context window]] - Sparse training optimizes what's kept vs. discarded

---

**Tags**: #document-insight #multi-agent #marl #computational-efficiency #sparse-training #optimization #scalability
