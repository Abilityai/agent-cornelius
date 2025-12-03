# State-of-the-Art <50% Success on Realistic Tasks

**Source**: TAU-bench (Yao et al., 2024); SWE-bench Verified; MAST Framework (Cemri et al., 2025)
**Document Type**: Research Papers / Benchmarks
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

Even state-of-the-art function calling agents (GPT-4o) succeed on less than 50% of realistic tasks and show high inconsistency (pass^8 <25% in retail domain). Current best agents solve only 40-50% of SWE-bench Verified tasks. Multi-agent systems fail at rates of 41-86.7% across popular frameworks.

---

## Context & Evidence

**TAU-bench Results:**
- GPT-4o (state-of-the-art function calling): <50% task success
- pass^8 metric <25% in retail domain (inconsistent across attempts)
- Introduction of pass^k metric reveals unreliability masked by single-attempt evaluations

**SWE-bench Verified:**
- 500 problems confirmed solvable by human software engineers
- Current best agents: 40-50% success rate
- Remaining 50-60% represents fundamental capability gaps

**MAST Framework (Multi-Agent Systems):**
- Analyzed 1,642 annotated execution traces
- 7 popular frameworks: failure rates 41% to 86.7%
- "Even state-of-the-art systems exhibit significant failure rates"
- No clear consensus on building robust, reliable systems

**WAREX Finding:**
Introducing realistic website failures (timeouts, 404s, slow loading, CAPTCHAs) leads to "significant drops in task success rates" - standard benchmarks give "false sense of reliability."

---

## Connections to Knowledge Base

- **Contrasts with AI hype narratives** - Reality check on agent capabilities
- **[[AI adoption bottleneck is psychological not technical]]** - But technical limitations are real and significant
- **Validates workflow-first approach** - Can't rely on agents for mission-critical tasks yet
- **[[Uncertainty]]** - Production environments introduce uncertainty agents can't handle
- **Pattern recognition limits** - Agents optimize for benchmark patterns, not robust behaviors

---

**Tags**: #document-insight #ai-agents #benchmarks #failure-rates #production-reality #state-of-the-art #research-finding
