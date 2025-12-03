# Pass@k Metric Reveals Consistency Problems

**Source**: TAU-bench (Yao et al., 2024); TAU²-bench (2025 Update)
**Document Type**: Research Benchmark
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

The pass^k metric measures whether agents can complete tasks consistently over multiple trials, exposing a critical gap: agents might succeed once but fail to reproduce that success reliably. GPT-4o shows pass^8 <25% in retail domain, meaning success is often unrepeatable.

---

## Context & Evidence

**What pass@k Measures:**
- Probability of success over k attempts
- pass@5 = 80% means 4 out of 5 attempts succeed
- Reveals consistency vs single-shot performance

**TAU-bench Innovation:**
First major benchmark to introduce pass^k as core reliability metric, moving beyond "did it work once?" to "does it work reliably?"

**Empirical Results:**
- GPT-4o (state-of-the-art): <50% task success (single attempt)
- GPT-4o pass^8: <25% in retail domain (consistency across 8 attempts)
- Massive gap between single-shot and reliable performance

**Production Implications:**
Enterprise applications require reliability, not occasional success. If an agent succeeds 50% of the time on first try but only 25% consistently, production deployment becomes risky for mission-critical tasks.

**Why Consistency Matters:**
- User trust requires predictable behavior
- Production systems need deterministic outcomes
- Edge cases reveal fragility of learned behaviors
- Variability indicates agents are pattern-matching, not truly understanding

---

## Connections to Knowledge Base

- **[[LLMs exhibit significantly lower decision noise than humans]]** - But still exhibit concerning inconsistency
- **Measurement reveals hidden properties** - Single-shot metrics hide consistency problems
- **Production vs prototype gap** - Prototypes optimize for demos, production requires reliability
- **[[Uncertainty]]** - Stochastic behavior problematic for deterministic requirements
- **Epistemology of evaluation** - What you test determines what capabilities you discover

---

**Tags**: #document-insight #evaluation-metrics #reliability #consistency #pass-at-k #production-requirements #research-finding
