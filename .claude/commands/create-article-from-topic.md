---
description: Generate article from knowledge base (called by Ruby or user)
---

# Create Article From Topic

Generate a comprehensive article by synthesizing insights from the knowledge base. Can be called directly by user or via Ruby agent in headless mode.

## Usage

```
/create-article-from-topic <topic> <platform> [tone]
```

## Parameters

- **topic**: Article subject
- **platform**: linkedin | medium | substack | blog
- **tone**: professional | casual | contrarian | educational (optional)

## Examples

```
/create-article-from-topic "AI agent adoption barriers" linkedin professional
/create-article-from-topic "The dopamine economy" medium
/create-article-from-topic "Buddhism meets neuroscience" substack casual
```

## Workflow

1. **Search Knowledge Base**
   - Use /recall or Smart Connections to find relevant permanent notes
   - Identify 5-10 notes with strong relevance
   - Find connections between notes

2. **Read Tone of Voice Profile**
   - LinkedIn: `$TONE_PROFILES_PATH/[User]_LinkedIn_Tone_of_Voice_Profile.md`
   - Twitter: `[User]_Twitter_Tone_of_Voice_Profile.md`
   - Threads: `[User]_Text_Post_Tone_of_Voice_Profile.md`

3. **Synthesize Article**
   - Structure: Hook → Context → 3-5 insights → Synthesis → CTA
   - Apply tone of voice
   - Cite permanent notes throughout [[Note Title]]
   - Target word count by platform:
     - LinkedIn: 800-1200 words
     - Medium: 1500-2500 words
     - Substack: 1000-2000 words
     - Blog: 1200-2000 words

4. **Save Output**
   - For direct user calls: Display full article
   - For Ruby headless calls: Return article text
   - Include metadata: cited notes, word count, platform

## Output Format

```markdown
# [Article Title]

[Article content with [[permanent note citations]] throughout]

---

**Cited Notes:**
- [[Note 1]]
- [[Note 2]]
- [[Note 3]]

**Metadata:**
- Word count: 1,047
- Platform: LinkedIn
- Tone: Professional
- Read time: ~5 minutes
```

## Integration with Ruby

When Ruby calls via headless mode:
```bash
cd .
claude -p "/create-article-from-topic 'AI adoption barriers' linkedin professional" --output-format json
```

Ruby receives:
```json
{
  "result": "[Full article text]",
  "total_cost_usd": 0.67
}
```

## Notes

- Always cite specific permanent notes
- Focus on [User]'s unique/contrarian perspectives
- Use concrete examples from knowledge base
- Connect to broader themes (dopamine, Buddhism, AI, identity)
