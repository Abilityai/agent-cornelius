# Enterprise vs Academic Evaluation Priorities

**Source**: Evaluation and Benchmarking of LLM Agents Survey (Mohammadi et al., 2025); Production Case Studies
**Document Type**: Research Paper / Industry Analysis
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

Enterprise-specific challenges are often overlooked in academic research: role-based data access restrictions, requirements for reliability guarantees, dynamic long-horizon interactions, and compliance obligations. Academic evaluations optimize for benchmark leaderboard positions while enterprises need production reliability.

---

## Context & Evidence

**Academic Priorities:**
- Benchmark accuracy (primary metric)
- State-of-the-art performance
- Novel capabilities
- Leaderboard rankings
- Publication-worthy results

**Enterprise Priorities:**
- **Role-based access control**: Agents must respect data permissions
- **Reliability guarantees**: Need contractual SLAs, not probabilistic performance
- **Long-horizon interactions**: Tasks spanning hours/days/weeks, not seconds
- **Compliance obligations**: GDPR, HIPAA, SOC 2, industry regulations
- **Cost predictability**: Fixed budgets, not variable research funding
- **Audit trails**: Explainability for regulatory review
- **Graceful degradation**: Fail safely, not fail spectacularly

**The Gap:**
Academic research: "Can it solve this task?"
Enterprise reality: "Can it solve this task reliably, securely, cost-effectively, with proper access controls, while meeting compliance requirements, and explain its reasoning?"

**1-800Accountant Example:**
Chief strategy officer reports agents "essential" during peak tax season. What matters:
- Handling seasonal load spikes (not average-case performance)
- Meeting tax deadline SLAs (not benchmark accuracy)
- Maintaining audit compliance (not innovation)
- Cost control under volume surge (not token efficiency research)

**Why This Matters:**
Massive academic-industry evaluation gap means research results have limited production applicability. Agents that "work" in research fail in production due to unmeasured requirements.

---

## Connections to Knowledge Base

- **[[Academic-industry gap]]** - Different optimization functions create different systems
- **[[Production constraints]]** - Real-world requirements beyond capability
- **Compliance as fitness function** - Regulatory requirements shape viable solutions
- **[[Risk management]]** - Enterprises optimize for downside protection, not upside maximization
- **Goodhart's Law** - Optimizing for academic metrics creates production-incompatible systems

---

**Tags**: #document-insight #enterprise #academic-research #evaluation-priorities #production-requirements #compliance #reliability-guarantees
