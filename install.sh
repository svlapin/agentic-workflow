#!/usr/bin/env bash
# Link the shared agent rules into the places agents read them.
# Safe to re-run. An existing real file is backed up once as *.pre-agentic-workflow.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    local src="$REPO_DIR/$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "$dst.pre-agentic-workflow"
        echo "backed up: $dst"
    fi
    ln -sfn "$src" "$dst"
    echo "linked: $dst -> $src"
}

# One rules file, linked under each name that agents look for.
link AGENTS.md ~/AGENTS.md            # generic
link AGENTS.md ~/.claude/CLAUDE.md    # Claude Code
link AGENTS.md ~/.codex/AGENTS.md     # Codex CLI

# Machine-specific notes. Never tracked.
if [ ! -e ~/AGENTS.local.md ]; then
    printf '%s\n' "<!-- Machine-specific notes. Not versioned. -->" > ~/AGENTS.local.md
    echo "created: ~/AGENTS.local.md"
fi
