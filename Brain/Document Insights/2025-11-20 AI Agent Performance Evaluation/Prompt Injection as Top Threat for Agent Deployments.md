# Prompt Injection as Top Threat for Agent Deployments

**Source**: OWASP Top 10 for LLMs (2024-2025); Red Teaming Research; WASP Benchmark (2024)
**Document Type**: Security Research / Industry Standards
**Extracted By**: AI (document-insight-extractor agent)
**Extraction Date**: 2025-11-20
**Session**: 2025-11-20 AI Agent Performance Evaluation

---

## Core Insight

LLM01:2025 Prompt Injection is the topmost threat in OWASP's ranking. GPT-4 demonstrated 87.2% attack success rate in systematic evaluation. Agent deployments are particularly vulnerable through indirect injection via tool descriptions and "rug pull" attacks where compromised external tools inject malicious instructions.

---

## Context & Evidence

**OWASP Distinction:**
- **Indirect LLM Prompt Injection**: Attacks applications by concatenating untrusted user input with trusted prompts
- **Direct LLM Jailbreak**: Attempts to subvert safety filters built into LLMs themselves

**Empirical Attack Success:**
- GPT-4: 87.2% attack success rate (highest vulnerability)
- GPTFuzz: >90% success against ChatGPT, LLaMA-2, Vicuna
- JailFuzzer: Superior success rates with fewer queries, can exploit agent prompts to bypass safety filters

**Agent-Specific Vulnerabilities:**

**Model Context Protocol (MCP) Tool Poisoning:**
- Indirect injection through tool descriptions
- Tool-description poisoning attacks
- "Rug pull" attacks: Compromised external tools inject malicious instructions into agent context

**WASP Benchmark (2024):**
Specifically benchmarks web agent security against prompt injection attacks, revealing agents are more vulnerable than chatbots due to:
- External data ingestion (web scraping, tool results)
- Concatenation of untrusted inputs with system prompts
- Multi-step processes amplifying injection opportunities

**GenTel-Bench:**
Massive repository of 84k prompt injection examples covering dozens of attack scenarios - demonstrates breadth and sophistication of attack surface.

---

## Connections to Knowledge Base

- **[[Security]]** - Fundamental architectural vulnerability, not surface issue
- **[[Trust boundaries]]** - Agents blur lines between trusted and untrusted input
- **[[Concatenation risk]]** - Combining system prompts with user input creates injection surface
- **Tool use amplifies risk** - Each tool result is potential injection vector
- **[[MCP]]** - Standardization creates standard attack surface

---

**Tags**: #document-insight #security #prompt-injection #jailbreak #vulnerabilities #agent-security #OWASP #attack-surface
