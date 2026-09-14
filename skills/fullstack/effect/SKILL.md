---
name: effect
description: Use when writing or analyzing Effect-TS code.
---

## Before coding

- Before implementing Effect code, verify unfamiliar or version-sensitive APIs against the installed source, package declarations, and nearby current code, and search stable and unstable modules before building custom platform, concurrency, caching, scheduling, or resource infrastructure.

## Composition and boundaries

- Within Effect-owned code, keep workflows as `Effect<A, E, R>` and depend on Effect services until a genuine external adapter or application entry point; do not add Promise facades, nested runtimes, or ad hoc platform calls internally.
- Use `Effect.gen(function* () { ... })` for multi-step sequential workflows; return or pipe a single existing effect directly instead of wrapping it in a one-`yield*` generator.
- Use `Effect.fn("Domain.method")` for traced service methods and important workflows. Use `Effect.fnUntraced` for reusable effectful functions when call-site tracing would add noise or overhead, not for pure or single-use helpers.
- `Effect.fn` and `Effect.fnUntraced` accept pipeable transforms for cross-cutting behavior; ordinary `.pipe()` composition remains appropriate elsewhere.
- Use `Effect.void` instead of `Effect.succeed(undefined)` or `Effect.succeed(void 0)`.
- Every started Promise or fiber must be awaited, joined, scoped, supervised, or have its failure deliberately handled; discard only failures explicitly defined as irrelevant best-effort outcomes.

## Schemas

- Use Effect Schema as the source of truth for API and domain data, deriving TypeScript types from schemas. Decode untrusted values once with `Schema.decodeUnknownEffect(MySchema)(value)`; decode JSON text with `Schema.decodeUnknownEffect(Schema.fromJsonString(MySchema))(text)` instead of `JSON.parse` plus assertions or repeated shape probing.
- Use `Schema.Class` for composite domain models that benefit from a class and `Schema.Struct` for plain structural or wire data.
- Use `Schema.brand` for semantic primitive types whose accidental interchange would be a bug.
- For recursive schemas, keep any TypeScript helper needed by `Schema.suspend` private and derive the exported domain type from the schema.
- Do not introduce `any`, non-null assertions, unchecked casts, or obsolete Effect APIs to satisfy types.

## Errors and defects

- Use `Schema.TaggedErrorClass` for typed, serializable domain errors and yield tagged errors directly for early failure branches.
- Keep recoverable failures in the typed error channel and preserve their semantics instead of replacing them with `false`, `null`, empty collections, or other success values. Reuse an existing tagged error when only its message changes; add a distinct error only for different recovery, status, retry, UI, or telemetry behavior.
- Wrap throwing and Promise APIs at their boundary with `Effect.try` or `Effect.tryPromise` and translate failures into the typed channel. A third-party adapter may retain its native throwing convention only while the behavior remains contained and is translated immediately.
- Use `Effect.catchTag` or `Effect.catchTags` to translate selected typed failures instead of laundering an error union through manual `_tag` probing; keep stable user-facing messages separate from opaque internal causes.
- Never use `Effect.orDie` or `Effect.die` merely to erase a recoverable error type. Defects are appropriate only for proven invariant violations or at a runtime boundary that cannot represent typed failure.
- Use `Schema.Defect` when a schema must retain an opaque external cause.

## Services, layers, and resources

- Keep layer composition explicit and provide dependencies near the application boundary; avoid hidden provisioning that obscures requirements.
- Reuse the same parameterized layer value wherever one resource instance must be shared because layers memoize by reference identity.
- Acquire resources with scoped constructors or `Effect.acquireRelease`; attach background fibers to the owning scope with `Effect.forkScoped` so listeners, sockets, handles, and processes are released.
- Use `Effect.repeat` or `Effect.schedule` for in-memory repetition. Persist attempt state and next-run time when retries must survive process restarts.

## Platform services

- Prefer Effect platform services over ambient APIs: `FileSystem.FileSystem`, `HttpClient.HttpClient`, `ChildProcessSpawner.ChildProcessSpawner` with `ChildProcess.make(...)`, `Path.Path`, `Config`, `Clock`, `DateTime`, `Duration`, `Schedule`, `Random`, `Crypto`, and `Encoding`.
- Make networked service layers depend on `HttpClient.HttpClient`, then provide the client layer during application or test composition; do not pass layers as ordinary method options, expose `typeof globalThis.fetch` as a domain seam, or patch `globalThis.fetch` in tests.
- When a third-party library requires a fetch-shaped function, isolate a small adapter at that external boundary and delegate its implementation to Effect `HttpClient`.
- Use `Clock` or `DateTime` consistently throughout time-dependent logic so `TestClock` remains effective; use `DateTime.nowAsDate` when a `Date` is required.
- Keep portable byte data as `Uint8Array`; confine Node `Buffer` to Node-specific adapters and reject malformed encodings at the boundary.
- Use raw process spawning only for semantics the Effect process API cannot represent, such as a deliberately detached process that must outlive the parent fiber, and isolate that exception at the platform boundary.

## Caching

- `Effect.cached` returns an effect that creates a memoized effect; create it once during owner initialization and reuse the returned effect. It caches the full exit, including failures.
- Use `Cache` for keyed, bounded, or expiring lookups, and invalidate transient failures when later requests should retry rather than replay the cached failure.

## Callback boundaries

- Wrap callback APIs with `Effect.callback`; when registration installs a listener or allocates a handle, return an interruption-safe cleanup effect, and use the supplied `AbortSignal` when the underlying API supports cancellation.
- Capture required services in the owning Effect scope and pass context explicitly across external callbacks; do not introduce ambient context shims.

## Testing

- Use the repository's native Effect test integration, preferably `@effect/vitest` with `it.effect`; let Effect manage scoped fixtures and finalizers.
- Use `TestClock` and other test services for deterministic behavior. Use `it.live` only when the subject genuinely requires wall-clock or live-environment semantics, not merely because it touches files, git, processes, or locks.
- For the boundary under test, prefer real local fixtures for filesystem, process, locking, and protocol behavior when practical; replace its collaborators through explicit test layers rather than Promise-based harnesses or hidden globals.
