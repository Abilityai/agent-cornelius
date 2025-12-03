# Event-Triggered Communication Reduces Overhead by 40-60 Percent

**Source**: "Fixed-time and event-triggered control" (ScienceDirect, 2024); "HC-MARL: Hierarchical Consensus-based MARL" (July 2024)
**Document Type**: Research Papers
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-21
**Session**: 2025-11-21 Collective Intelligence and Multi-Agent Systems

---

## Core Insight

Event-triggered communication - where agents communicate only when system state changes significantly rather than continuously - achieves 40-60% reduction in message overhead while maintaining consensus quality and stability. This addresses the fundamental scalability challenge where communication grows quadratically (O(n²)) in fully connected multi-agent topologies.

---

## Context & Evidence

**Performance Metrics:**
- Message reduction: 40-60% compared to continuous communication
- Stability: Maintained with fixed-time convergence guarantees
- Scalability: Enables coordination beyond 50-100 agent threshold
- Resource efficiency: Alleviates computational and bandwidth strain

**How It Works:**
1. Agents monitor local state changes
2. Communication triggered only when change exceeds threshold
3. Dynamic threshold adaptation based on system stability
4. Combines fixed-time theory with event-triggered strategies

**Comparison with Alternatives:**
- **Continuous communication**: O(n²) overhead, doesn't scale
- **Hierarchical**: O(log n) complexity but requires central coordination
- **Event-triggered**: Sparse communication with decentralized control

**Additional Innovation:**
- HC-MARL achieves cooperative behavior without direct communication through shared representations
- Implicit coordination further reduces message requirements

---

## Connections to Knowledge Base

- [[Context Window Bloat reduces AI agent performance]] - Event-triggered prevents communication bloat
- [[Agent-to-agent coupling is more brittle than human-to-software coupling]] - Reduced communication makes dependencies less fragile
- [[Design AI agents to function without memory then enhance]] - Event-triggered enables "function without constant communication then enhance"
- **NEW PRINCIPLE**: "Communicate on exception, not on schedule" - invert from continuous to event-driven
- **BRIDGES TO**: Network protocols (TCP vs UDP), pub-sub architectures, reactive programming
- **ENABLES**: Large-scale multi-agent systems (100+ agents) previously infeasible

**Consilience Zone**: Multi-agent systems + Network engineering + Control theory + Systems thinking

**Design Pattern**: Start with minimal communication, add only when necessary, rather than maximal communication with optimization.

---

**Tags**: #collective-intelligence #multi-agent #communication #scalability #efficiency #research-finding
