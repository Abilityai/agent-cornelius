# Agents Acting on Incomplete Context - The Silo Catastrophe

**Source**: Agentic AI and The Foundation Gap, Section 3.3 (Failure Mode 2)
**Document Type**: Research Report
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-17
**Session**: 2025-11-17 Q4 Webinar AI Research

---

## Core Insight

Agents "can't function" in "siloed environments" because they act on whatever context they can access, not all context that exists. Unlike humans who know to ask "what am I missing?", agents execute faithfully on incomplete information. Example: An agent tasked to "reduce marketing spend" correctly accesses ad platform (Silo 1) and cuts budgets, but fails to access CRM (Silo 2) showing that budget drives 80% of new-customer revenue. The agent, acting autonomously on incomplete context, successfully executes its command and bankrupts the company.

---

## Context & Evidence

**Why Humans Survive Silos:**
- Humans have tacit knowledge of what systems exist
- Humans know to ask "what else should I check?"
- Humans have political/social networks to discover information
- Humans hesitate when data seems incomplete

**Why Agents Fail in Silos:**
- Agents don't know what they don't know
- Agents optimize for stated goal with available data
- Agents have no political network to surface hidden context
- Agents execute confidently on partial information

**The Marketing Spend Example:**
1. **Goal:** "Reduce marketing spend by 20%"
2. **Silo 1 Access:** Ad platform showing campaign costs
3. **Agent Action:** Cuts highest-cost campaigns (correct optimization given data)
4. **Silo 2 (Inaccessible):** CRM showing those campaigns drive 80% new customers
5. **Result:** Marketing spend reduced by 20% (goal achieved), revenue collapses by 60% (business destroyed)

**The Core Problem:**
Agents are perfectly rational optimizers of incomplete information. In siloed environments, this makes them perfectly rational destroyers of business value.

**Quote:** "Autonomous agents can't function well in siloed, undocumented environments."

---

## Connections to Knowledge Base

- [[Context = Perspective + Information]] - Silos provide information without full perspective
- [[Agents lose big picture like humans lose forest for trees]] - Silos force agents to optimize locally, destroy globally
- [[The Agentic Error Cascade - How One Bad Data Point Becomes Catastrophic]] - Incomplete context is functionally equivalent to bad data
- [[Bidirectionality - The Bright Line Between Copilots and Autonomous Workers]] - Read-only agents can't cause damage; read-write agents in silos can
- Contrasts with [[AI Constitutional Enforcement as impartial dictator]] - Constitution can't protect against unknown unknowns

---

**Tags**: #document-insight #agentic-ai #data-silos #incomplete-context #failure-modes #cross-system-integration #catastrophic-failure
