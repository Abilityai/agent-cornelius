# Disconnected Models Problem in Multi-Agent Systems

**Source**: Multi-Agent System Evaluation Research (2024-2025)
**Document Type**: Research Papers
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

One of the most critical challenges in practical multi-agent implementation is the "disconnected models problem" - the difficulty of maintaining coherent context across multiple agent interactions, leading to context loss, inconsistent state understanding, and conflicting decisions.

---

## Context & Evidence

**Symptoms of Disconnection:**
- Context loss between agent handoffs
- Inconsistent state understanding across agents
- Redundant information gathering
- Conflicting decisions based on partial context
- Failure to build on previous agent work

**Why This Matters:**
Multi-agent systems promise parallelization and specialization, but context fragmentation undermines both benefits. Each agent working with partial context makes locally optimal but globally suboptimal decisions.

**Emerging Solutions:**
- Shared memory systems
- Context persistence layers
- Explicit handoff protocols
- State synchronization mechanisms

**Connection to MAST Taxonomy:**
The "Inter-Agent Misalignment" category in MAST directly relates to disconnected models:
- Communication breakdown
- Coordination failures
- Conflicting objectives (arising from different context windows)

**Architectural Challenge:**
LLMs are fundamentally stateless - each invocation is isolated. Multi-agent systems amplify this problem by introducing multiple isolated context windows that must somehow maintain coherence.

---

## Connections to Knowledge Base

- **[[All memory ultimately becomes text in context window]]** - But different agents have different context windows
- **[[The Folder Paradigm]]** - Shared folder as solution to disconnected models
- **[[Context window bloat degrades performance]]** - Tension between sharing context and maintaining performance
- **[[Agents lose big picture like humans]]** - Multi-agent systems fragment the big picture further
- **Coordination problem** - Classic distributed systems challenge in AI agents

---

**Tags**: #document-insight #multi-agent-systems #context-management #coordination #architectural-challenge #distributed-systems
