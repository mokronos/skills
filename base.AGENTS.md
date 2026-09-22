# AGENTS.md

## General Rules

- If you need a paragraph-long comment to justify why a workaround is OK, the code is wrong — fix the code.
- Do not preserve backward compatibility.
- Choose the simplest implementation that fully meets the current requirements.
- Prefer established, well-maintained libraries over custom implementations.
- Make architectural decisions for the long term. Do not accept a stopgap that only works for now and is meant to be replaced later.
- Not everything needs a test. Don't write any tautological tests.
- Don't write any unnecessary comments describing what the code does or why you did it that way. Code should be self explanatory.

## Dev Server

- Generally, i have a dev server running already, so don't stop that one on the local checkout
- If you are on a worktree, always start a new dev server on an available port and give me the link so i can verify changes on worktrees as well
