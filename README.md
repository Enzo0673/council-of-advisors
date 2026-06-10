# Council of Advisors

A Claude Code skill plugin that analyzes complex problems through **5 advisors with opposing perspectives**, arbitrated by a Council President who delivers a final recommendation and action plan.

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

## Installation

```bash
git clone https://github.com/Enzo0673/council-of-advisors \
  ~/.claude/plugins/marketplaces/council-of-advisors
```

Then restart Claude Code.

## Usage

Invoke with the `Skill` tool or type `/conseil-des-conseillers` in any Claude Code session.

Works best for:
- Strategic decisions with multiple valid options
- Complex problems where you need multiple angles
- Any situation where you want to stress-test your thinking

## Example

> "Should I launch my SaaS product now or wait 3 more months?"

The council will analyze it from 5 angles, debate, and the President will give you a clear recommendation with an action plan.

## License

MIT
