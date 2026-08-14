# Skills

This repository is the source for the project-specific skills below.

## Repository Skills

Install globally with:

```bash
npx skills add mokronos/skills -s arch-check -g -y
npx skills add mokronos/skills -s effect -g -y
npx skills add mokronos/skills -s effect-setup -g -y
npx skills add mokronos/skills -s effect-workflows -g -y
npx skills add mokronos/skills -s landing-page -g -y
```

Update all global skills with:

```bash
npx skills update -g -y
```

## Base Agent Instructions

Copy the base agent instructions into your home directory:

```bash
cp base.AGENTS.md ~/AGENTS.md
```

## External Skills

```bash
npx skills add RhysSullivan/skills -s quality-code -g -y
npx skills add mattpocock/skills -s domain-modeling -g -y
npx skills add mattpocock/skills -s grill-me -g -y
npx skills add mattpocock/skills -s grilling -g -y
npx skills add mattpocock/skills -s grill-with-docs -g -y
npx skills add mattpocock/skills -s improve-codebase-architecture -g -y
npx skills add vercel-labs/skills -s find-skills -g -y
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
