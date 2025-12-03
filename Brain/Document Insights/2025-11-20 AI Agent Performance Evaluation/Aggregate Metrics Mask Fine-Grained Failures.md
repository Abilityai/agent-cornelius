# Aggregate Metrics Mask Fine-Grained Failures

**Source**: Evaluation and Benchmarking of LLM Agents: A Survey (Mohammadi et al., 2025, KDD 2025)
**Document Type**: Research Paper
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

66.42% of academic agent studies rely on aggregate measures (overall accuracy, binary pass/fail) that fail to capture fine-grained failure patterns like planning errors or tool integration failures. This creates an illusion of capability that evaporates in production.

---

## Context & Evidence

**The Measurement Problem:**
Binary metrics (did task succeed: yes/no) or aggregate accuracy scores obscure WHERE and WHY agents fail:
- Planning failures (wrong strategy)
- Tool selection errors (chose wrong API)
- Tool invocation failures (correct tool, wrong arguments)
- Context loss across multi-step processes
- Communication breakdown in multi-agent systems
- Verification failures (declared success incorrectly)

**MAST Taxonomy Evidence:**
The Multi-Agent System Failure Taxonomy (MAST) identified 14 distinct failure modes across 3 categories that aggregate metrics completely miss:
1. System design issues
2. Inter-agent misalignment
3. Task verification failures

**Production Impact:**
Google Vertex AI's deployment experience shows that aggregate metrics from benchmarks give "false sense of reliability" - production agents fail in specific, predictable patterns that simple accuracy scores never reveal.

---

## Connections to Knowledge Base

- **[[Pattern completion creates illusion of coherent self]]** - Aggregate metrics complete the pattern, hiding the gaps
- **Measurement epistemology** - What you measure determines what you see and what remains invisible
- **[[Confirmation bias]]** - Aggregate scores confirm the narrative we want (agents work) while hiding contradictory evidence
- **Related to Goodhart's Law** - When a measure becomes a target, it ceases to be a good measure
- **Observer effect** - The act of using aggregate metrics changes what we pay attention to

---

**Tags**: #document-insight #measurement #epistemology #evaluation-metrics #failure-modes #agent-reliability #cognitive-bias
