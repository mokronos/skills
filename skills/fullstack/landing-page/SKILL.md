---
name: landing-page
description: Use when creating or redesigning a project's website or landing page using T3 Code and UsefulSoftwareCo/executor as references, including GitHub Pages deployment.
---

# Landing Page

Research the current T3 Code and Executor landing pages, combine their strongest applicable ideas, and build a distinctive landing page for the active project. Complete the work through deployment when the user has asked to publish it.

## Principles

- Inspect before deciding. Do not assume the target project's stack, package manager, build command, default branch, or GitHub Pages URL shape.
- Use the references for design direction and implementation evidence, not as templates to copy. Do not copy names, logos, illustrations, prose, proprietary assets, or large blocks of source code.
- Prefer the target project's existing stack and design system. Adopt a reference's stack only when the project has no suitable frontend or there is a concrete technical benefit.
- Tailor the information architecture and copy to the target project. Never leave reference-product language or generic placeholder copy in the result.
- Preserve unrelated worktree changes and avoid destructive Git operations.
- Continue autonomously unless a decision materially affects product direction, requires destructive migration, or cannot be inferred from the repository.

## 1. Inspect The Target Project

Before researching solutions, establish what this project needs:

- Read its README, contributor or agent instructions, package manifests, lockfiles, frontend entry points, styling configuration, asset directories, and existing deployment workflows.
- Identify the product's purpose, audience, primary call to action, real features, available screenshots or demos, brand assets, and repository URL.
- Determine whether a landing page already exists and whether it is part of an application that must keep working.
- Check Git status. Never overwrite or include unrelated user changes.
- Determine the package manager, build command, static output directory, default branch, repository name, and whether the site will be hosted at a user/org root or at `/<repository>/`.

## 2. Research Both References

Research the latest canonical repositories and live sites rather than relying on memory.

### T3 Code

- Locate the canonical open-source T3 Code repository associated with Theo/T3.
- Inspect the package manifest, framework configuration, landing-page source, shared components, styling setup, font loading, assets, animations, and deployment-related files.
- Open the live landing page at desktop and mobile sizes when available.

### Executor

- Inspect <https://github.com/UsefulSoftwareCo/executor/> and its live landing page, if one is linked.
- Inspect the same implementation and visual details as for T3 Code.
- If the live site and repository differ, record that rather than guessing which implementation produced the site.

For each reference, capture concise evidence about:

- Exact framework, styling, animation, icon, and build dependencies relevant to the landing page.
- Page structure, visual hierarchy, typography, color, spacing, texture, imagery, interaction, responsive behavior, and calls to action.
- Techniques worth adapting and techniques that do not fit the target project.

Distinguish facts observed in source from visual inference. Link important repository paths or URLs in the final summary.

## 3. Choose A Direction

Create a small comparison of the references, then choose a coherent direction rather than averaging every visual choice.

- Take the best applicable structural, technical, and visual ideas from each reference.
- Explain the selected stack and design direction in one or two sentences before implementation.
- Preserve established project conventions unless they prevent a static GitHub Pages deployment.
- Avoid generic landing-page defaults such as interchangeable gradient heroes, unsupported metrics, excessive rounded cards, or decorative effects with no relationship to the product.

Ask one focused question only when the repository cannot answer a material question, such as:

- Two substantially different visual directions are equally plausible.
- The primary call to action or audience is unclear.
- Required copy, screenshots, or brand assets do not exist and cannot be derived honestly.
- Adopting the reference stack would require replacing an existing frontend.
- Publishing requires a repository, organization, domain, or permissions choice the user has not made.

Otherwise, make a justified choice and proceed.

## 4. Implement The Page

- Build the complete page in the target repository, using its package manager and conventions.
- Keep dependencies minimal. Add a dependency only when it provides meaningful value over the existing stack or native CSS/browser APIs.
- Include polished responsive states for narrow mobile, tablet, and desktop layouts.
- Make navigation, links, buttons, focus states, reduced-motion behavior, semantic structure, contrast, and keyboard use production-ready.
- Use real project copy and real links. Do not invent testimonials, adoption numbers, customer logos, or performance claims.
- Optimize assets and avoid broken root-relative paths under a GitHub project Pages base path.
- Preserve application routes and behavior if the landing page shares a frontend with the product.

Use browser automation when available to inspect the result at desktop and mobile sizes. Fix visual overflow, console errors, failed requests, layout shifts, and non-functional interactions before deployment.

## 5. Configure GitHub Pages

Create or update a GitHub Actions workflow for Pages, normally `.github/workflows/deploy-pages.yml`.

- Follow the framework's official static deployment guidance and GitHub's current Pages Actions guidance.
- Trigger deployment from the actual default branch and `workflow_dispatch`.
- Install dependencies with the detected package manager's frozen-lockfile mode.
- Build the production site and upload the actual static output directory with `actions/upload-pages-artifact`.
- Deploy with `actions/deploy-pages`, with `contents: read`, `pages: write`, and `id-token: write` permissions and the `github-pages` environment.
- Use current stable major versions of official GitHub actions, verified from their repositories or GitHub documentation at implementation time.
- Configure the framework's base path or asset prefix for `/<repository>/` when this is a project Pages site. Do not apply that prefix to a user/org root site or a confirmed custom domain.
- Keep local development at `/` when the framework supports environment-specific base paths.
- Add SPA fallback handling only if the application actually needs client-side routes and the chosen static-hosting approach supports it safely.

Run the exact production build locally and inspect the generated output before publishing.

## 6. Publish And Verify

Only commit, push, change repository settings, or trigger a deployment when the user has explicitly requested publication.

- Confirm the GitHub remote, authenticated account, target branch, Pages source, and repository permissions.
- Stage only files belonging to this task. Never include unrelated worktree changes.
- Use normal non-force Git operations and respect branch protection.
- Enable GitHub Pages with GitHub Actions as the source when necessary and permitted.
- Push the deployment workflow and implementation, then monitor the Actions run to completion.
- Open the final Pages URL and verify the hero, assets, links, responsive layout, browser console, and direct navigation to any supported routes.
- If authentication, permissions, branch protection, DNS, or repository settings block publication, leave the repository buildable and report the exact blocker and shortest next action.

## Final Report

Summarize:

- What was learned from T3 Code and Executor, with the most relevant source links.
- Which ideas were adopted from each and why they fit this project.
- The implemented stack and principal files changed.
- Build and browser checks performed.
- The GitHub Actions run and live Pages URL, or the exact deployment blocker.
