# Data Quality as Prerequisite Not Afterthought - Leading Cause of GenAI Abandonment

**Source**: GenAI Reality Check Research Report, Gartner/Deloitte/Harvard Business Review, 2024
**Document Type**: Research Report
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-17
**Session**: 2025-11-17 Q4 Webinar AI Research

---

## Core Insight

Poor data quality is the #1 reason GenAI projects are abandoned after proof of concept, yet most enterprises treat data preparation as an afterthought rather than a prerequisite. The brutal reality: "Garbage in, garbage out" - combining poor data quality with GenAI LLMs amplifies problems rather than solving them. 80% of companies cite data challenges as barriers to scaling, and most enterprise data infrastructure isn't ready for GenAI despite heavy investment in models and tools.

---

## Context & Evidence

**Data Quality as Top Abandonment Cause:**
- Poor data quality is the #1 reason cited by Gartner for 30% GenAI project abandonment rate
- 80% of companies cite data privacy and security as top scaling challenge
- 48% of executives lack quality data for enterprise-wide AI adoption
- 45% of organizations encountered unintended data exposure when implementing AI

**The "Garbage In, Garbage Out" Reality:**
> "When poor data quality is combined with a genAI large language model (LLM) - well, garbage in, garbage out." - Deloitte Research, 2024

**What GenAI Requires (That Most Enterprises Don't Have):**
1. **Both structured AND unstructured data** accessible and well-organized
2. **Metadata capture, knowledge graphs, and data models** - not just raw data
3. **Data quality directly impacts AI model performance** - accuracy, relevance, structure
4. **Continuous data pipelines** that update embeddings for RAG systems
5. **Data governance frameworks** - classification, access controls, lineage tracking

**The Infrastructure Gap:**
- 83% of healthcare executives piloting GenAI, but fewer than 10% invested in infrastructure for enterprise deployment
- Most organizations jump to model experimentation before assessing data readiness
- RAG systems (most common enterprise approach) are critically dependent on data quality
- Vector databases and embedding pipelines are new requirements most enterprises lack

**Harvard Business Review Warning:**
> "Corporations that forge ahead without attending to foundational issues such as data quality, systems integration, and organizational readiness will achieve limited success." - HBR, 2024

**The Hidden Cost:**
Data quality remediation is the largest component of the "cost iceberg" below the waterline - far exceeding visible API fees and model licenses. Organizations budget for AI but not for making their data AI-ready.

---

## Context & Evidence

**Why This Is Counterintuitive:**
GenAI's ability to work with unstructured data creates the illusion that data quality doesn't matter. "It can read anything!" But GenAI doesn't fix bad data - it confidently generates insights from garbage, making the problem worse by adding hallucination layer on top of data quality issues.

**The Timing Mistake:**
Most organizations follow this sequence:
1. Get excited about GenAI capabilities
2. Launch pilots using existing data
3. Discover data quality problems during POC
4. Project stalls while trying to fix data retroactively
5. Executive impatience grows, project abandoned

Winners reverse this:
1. Audit data quality BEFORE launching GenAI initiatives
2. Invest in metadata, governance, and structure
3. Select use cases where data is already high-quality
4. Launch pilots with clean data foundation
5. Scale successfully because foundation is solid

**The RAG Dependency:**
RAG (Retrieval-Augmented Generation) is the most common enterprise GenAI approach because it grounds AI responses in organizational data. But RAG's effectiveness is directly proportional to data quality. Bad data → bad retrievals → bad generations → failed use case.

**Data Quality vs. Model Quality:**
Organizations obsess over which model to use (GPT-4 vs. Claude vs. Llama) while ignoring that data quality has 10x more impact on outcomes. A worse model with excellent data outperforms a better model with poor data.

---

## Connections to Knowledge Base

- [[AI adoption bottleneck is psychological not technical]] - Organizations resist admitting their data is bad, creating psychological barrier
- Related to "technical debt" concept - data quality debt compounds with GenAI
- [[Belief is a way to deal with Uncertainty]] - "Our data is fine" is comforting belief that blocks necessary work
- Pattern of treating symptoms (model selection) while ignoring root cause (data quality)

---

**Tags**: #document-insight #data-quality #genai #prerequisites #foundational-issues #garbage-in-garbage-out #rag-systems #enterprise-readiness
