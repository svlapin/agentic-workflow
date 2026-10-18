# agentic-workflow

Rules and a docs protocol for work with AI coding agents. Nothing here depends on one tool.

## What is inside

- `AGENTS.md` - general rules for any agent: communication, writing style, notes, and git.
- `docs-protocol/` - a protocol for agents to keep a knowledge base next to the code, with templates for evergreen docs and state docs.

## Install

```sh
git clone https://github.com/svlapin/agentic-workflow.git
cd agentic-workflow
./install.sh
```

The script links `AGENTS.md` to `~/AGENTS.md`, `~/.claude/CLAUDE.md` (Claude Code), and `~/.codex/AGENTS.md` (Codex CLI). An existing real file is backed up once as `*.pre-agentic-workflow`.

To update, run `git pull`. The links pick up changes at once.

In a project, agents read the project rules file. If the project has `AGENTS.md` and you also use Claude Code, link it: `ln -s AGENTS.md CLAUDE.md`.

## Local overlay

Details for one machine go in `~/AGENTS.local.md`. It is not tracked. `AGENTS.md` tells agents to read it first. The install script creates an empty stub.
