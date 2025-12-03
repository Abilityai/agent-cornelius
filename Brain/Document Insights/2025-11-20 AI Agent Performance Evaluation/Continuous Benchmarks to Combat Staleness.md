# Continuous Benchmarks to Combat Staleness

**Source**: Survey on Evaluation of LLM-based Agents (Yehudai et al., 2025); WebArena → VisualWebArena → TheAgentCompany Evolution
**Document Type**: Research Papers / Benchmarks
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

Shift toward "more realistic, challenging evaluations with continuously updated benchmarks" to combat benchmark staleness and overfitting. Static benchmarks become obsolete as agents optimize for known test cases rather than learning robust behaviors.

---

## Context & Evidence

**The Staleness Problem:**
1. Benchmark released (e.g., WebArena 2024)
2. Agents trained/optimized on benchmark data
3. Leaderboard performance improves
4. Benchmark becomes proxy for memorization, not capability
5. New agents overfit to benchmark artifacts
6. Real-world performance diverges from benchmark scores

**Evolution Example - WebArena Progression:**
- **WebArena (2024)**: Initial realistic web environment, 812 tasks
- **VisualWebArena (2024)**: Added multimodal requirements, 910 tasks
- **TheAgentCompany (Dec 2024)**: More consequential tasks, terminal use, coding

Each evolution addresses staleness and adds realism.

**Continuous Update Approaches:**

**SWE-bench Evolution:**
- SWE-bench (2024) → SWE-bench Verified (2024) → SWE-bench Multimodal (Oct 2024) → SWE-smith (May 2025)
- Regular updates prevent memorization
- New problem types test generalization

**TAU-bench → TAU²-bench:**
- Added telecom domain
- Introduced dual-control scenarios
- Expanded evaluation complexity

**Why Continuous Updates Matter:**
Static benchmarks optimize for past performance. Continuous benchmarks force ongoing adaptation and robust learning.

**Challenge:**
Continuous updates make longitudinal comparison difficult - improved scores may reflect easier/harder tests rather than better agents.

---

## Connections to Knowledge Base

- **[[Benchmark overfitting]]** - Continuous updates as countermeasure
- **[[Red Queen hypothesis]]** - Agents and benchmarks co-evolve
- **Moving target problem** - Intentional feature, not bug
- **[[Goodhart's Law]]** - Continuous updates prevent metric gaming
- **Adversarial evaluation** - Benchmarks as adversaries forcing robustness

---

**Tags**: #document-insight #benchmarks #continuous-evaluation #staleness #overfitting #co-evolution #methodology
