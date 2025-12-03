## Context Window Bloat reduces AI agent performance

**Type**: Experience-Based Wisdom / Contrarian View
**Source**: Understanding Memory Architecture for AI Agents (YourWay Substack, 2025)
**Uniqueness**: Challenges assumption that more context equals better performance

---

**Core Insight**:

More context isn't always better. Overloading the context window leads to:
- Slower responses and higher costs
- Model confusion (too much information)
- Decreased performance despite "more memory"

The solution: Be selective. Retrieve summaries, not full history. Give the agent tools to fetch more detail when needed.

---

**Context & Reasoning**:

This hard-won lesson emerged from building production AI agents. The author observed a counterintuitive pattern: agents with less context often performed better than those with comprehensive memory in the context window.

**Why more context hurts**:

1. **Cognitive overload for models**: Like humans, LLMs struggle when overwhelmed with information. Performance degrades with excessive context.

2. **Increased latency**: Larger context windows mean slower processing and higher API costs.

3. **Lost focus**: Critical information drowns in noise when everything is included.

**The fix - Strategic retrieval**:
- Include summaries rather than full details
- Provide tools for the agent to request more information
- Design for context window limits upfront
- Calculate token budget: System instructions (~500) + User message (~100-500) = Memory overhead remaining

**Example approach**:
Instead of loading 100 past conversations:
- Provide summary of conversation themes
- Give agent tool to "fetch conversation ID 47" if needed
- Include only most recent 5-10 interactions by default

**The contrarian element**: This challenges the "more data is better" assumption common in AI. For agents, **less but better-selected context outperforms comprehensive but unfocused memory**.

---

**Potential Connections**:
- [[Brain/02-Permanent/All memory ultimately becomes text in context window]] - Context window is the constraint
- [[WYSIATI (What You See Is All There Is)]] - Models work with what's in context
- [[Less is more]] - Constraints improve outcomes
- [[Mental Models]] - Less context but better selection
- [[External systems as memory interfaces not duplication targets]] - Query on demand vs pre-load
- [[Attention]] - Limited attention applies to both humans and LLMs

**Keywords**: #experience-wisdom #contrarian #AI-agents #performance #constraints #optimization
