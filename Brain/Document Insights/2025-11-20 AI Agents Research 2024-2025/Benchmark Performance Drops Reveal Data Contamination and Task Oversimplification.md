# Benchmark Performance Drops Reveal Data Contamination and Task Oversimplification

**Source**: SWE-bench Pro (arXiv 2509.16941) + SWE-bench Evolution (2024-2025)
**Authors**: SWE-bench Research Team
**Year**: 2024-2025
**Document Type**: Benchmark Research
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agents Research 2024-2025

---

## Core Insight

When top-performing models (scoring 70%+ on SWE-bench Verified) faced **SWE-bench Pro** (enterprise-level real-world tasks), performance plummeted to **23%**, revealing that previous benchmarks suffered from **data contamination** (models saw evaluation code during training) and **oversimplified tasks** that didn't capture full spectrum of real-world complexity.

---

## Context & Evidence

**SWE-bench Evolution**:

**SWE-bench Original**:
- Real-world GitHub issues from actively maintained repositories
- Performance: Top agents ~20% (August 2024)

**SWE-bench Verified** (August 2024):
- 500 engineer-confirmed solvable problems
- OpenAI collaboration for higher quality
- Performance: Top models **70%+** (April 2025)

**SWE-bench Pro** (2025):
- 1,865 problems from 41 actively maintained repositories
- **Enterprise-level complexity** (business applications, B2B services, developer tools)
- Addresses data contamination and oversimplified problems
- Performance: Best models (GPT-5, Claude Opus 4.1) only **23.3%** and **23.1%**

**SWE-bench Live** (2025):
- Fully automated pipeline for continuously updatable benchmarks
- 1,319 task instances (January 2024 - April 2025)
- Spans 93 real-world repositories
- Prevents future data contamination through continuous updates

---

## Context & Evidence (Continued)

**Critical Insight**: **47-point performance drop** (70% → 23%) when moving from Verified to Pro reveals:

1. **Data Contamination**: Models may have seen evaluation code during training
2. **Task Oversimplification**: Previous benchmarks didn't capture real-world task diversity
3. **Overfitting to Benchmark Patterns**: Models learned benchmark-specific shortcuts
4. **Capability Illusion**: High scores on simplified tasks masked true limitations

**Why This Matters**:
- Industry decisions based on inflated performance metrics
- Investment and adoption driven by misleading benchmarks
- Real-world deployments encounter "surprising" failures
- True capability assessment requires continuously updated, enterprise-complexity tasks

**Solution Pattern: Continuous Benchmarking**:
- **SWE-bench Live** demonstrates automated pipeline
- Prevents contamination through constant refresh
- Maintains relevance through real-world task sourcing
- Scales evaluation without manual curation bottleneck

---

## Connections to Knowledge Base

- **[[LLMs exhibit significantly lower decision noise than humans]]** - But noise ≠ real-world performance; benchmarks must test actual capability
- **[[AI agents struggle with prototype to production transition]]** - Benchmark-prototype performance doesn't predict production performance
- **[[Confirmation bias shapes AI agent evaluation]]** - Industry wants to believe 70% scores, ignores 23% reality
- **Survivorship Bias**: Published benchmarks show successful models; real-world deployment failures invisible
- **Measurement Problem**: "What gets measured gets managed" - wrong benchmarks drive wrong optimization
- **Goodhart's Law**: "When a measure becomes a target, it ceases to be a good measure" - models optimize for benchmark artifacts

**Novel Bridge to Scientific Method**: **Reproducibility crisis in AI evaluation** - benchmarks as experiments must control for contamination, just like clinical trials control for placebo effects.

**Novel Bridge to Investment**: **Due diligence failure** - relying on benchmark scores without testing on enterprise complexity = buying based on lab demos rather than production trials.

**Contrarian Insight**: **Agent capabilities are overestimated** by 3x (70% → 23%). Real-world production readiness much lower than marketing suggests.

---

**Tags**: #document-insight #benchmarking #data-contamination #evaluation #SWE-bench #performance-metrics #measurement #goodharts-law #research-finding
