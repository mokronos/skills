---
name: effect
description: Use when writing or analyzing Effect-TS code.
---


## Core
- Use Effect.gen(function* () { ... }) for composition.
- Use Effect.fn("Domain.method") for named/traced effects and Effect.fnUntraced for internal helpers.
- Effect.fn / Effect.fnUntraced accept pipeable operators as extra arguments, so avoid unnecessary outer .pipe() wrappers.
- Use Effect.callback for callback-based APIs.
- Use Effect.void instead of Effect.succeed(undefined) or Effect.succeed(void 0).
- Prefer DateTime.nowAsDate over new Date(yield* Clock.currentTimeMillis) when you need a Date.

## Schemas and errors
- Use Schema.Class for multi-field data.
- Use branded schemas (Schema.brand) for single-value types.
- Use Schema.TaggedErrorClass for typed errors.
- Use Schema.Defect instead of unknown for defect-like causes.
- In Effect.gen / Effect.fn, prefer yield* new MyError(...) over yield* Effect.fail(new MyError(...)) for direct early-failure branches.

## Guidelines
- Use Effect.gen(function* () { ... }) for multi-step workflows.
- Use Effect.fn("Name") or Effect.fnUntraced(...) for named effects when adding reusable service methods or important workflows.
- Prefer Effect Schema for API and domain data shapes. Use branded schemas for IDs and Schema.TaggedErrorClass for typed domain errors when modeling new error surfaces.
- Keep HTTP handlers thin: decode input, read request context, call services, and map transport errors. Put business rules in services.
- In Effect service code, prefer Effect-aware platform abstractions and dependencies over ad hoc promises where the surrounding code already does so.
- Keep layer composition explicit. Avoid broad hidden provisioning that makes missing dependencies hard to see.
- In tests, prefer the repo's existing Effect test helpers and live tests for filesystem, git, child process, locks, or timing behavior.
- Do not introduce any, non-null assertions, unchecked casts, or older Effect APIs just to satisfy types.
- Do not answer from memory. Verify against .references/effect-smol or nearby code first.

## Preferred Effect services
- In effectified services, prefer yielding existing Effect services over dropping down to ad hoc platform APIs.
- Prefer FileSystem.FileSystem instead of raw fs/promises for effectful file I/O.
- Prefer ChildProcessSpawner.ChildProcessSpawner with ChildProcess.make(...) instead of custom process wrappers.
- Prefer HttpClient.HttpClient instead of raw fetch.
- Prefer Path.Path, Config, Clock, and DateTime when those concerns are already inside Effect code.
- For background loops or scheduled tasks, use Effect.repeat or Effect.schedule with Effect.forkScoped in the layer definition.

## Effect.cached for deduplication
- Use Effect.cached when multiple concurrent callers should share a single in-flight computation rather than storing Fiber | undefined or Promise | undefined manually. See specs/effect/migration.md for the full pattern.

## Callback boundaries
- Use EffectBridge for native or external callbacks (@parcel/watcher, node-pty, native fs.watch, plugin callbacks, etc.) that need to re-enter Effect services with instance/workspace context.
- Plain async code should pass explicit context or stay inside an Effect fiber; do not add ambient instance context shims.
