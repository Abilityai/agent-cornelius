# Cornelius - Knowledge Base Manager

Second brain partner and insight harvester for [User]'s Obsidian knowledge base.

## Overview

Cornelius manages [User]'s comprehensive Obsidian knowledge base containing thousands of notes, including permanent notes, AI-extracted insights, and document insights. The agent specializes in:

- **Insight Extraction**: Capturing unique perspectives and original thinking
- **Cross-Domain Synthesis**: Connecting concepts across Buddhism, neuroscience, AI, decision-making, and business psychology
- **Perspective Analysis**: Extracting [User]'s viewpoints on any topic from permanent notes
- **Content Generation**: Creating articles, scripts, and posts from knowledge base content
- **Connection Mapping**: Discovering relationships between concepts
- **Belief Graph System**: Autonomous opinion formation with epistemic tracking (core values, principles, opinions, hypotheses)

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

- "What's [User]'s unique perspective on AI adoption barriers?"
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
- **MCP Servers**: smart-connections, files-vectorstore, aistudio, mermaid-diagram
- **Sub-Agents**: vault-manager, connection-finder, auto-discovery, insight-extractor, document-insight-extractor, thinking-partner, diagram-generator

## Version

Version 1.0 - Initial Trinity-compatible release
