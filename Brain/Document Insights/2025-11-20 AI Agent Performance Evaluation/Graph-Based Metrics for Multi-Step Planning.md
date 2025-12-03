# Graph-Based Metrics for Multi-Step Planning

**Source**: Agent Evaluation Literature (2024-2025)
**Document Type**: Research Papers
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

Graph-based metrics (Node F1, Edge F1, Normalized Edit Distance) provide fine-grained evaluation of multi-step agent planning by separately assessing tool selection accuracy, tool invocation sequences, and deviation from optimal action paths.

---

## Context & Evidence

**Node F1:**
- Evaluates tool selection accuracy
- Precision: Did agent choose correct tools?
- Recall: Did agent choose all necessary tools?
- Measures WHAT tools agent selects

**Edge F1:**
- Assesses tool invocation sequences
- Evaluates transitions between steps
- Measures correct ordering and dependencies
- Captures HOW agent chains tools together

**Normalized Edit Distance:**
- Measures difference between predicted and optimal action sequences
- Lower distance = better planning
- Captures efficiency and directness of solution path
- Reveals detours, redundancy, and backtracking

**Why This Matters:**
Binary task success hides planning quality. An agent might complete a task but take inefficient path, use unnecessary tools, or exhibit poor reasoning. Graph metrics reveal these patterns.

**Contrast to Aggregate Metrics:**
- Task success: "Did it work?" (binary)
- Graph metrics: "How well did it work?" (nuanced)

**Example:**
Two agents both successfully complete web navigation task:
- Agent A: Node F1 = 0.95, Edge F1 = 0.92, Edit Distance = 0.15 (efficient, well-planned)
- Agent B: Node F1 = 0.70, Edge F1 = 0.65, Edit Distance = 0.45 (succeeded despite poor planning)

Task success metric rates both equally. Graph metrics reveal Agent A has superior planning capabilities.

---

## Connections to Knowledge Base

- **[[Fine-grained vs aggregate metrics]]** - Graph metrics reveal what aggregates hide
- **Planning quality** - Not just outcome but process
- **[[Efficiency]]** - Shortest path vs any path to goal
- **Tool use sophistication** - Measures reasoning quality
- **Optimization potential** - Metrics reveal improvement opportunities

---

**Tags**: #document-insight #evaluation-metrics #graph-metrics #multi-step-planning #tool-use #fine-grained-evaluation #methodology
