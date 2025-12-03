# Network Topology is Task-Dependent Variable Not Hyperparameter

**Source**: Collective Intelligence and Multi-Agent AI Systems Research Report, GTD/G-Designer/ARG-Designer (2024)
**Document Type**: Research Paper
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-21
**Session**: 2025-11-21 Collective Intelligence and Multi-Agent Systems

---

## Core Insight

Communication topology critically impacts multi-agent performance and should be learned as a task-dependent variable rather than tuned as a hyperparameter. Task-adaptive topologies achieve 94.14% accuracy (GTD on GSM8K) versus ~85% for static topologies. Static structures are fundamentally suboptimal for diverse tasks.

---

## Context & Evidence

**GTD Performance (State-of-the-Art):**
- GSM8K: 94.14%
- MATH: 54.07%
- MultiArith: 98.88%
- SVAMP: 91.30%

**G-Designer**: Uses input-dependent paradigm to design task-adaptive, high-performing topologies with sparsity regularization for efficiency.

**ARG-Designer**: Sequentially and dynamically determines: (1) required number of agents, (2) appropriate roles from extensible pool, (3) optimal communication links.

**Trade-off**: Simpler topologies (complete graphs, random graphs) consume fewer tokens but demonstrate weaker performance. Complex topologies use 2-3× tokens but achieve superior results.

---

## Connections to Knowledge Base

- [[Context = Perspective + Information]] - Topology determines which perspectives (agents) receive which information
- [[The Folder Paradigm]] - Communication structure determines how agent "folders" interact and share state
- [[Agents lose big picture like humans lose forest for trees]] - Network topology can preserve or degrade system-level coherence
- [[Context window bloat degrades performance despite more information]] - Sparse topologies reduce communication overhead while maintaining coordination

---

**Tags**: #document-insight #multi-agent #topology #network-structure #task-adaptive #performance #optimization
