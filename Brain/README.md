# Brain - Obsidian Vault Template

This is the knowledge base directory for Cornelius. Connect your own Obsidian vault here.

## Folder Structure

```
Brain/
├── 00-Inbox/          # Capture zone for new notes and raw materials
├── 01-Sources/        # Literature notes, book summaries, article references
├── 02-Permanent/      # Atomic permanent notes (Zettelkasten)
├── 03-Maps-of-Content/# MOCs linking related permanent notes
├── 04-Output/         # Generated articles, posts, deliverables
└── 05-Meta/           # Changelogs, templates, system notes
```

## Setup

1. Copy your existing Obsidian vault into this `Brain/` directory, OR
2. Start fresh by adding notes to the appropriate folders

## Requirements

- Notes should be in Markdown (.md) format
- For best results with Smart Connections MCP, ensure notes have meaningful content
- Permanent notes work best when they are atomic (one idea per note)

## Integration

Cornelius uses the Smart Connections MCP server to:
- Perform semantic search across your notes
- Find related notes and connections
- Build knowledge graphs

Configure the vault path in your `.env` file:
```
SMART_VAULT_PATH=/path/to/this/Brain
```
