# Evaluation-Driven Development as New Paradigm

**Source**: Evaluation-Driven Development of LLM Agents (arXiv:2411.13768v2, 2024); OpenAI Evals API (2025)
**Document Type**: Research Paper / Industry Platform
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

Evaluation-Driven Development (EDD) makes evaluation an integral part of the agent development cycle, analogous to test-driven development. OpenAI's Evals API (launched April 2025) treats evaluation as "first-class citizen" similar to unit tests in traditional software engineering.

---

## Context & Evidence

**EDD Key Practices:**
1. Write evaluation criteria BEFORE building agent
2. Continuous evaluation during development
3. Automated evaluation in CI/CD pipelines
4. Evaluation guides architecture decisions

**OpenAI Evals API Innovation:**
Enables developers to programmatically define tests, automate evaluation runs, and iterate rapidly within their own workflows - not as afterthought but as core development practice.

**Two-Phase Evaluation Approach:**

**Offline Evaluation (During Development):**
- Unit tests for agent components
- Integration tests for tool interactions
- System tests for complete workflows
- Benchmark performance

**Online Evaluation (After Deployment):**
- Production monitoring
- A/B testing
- Shadow evaluation (new versions alongside live agents)
- Offline replay (re-running prior episodes with updated policies)

**The Continuous Loop:**
"Evaluation is not a one-time task but an ongoing process" requiring:
- Continuous monitoring
- Reassessment after updates
- User feedback integration
- Model refinement

**Architectural Implications:**
Modular, composable evaluations with standardized interfaces enable CI/CD integration, making agents testable like traditional software.

---

## Connections to Knowledge Base

- **Test-driven development parallel** - Proven software engineering practice adapted for agents
- **[[Feedback loops]]** - Continuous evaluation enables rapid learning
- **[[Measurement changes behavior]]** - Making evaluation first-class changes development practices
- **Production mindset** - Shifts from "does it work?" to "how do we know it works?"
- **CI/CD integration** - Agents join mainstream software development practices

---

**Tags**: #document-insight #evaluation-methodology #development-practices #EDD #continuous-evaluation #software-engineering #best-practices
