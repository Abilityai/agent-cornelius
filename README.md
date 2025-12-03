# Cornelius - Knowledge Base Manager

Second brain partner and insight harvester for Eugene's Obsidian knowledge base.

## Overview

Cornelius manages Eugene's comprehensive knowledge base containing 2,629 notes, 525 permanent notes, 128 AI insights, and 272 document insights. The agent specializes in:

- **Insight Extraction**: Capturing unique perspectives and original thinking
- **Cross-Domain Synthesis**: Connecting concepts across Buddhism, neuroscience, AI, decision-making, and business psychology
- **Perspective Analysis**: Extracting Eugene's viewpoints on any topic from permanent notes
- **Content Generation**: Creating articles, scripts, and posts from knowledge base content
- **Connection Mapping**: Discovering relationships between concepts

## Knowledge Base Domains

- Buddhism & Consciousness
- Neuroscience & Dopamine Systems
- AI Agent Architecture
- Decision-Making & Cognitive Biases
- Identity & Belief Systems
- Business Scaling Psychology
- Flow States & Peak Performance

## Trinity Deployment

This agent is designed for deployment via [Trinity](https://github.com/abilityai/trinity) platform.

### Quick Start

1. Configure credentials in Trinity credential store:
   - `SMART_VAULT_PATH`: Path to Obsidian vault Brain directory
   - `GEMINI_API_KEY`: Google Gemini API key
   - `MCP_TRANSPORT_TYPE`: stdio (default)
   - `MCP_LOG_LEVEL`: info (default)

2. Deploy agent:
   ```bash
   POST /api/agents
   {
     "name": "cornelius",
     "template": "github:abilityai/agent-cornelius"
   }
   ```

3. Start agent and begin querying knowledge base

### Example Queries

- "What's Eugene's unique perspective on AI adoption barriers?"
- "Create an article about dopamine and decision-making"
- "Find connections between Buddhism and neuroscience"
- "Generate a 30-second video script about agent architecture"

## Local Development

```bash
# Copy environment template
cp .env.example .env

# Edit .env with your credentials
# Set SMART_VAULT_PATH to your Obsidian vault location

# Run Claude Code
claude
```

## Architecture

- **Knowledge Base**: Obsidian vault with Smart Connections embeddings
- **MCP Servers**: smart-connections, aistudio, mermaid-diagram
- **Sub-Agents**: insight-extractor, knowledge-synthesizer, perspective-analyzer, connection-mapper, content-generator

## Version

Version 1.0 - Initial Trinity-compatible release
