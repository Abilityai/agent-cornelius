# MAST - 14 Failure Modes Across 3 Categories

**Source**: Why Do Multi-Agent LLM Systems Fail? (Cemri et al., 2025, UC Berkeley)
**Document Type**: Research Paper
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

The Multi-Agent System Taxonomy (MAST) provides the first systematic, empirically grounded failure classification for multi-agent systems, identifying 14 distinct failure modes across 3 categories: System Design Issues, Inter-Agent Misalignment, and Task Verification failures.

---

## Context & Evidence

**Research Methodology:**
- Analyzed 1,642 annotated execution traces
- 7 popular MAS frameworks (MetaGPT, ChatDev, HyperAgent, OpenManus, AppWorld, Magentic, AG2)
- 150 conversation traces with expert human annotators
- Each trace averaging >15,000 lines of text
- High inter-annotator agreement: Cohen's Kappa = 0.88

**Three Failure Categories:**

1. **System Design Issues**
   - Architectural flaws in agent orchestration
   - Communication protocol problems
   - Role assignment issues

2. **Inter-Agent Misalignment**
   - Conflicting objectives between agents
   - Communication breakdown
   - Coordination failures

3. **Task Verification**
   - Incorrect completion detection
   - Missing validation steps
   - False positive success signals

**Failure Rate Distribution:**
- Range: 41% to 86.7% across frameworks
- No framework demonstrates consistent reliability
- No clear consensus on building robust systems

**Resources Released:**
- MAST-Data: Comprehensive annotated dataset
- MAST Taxonomy: Structured failure classification
- LLM Annotator: LLM-as-a-Judge pipeline with high agreement to human annotations

---

## Connections to Knowledge Base

- **Systematic taxonomy** - Moves from anecdotal to empirical understanding
- **[[Pattern completion]]** - Agents declare success when pattern seems complete, even if task incomplete
- **Coordination problems** - Multi-agent systems amplify coordination challenges
- **[[Communication]]** - Breakdown in inter-agent communication as distinct failure mode
- **Verification blindness** - Agents can't reliably judge their own success

---

**Tags**: #document-insight #ai-agents #failure-taxonomy #multi-agent-systems #research-finding #systematic-analysis #MAST
