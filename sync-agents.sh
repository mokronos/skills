#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_file="$repo_root/base.AGENTS.md"

targets=(
  "$HOME/.config/opencode/AGENTS.md"
  "$HOME/.codex/AGENTS.md"
  "$HOME/claude/CLAUDE.md"
)

if [[ ! -f "$source_file" ]]; then
  printf 'Missing source file: %s\n' "$source_file" >&2
  exit 1
fi

for target in "${targets[@]}"; do
  mkdir -p "$(dirname -- "$target")"
  ln -sfn -- "$source_file" "$target"
  printf '%s -> %s\n' "$target" "$source_file"
done
