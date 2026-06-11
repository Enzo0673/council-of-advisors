# Council of Advisors

An AI reasoning skill for **Claude Code, Gemini CLI, Copilot CLI and Codex** — and for any AI interface via copy-paste prompts.

Simulates a council of 5 advisors with opposing perspectives, arbitrated by a President who delivers a final recommendation, key lessons and action plan.

## The 5 Advisors

| Role | Mission |
|------|---------|
| **The Contrarian** | Find flaws, blind spots, false assumptions |
| **The Thinker** | Deep root-cause analysis, underlying dynamics |
| **The Expansionist** | See bigger, find hidden opportunities |
| **The Observer** | Raw facts only, no interpretation |
| **The Executor** | Translate everything into concrete actions |

The advisors analyze the problem independently, then react to each other's ideas **without knowing who said what**. The **Council President** reads everything, arbitrates, and delivers:

- A final recommendation
- Key lessons learned
- A concrete action plan
- The main risk to watch

---

## Option A — Install as a skill (CLI tools)

For **Claude Code, Gemini CLI, Copilot CLI and Codex**. The skill auto-triggers when you describe a complex problem.

### One-liner (auto-detects your tools)

```bash
curl -fsSL https://raw.githubusercontent.com/Enzo0673/council-of-advisors/main/install.sh | bash
```

### npx

```bash
npx council-of-advisors
```

### Manual (per tool)

**Claude Code**
```bash
git clone https://github.com/Enzo0673/council-of-advisors \
  ~/.claude/plugins/marketplaces/council-of-advisors
```

**Gemini CLI**
```bash
git clone https://github.com/Enzo0673/council-of-advisors \
  ~/.gemini/plugins/council-of-advisors
```

**Copilot CLI**
```bash
git clone https://github.com/Enzo0673/council-of-advisors \
  ~/.copilot/plugins/council-of-advisors
```

**Codex**
```bash
git clone https://github.com/Enzo0673/council-of-advisors \
  ~/.codex/plugins/council-of-advisors
```

Then restart your AI CLI tool and invoke with `/council-of-advisors`.

---

## Option B — Use via prompt (no installation)

For **ChatGPT, Gemini, Claude.ai, Copilot, Poe, Mistral** — any interface with a text box.

All prompt files are in the [`portable/`](./portable/) directory.

### Quick start — universal one-shot

Copy the prompt from [`portable/one-shot-universal.md`](./portable/one-shot-universal.md), paste it at the start of any conversation, then describe your problem. The council activates for the whole session.

### Permanent setup (custom GPT / Gem / Project)

| Platform | File to use |
|----------|------------|
| ChatGPT Custom GPT | [`portable/chatgpt-gpt-instructions.md`](./portable/chatgpt-gpt-instructions.md) |
| Gemini Gem | [`portable/gemini-gem-instructions.md`](./portable/gemini-gem-instructions.md) |
| Claude.ai Project | [`portable/claude-project-instructions.md`](./portable/claude-project-instructions.md) |
| Poe, Copilot, Character.ai… | [`portable/other-platforms.md`](./portable/other-platforms.md) |

Paste the file content in the "Instructions" or "System prompt" field when creating your assistant.

### Trigger

In all versions, the council launches when you:
- Describe a complex problem or difficult decision
- Type **"pass this to the council"** or **`/council`**

---

## Example

> "Should I launch my SaaS product now or wait 3 more months?"

The council analyzes it from 5 angles, debates, and the President gives a clear recommendation with an action plan.

---

## Language

The council always responds in the user's language — French if you write French, English if you write English.

## License

MIT
