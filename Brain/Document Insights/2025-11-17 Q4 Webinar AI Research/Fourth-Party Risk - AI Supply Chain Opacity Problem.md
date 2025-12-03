# Fourth-Party Risk - AI Supply Chain Opacity Problem

**Source**: AI Governance and Risk Management: The 2025 State of Practice
**Document Type**: Research Brief
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-17
**Session**: 2025-11-17 Q4 Webinar AI Research

---

## Core Insight

AI vendor relationships create "fourth-party risk" through opaque supply chains - a single AI vendor often chains multiple sub-processors (API provider using separate cloud host running third-party foundation model), making traditional Third-Party Risk Management frameworks obsolete for AI governance.

---

## Context & Evidence

**The Supply Chain Problem:**
Traditional vendor relationship: Customer → Vendor (direct)
AI vendor relationship: Customer → AI Vendor → Cloud Provider → Foundation Model Provider → Training Data Sources

**Why Traditional TPRM Fails:**
Traditional vendor tools "weren't built to address the challenges that AI can raise, such as questions about model training, bias mitigation or data lineage controls"

**The Opacity:**
Organizations often cannot:
- Audit how training data was collected or labeled
- Verify bias mitigation in upstream foundation models
- Trace data lineage through multiple processing layers
- Understand which sub-processors have access to their data

**The Contractual Control Response:**
Since technical audits of proprietary models are impossible, the ONLY effective control is contractual. Must demand:
- Transparency on fourth-party (sub-processor) relationships
- Data handling policies across entire supply chain
- Right to audit not just vendor but sub-processors
- Clear liability allocation across the chain

**The Risk Multiplication:**
Each layer in the chain multiplies risk - data governance failures, security vulnerabilities, bias amplification, regulatory non-compliance can occur at ANY layer, often invisibly.

---

## Connections to Knowledge Base

- [[Related Insight]]: Judgment-as-a-Service liability model
- [[Contrasts With]]: Traditional direct vendor relationships with clear accountability
- [[Builds On]]: Supply chain risk management principles from manufacturing
- [[Enables]]: More sophisticated vendor due diligence frameworks

---

**Tags**: #document-insight #ai-governance #vendor-risk #fourth-party #supply-chain #opacity #contracts
