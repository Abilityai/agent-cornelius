## EXTRACTED INSIGHT

**Title**: [[Single-task prompts drive higher accuracy than multi-task]]
**Type**: Synthesis / Research Summary
**Source**: YourWay Substack - Single-Task vs Multi-Task Prompting
**Uniqueness**: Eugene synthesizes multiple research papers into practical decision framework for prompt engineering
**Extracted By**: AI (insight-extractor agent)
**Extraction Date**: 2025-10-26

---

**Core Insight** (in Eugene's voice):

"Research from Sun Yat-sen University and Carnegie Mellon University confirms what many have suspected: prompts focusing on one task at a time consistently produce higher-quality results. Breaking work into separate prompts for drafting, critiquing, and refining isn't just cleaner—it delivers superior outputs."

---

**Context & Reasoning**:

Eugene synthesizes research from multiple institutions into five key findings:

**1. Single-Task = Higher Accuracy (General Rule)**
- One task per prompt consistently produces better quality
- Applies especially to smaller models

**2. Power Models Can Handle Multitasking (Exception)**
- Advanced models (GPT-4, LLaMA-2-Chat-70B) can sometimes outperform single-task when tasks share related contexts
- Not all models created equal

**3. Architecture Determines Performance**
- LLaMA-3.1 8B sometimes better with multitask
- Other models "completely fall apart" with multiple instructions
- Model choice matters more than you think

**4. Cognitive Overload Is Real**
- Multi-task prompts risk "overwhelming their models"
- Models neglect or misinterpret parts of instructions
- Result: Less accurate, less reliable outputs

**5. Efficiency Has Its Place (With Caveat)**
- Multitask can reduce inference time and token usage
- Only when tasks share context
- **Critical caveat**: "only if quality isn't compromised"

---

**Decision Framework**:

Eugene provides practical guidance:

- **Prioritize single-task** when: Precision, clarity, detailed reasoning are non-negotiable, especially with smaller models
- **Consider multi-task** only when: Efficiency crucial AND powerful model AND closely related tasks
- **Structure multi-task** with: Clear delineation to minimize confusion and cognitive bottlenecks

**Bottom line**: "The optimal number of tasks per prompt isn't universal—it depends on your specific model capabilities, task complexity, and whether you're prioritizing accuracy or efficiency."

---

**Potential Connections**:
- [[Cognitive load theory]] - Why multitasking degrades performance
- [[Model architecture differences]] - Why some models handle multitasking better
- [[Prompt engineering]] - Best practices for LLM instruction
- [[Accuracy vs efficiency trade-off]] - Core decision framework
- [[Task decomposition]] - Breaking complex work into single tasks

**Keywords**: #synthesis #research-summary #prompt-engineering #llm-performance #accuracy-vs-efficiency #ai-extracted
