# Shapers Strategy Wins - Customize Off-the-Shelf Not Build or Buy As-Is

**Source**: GenAI Reality Check Research Report, McKinsey/Andreessen Horowitz, 2024
**Document Type**: Research Report
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-17
**Session**: 2025-11-17 Q4 Webinar AI Research

---

## Core Insight

Enterprise GenAI deployment follows three strategies - "Takers" (use off-the-shelf as-is), "Shapers" (customize off-the-shelf with proprietary data), and "Makers" (build from scratch). The "Shapers" strategy delivers the best balance of speed, customization, and control, while both extremes fail: pure "Takers" get no competitive advantage, and "Makers" spend $8M-$20M upfront with 1.5x longer deployment times and often underperform. 86% of CIOs now choose to partner/acquire rather than build entirely in-house.

---

## Context & Evidence

**The Three Strategies:**

**1. "Takers" - Use Off-the-Shelf As-Is**
- Fastest deployment (1-4 months typically)
- Limited customization to organizational needs
- Lowest control over data and model behavior
- No competitive differentiation
- Risk: Generic AI tools don't deliver unique business value

**2. "Shapers" - Customize Off-the-Shelf (RECOMMENDED)**
- Balance of speed, customization, and control
- Leverage existing models + organizational knowledge
- Use RAG systems and prompt engineering for domain specificity
- Maintain data control and security
- 46% of enterprises prefer open source for this approach

**3. "Makers" - Build From Scratch**
- Custom foundation model development
- **Cost: $8M-$20M upfront + $11K-$21K per user per year**
- **1.5x more likely to take 5+ months to implement**
- Only viable for largest enterprises with unique requirements
- Most enterprises lack AI talent to successfully train and maintain custom LLMs
- Often underperforms off-the-shelf alternatives + RAG

**The Market Shift:**
- **86% of CIOs plan to acquire or partner** with GenAI platforms rather than build in-house
- Organizations finding these investments yield more value than building
- "Buy infrastructure, build differentiation" becomes dominant strategy

**Why Shapers Win:**
1. Delivers customization without excessive cost
2. Faster time to value than building from scratch
3. Maintains data control and security (especially with open source models)
4. Can use RAG and fine-tuning for domain specificity
5. Focus engineering resources on use cases and integration, not model development
6. **Most competitive advantage comes from data and use cases, not models**

**The Open Source Trend Supporting Shapers:**
- **2023**: 80-90% of enterprise spend on closed-source (mostly OpenAI)
- **2024**: 46% prefer open source, targeting 50/50 split
- Top reasons: **Control and customization** (cost is lower priority than expected)
- Open source enables Shapers strategy with full data sovereignty

---

## Context & Evidence

**Contrarian Angle:**
The "build vs. buy" framing is a false dichotomy. The real choice is "shape" - taking existing capabilities and molding them to organizational needs. This mirrors successful software strategies: no one builds their own database or operating system, but everyone customizes how they use these tools.

**Why Makers Fail:**
The psychology: "We're unique, we need custom models." The reality: foundation models are becoming commoditized infrastructure. Uniqueness comes from:
- What data you have (proprietary organizational knowledge)
- What problems you solve (use case selection)
- How you integrate (workflow redesign)

Not from model architecture.

**The "Not Invented Here" Trap:**
Organizations with strong engineering cultures often fall into Makers strategy because:
- Pride in building rather than customizing
- Belief that custom = better (often wrong for LLMs)
- Underestimating model development complexity
- Overestimating competitive advantage from model itself

**The Cost Iceberg:**
Custom LLM visible costs ($8M-$20M upfront) don't include:
- Ongoing training and maintenance
- Talent acquisition and retention (scarce AI expertise)
- Infrastructure (compute, storage, MLOps)
- Opportunity cost (time to market delay)
- Per-user costs ($11K-$21K annually)

Shapers avoid this entire iceberg.

**RAG as the Killer App for Shapers:**
RAG (Retrieval-Augmented Generation) is the perfect Shapers tool:
- Uses off-the-shelf LLMs (Takers component)
- Grounds responses in proprietary organizational data (customization)
- No expensive fine-tuning required
- Minimizes hallucinations through data grounding
- Most common enterprise GenAI approach

---

## Connections to Knowledge Base

- [[AI adoption bottleneck is psychological not technical]] - Makers strategy often driven by psychological need to "own" the technology
- [[Companies want builders not coders]] - Shapers need builders who can integrate and customize, not ML researchers
- [[Context = Perspective + Information]] - Shapers add organizational context to general models
- Related to "build your own database" fallacy - some infrastructure should be bought, not built

---

**Tags**: #document-insight #genai #strategy #build-vs-buy #shapers #takers #makers #customization #rag-systems #competitive-advantage
