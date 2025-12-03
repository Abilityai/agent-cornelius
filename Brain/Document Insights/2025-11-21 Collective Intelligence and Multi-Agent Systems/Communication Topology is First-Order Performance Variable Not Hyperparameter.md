# Communication Topology is First-Order Performance Variable Not Hyperparameter

**Source**: "GTD: Guided Topology Diffusion" (October 2024); "G-Designer" (October 2024)
**Document Type**: Research Papers (arXiv)
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-21
**Session**: 2025-11-21 Collective Intelligence and Multi-Agent Systems

---

## Core Insight

Network topology in multi-agent systems is not a hyperparameter to tune but a task-dependent variable to optimize. Task-adaptive topologies (GTD) achieve 94.14% on GSM8K versus ~85% for static structures - a fundamental architectural breakthrough showing topology design matters as much as agent capabilities.

---

## Context & Evidence

**GTD Performance (State-of-the-Art):**
- GSM8K: **94.14%** (vs. ~85% static)
- MATH: **54.07%**
- MultiArith: **98.88%**
- SVAMP: **91.30%**

**Key Findings:**
- Simple topologies (complete graphs, random) consume fewer tokens but demonstrate weaker performance
- Graph structures outperform hierarchical/sequential for complex research tasks
- Task-specific topologies optimize coordination needs while minimizing communication overhead
- Input-dependent paradigm: topology generated dynamically based on task requirements

**Architectural Shift:**
- OLD: Pick topology (star, chain, tree), tune it
- NEW: Learn optimal topology as function of task properties

**Efficiency Trade-off:**
- Complex topologies: 2-3× more tokens
- Sparse task-adaptive: 50-70% token reduction with maintained performance

---

## Connections to Knowledge Base

- [[Context engineering replaces prompt engineering - agent success is system design]] - Topology is infrastructure-level context engineering
- [[Four-Type Memory Framework for AI Agents]] - Topology determines which agents access which memories
- [[Agent-to-agent coupling is more brittle than human-to-software coupling]] - Topology design mitigates brittleness through redundancy
- **NEW FRAMEWORK**: "Topology as Cognitive Architecture" - communication structure shapes collective intelligence
- **BRIDGES TO**: Network science, neuroscience (brain connectivity patterns), organizational design
- **ENABLES**: Systematic topology optimization rather than trial-and-error architecture selection

**Consilience Zone**: Multi-agent systems + Network science + Neuroscience (brain topology) + Systems thinking (structure determines behavior)

---

**Tags**: #collective-intelligence #multi-agent #topology #network-structure #architecture #research-finding
