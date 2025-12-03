# Governance Shifts from Data Provenance to Action Accountability

**Source**: Agentic AI and The Foundation Gap, Sections 2.3 & 5.2
**Document Type**: Research Report
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-17
**Session**: 2025-11-17 Q4 Webinar AI Research

---

## Core Insight

As agentic AI systems make autonomous decisions, they break a core assumption of enterprise security: that every action maps cleanly back to a human. Governance must shift from "who can see data" (provenance) to "what can an agent do with data" (action accountability) and require immutable audit trails. For traditional ML/GenAI, governance is about provenance (who created data, is it accurate). For agentic AI, governance is about accountability (who is responsible when an agent acts, can we prove what data it had).

---

## Context & Evidence

**The Broken Assumption:**
Traditional IAM (Identity and Access Management) assumes:
- Every action has a human initiator
- That human can be held responsible
- Access control = "who can see what"

Agentic AI breaks this:
- Agent acts autonomously without human in loop
- Responsibility is unclear (developer? deployer? organization?)
- Access control must be "what can agent do with what"

**The New Requirements:**
1. **Immutable Audit Trails:** Every autonomous action must be logged in tamper-evident, traceable audit trail
2. **Proof of State:** System must prove, after the fact, what data an agent had when it made a specific decision
3. **Action Boundaries:** Define what agents can do, not just what they can see
4. **Reversibility:** Ability to undo autonomous actions (requires audit trail)
5. **Human Override:** Clear escalation paths when agent exceeds authority

**The Governance Question:**
- Traditional: "Who accessed this data?"
- Agentic: "Why did the agent take this action, what data did it have, and who is responsible?"

**Quote:** "As agentic AI systems start making autonomous decisions, they break a core assumption of enterprise security: that every action maps cleanly back to a human."

---

## Connections to Knowledge Base

- [[AI Agents as Toddlers - The Uncontrolled Access Problem]] - Toddlers need supervision; agents need audit trails
- [[The Agentic Error Cascade - How One Bad Data Point Becomes Catastrophic]] - Audit trails enable error tracing
- [[AI Constitutional Enforcement as impartial dictator]] - Constitution defines allowable actions; audit trail proves compliance
- [[Bidirectionality - The Bright Line Between Copilots and Autonomous Workers]] - Write access requires accountability infrastructure
- Contrasts with human accountability - Humans have intent/judgment; agents need structural proof

---

**Tags**: #document-insight #agentic-ai #governance #accountability #audit-trails #IAM #security #responsibility
