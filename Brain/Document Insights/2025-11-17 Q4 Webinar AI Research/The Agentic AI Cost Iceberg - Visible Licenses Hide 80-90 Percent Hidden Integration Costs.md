# The Agentic AI Cost Iceberg - Visible Licenses Hide 80-90 Percent Hidden Integration Costs

**Source**: The Agentic AI Landscape (2024-2025): An Executive Report on Production ROI and Mid-Market Viability, Section 6.1-6.2
**Document Type**: Research Report
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-17
**Session**: 2025-11-17 Q4 Webinar AI Research

---

## Core Insight

The visible costs of agentic AI (licenses, API fees) represent only 10-20% of Total Cost of Ownership. The hidden 80-90% "iceberg" consists of system complexity, custom integration, security overhead, and human governance - costs almost entirely eliminated by platform-based "Buy" approaches versus custom "Build" paths.

---

## Context & Evidence

**Visible Costs (10-20%):**
- Platform licenses: $30-$150/user/month
- Consumption pricing: $0.10 per autonomous action (Salesforce)
- API fees for custom builds: $190,000+/month for mid-sized RAG systems

**Hidden Costs (80-90%):**
- **System Complexity & Integration**: Production-ready queries consume 5x the tokens of demos because they must load conversation history, user permissions, validation checks. Most expensive engineers spend months on custom integrations.
- **Security & Governance**: 20-30% budget allocation on top of build cost just for security and monitoring stack
- **Human Oversight**: New permanent operational cost - domain experts to monitor agent performance and intervene on failures
- **Monitoring & Evaluation**: Separate stack using cheaper SLMs to validate expensive LLM outputs

**3-Year TCO Comparison (Single Use Case):**
- Platform "Buy": $265,000 total
- Custom "Build": $2,495,000 total
- Build path is 9.4x more expensive due to hidden costs

**Why Platform Wins**: Native integration with existing CRM/ITSM bypasses 90% of custom integration work, security reviews, and data-mapping that constitute the hidden iceberg.

---

## Connections to Knowledge Base

- [[AI adoption bottleneck is psychological not technical]] - Cost iceberg adds financial bottleneck
- [[Companies want builders not coders]] - Build path requires scarce AI engineering talent
- [[Context window bloat degrades performance despite more information]] - Production queries need 5x tokens

---

**Tags**: #document-insight #ai-agents #enterprise-technology #total-cost-ownership #build-vs-buy
