# ADR 0010: Govern the CKCSS public API by semantic categories

**Status:** The "existing numbered tokens remain supported" clause is
superseded by [ADR 0014](0014-type-scale-and-palette-alias-cleanup.md) — the
numbered font-size scale was removed during beta.

## Context

CKCSS is growing from a small component stylesheet into a reusable static CSS
kit. Tailwind demonstrates the value of a predictable public design API, but a
full utility matrix would conflict with CKCSS's build-free and semantic HTML
boundaries.

## Decision

Govern the public API in four categories: layout primitives, semantic
components, token-based helpers, and progressive layout enhancements. New
classes and tokens require a documented purpose, a live catalog example, and
contract coverage. Existing numbered tokens remain supported while semantic
aliases mature.

Arbitrary values, arbitrary selectors, class scanning, plugins, `@apply`, and
runtime JavaScript remain outside CKCSS Core.

## Consequences

- The API stays small enough to understand without a build tool.
- Component and layout composition remains more important than utility chains.
- Public surface growth is measurable and reviewable.
- Documentation and tests are part of the API addition, not follow-up work.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-21.
