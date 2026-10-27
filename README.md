# Skills

This repository is the source for the project-specific skills below.

## Repository Skills

Install globally with:

```bash
npx skills add mokronos/skills -s arch-check -g -y -a opencode -a codex -a claude-code
npx skills add mokronos/skills -s dev-servers -g -y -a opencode -a codex -a claude-code
npx skills add mokronos/skills -s effect -g -y -a opencode -a codex -a claude-code
npx skills add mokronos/skills -s effect-setup -g -y -a opencode -a codex -a claude-code
npx skills add mokronos/skills -s effect-workflows -g -y -a opencode -a codex -a claude-code
npx skills add mokronos/skills -s landing-page -g -y -a opencode -a codex -a claude-code
```

Update all global skills with:

```bash
npx skills update -g -y
```

## Base Agent Instructions

From the repository root, link the base agent instructions into OpenCode, Codex, and Claude:

```bash
ln -sfn "$(pwd)/base.AGENTS.md" ~/.config/opencode/AGENTS.md
ln -sfn "$(pwd)/base.AGENTS.md" ~/.codex/AGENTS.md
ln -sfn "$(pwd)/base.AGENTS.md" ~/claude/CLAUDE.md
```

## External Skills

```bash
npx skills add cursor/plugins -s unslop -g -y -a opencode -a codex -a claude-code
npx skills add RhysSullivan/skills -s quality-code -g -y -a opencode -a codex -a claude-code
npx skills add mattpocock/skills -s domain-modeling -g -y -a opencode -a codex -a claude-code
npx skills add mattpocock/skills -s grill-me -g -y -a opencode -a codex -a claude-code
npx skills add mattpocock/skills -s grilling -g -y -a opencode -a codex -a claude-code
npx skills add mattpocock/skills -s grill-with-docs -g -y -a opencode -a codex -a claude-code
npx skills add mattpocock/skills -s improve-codebase-architecture -g -y -a opencode -a codex -a claude-code
npx skills add mattpocock/skills -s retro -g -y -a opencode -a codex -a claude-code
npx skills add mattpocock/skills -s to-spec -g -y -a opencode -a codex -a claude-code
npx skills add mattpocock/skills -s to-tickets -g -y -a opencode -a codex -a claude-code
npx skills add vercel-labs/skills -s find-skills -g -y -a opencode -a codex -a claude-code
```

## Global Inventory

Snapshot from `npx skills ls -g --json` on 2026-08-14. These skills are currently
available to OpenCode or Codex:

- `domain-modeling`
- `effect-setup`
- `find-skills`
- `frontend-design`
- `grill-me`
- `grill-with-docs`
- `grilling`
- `improve-codebase-architecture`
- `landing-page`
- `logging-best-practices`
- `plannotator-annotate`
- `plannotator-last`
- `plannotator-review`
- `quality-code`

The following skills are installed for another agent and are not part of the
OpenCode/Codex restore commands above:

- `dogfood`
- `yuanbao`
