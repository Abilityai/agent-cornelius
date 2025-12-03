# Two-Dimensional Evaluation Taxonomy Framework

**Source**: Evaluation and Benchmarking of LLM Agents: A Survey (Mohammadi et al., 2025, KDD 2025)
**Document Type**: Research Paper
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

Agent evaluation requires two-dimensional framework organizing by (1) Evaluation Objectives (what to assess: behavior, capabilities, reliability, safety) and (2) Evaluation Process (how to assess: interaction modes, datasets, metrics, tools, environments). This systematic structure reveals gaps in current evaluation practices.

---

## Context & Evidence

**Dimension 1: Evaluation Objectives (WHAT)**
- **Agent behavior**: How does agent act in different contexts?
- **Capabilities**: What can the agent do?
- **Reliability**: How consistently does it work?
- **Safety**: What risks does it pose?

**Dimension 2: Evaluation Process (HOW)**
- **Interaction modes**: Single-turn, multi-turn, conversational
- **Datasets and benchmarks**: What test data?
- **Metrics computation methods**: How to measure success?
- **Evaluation tooling**: What platforms and frameworks?
- **Evaluation environments**: Simulation vs production

**Cross-Product Creates Evaluation Matrix:**
Each objective can be evaluated through multiple processes, creating comprehensive coverage map that reveals:
- Over-evaluated areas (single-turn capability testing)
- Under-evaluated areas (multi-turn safety, long-horizon reliability)
- Missing combinations (safety under realistic interaction modes)

**Enterprise-Specific Challenges Highlighted:**
Framework explicitly calls out challenges often overlooked in academic research:
- Role-based data access restrictions
- Requirements for reliability guarantees
- Dynamic, long-horizon interactions
- Compliance obligations

**Why Two Dimensions Matter:**
Previous evaluations typically focus on single dimension (e.g., "does it work?"). Two-dimensional framework ensures systematic coverage across objectives AND processes.

---

## Connections to Knowledge Base

- **Systematic thinking** - Matrix reveals gaps systematic analysis
- **[[Mental Models Taxonomy]]** - Similar two-dimensional categorization (Lenses/Biases/Tools)
- **Completeness checking** - Framework ensures no evaluation gaps
- **Enterprise vs academic** - Framework bridges different priorities
- **Epistemology of evaluation** - Structure determines what you discover

---

**Tags**: #document-insight #evaluation-framework #taxonomy #systematic-analysis #methodology #research-framework #KDD-2025
