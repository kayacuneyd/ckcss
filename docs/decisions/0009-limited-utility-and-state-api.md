# ADR 0009: Add a limited token-based helper and state API

## Context

Tailwind's broad utility and variant system offers flexibility, but reproducing
its complete matrix would conflict with CKCSS's build-free, semantic, small-core
product boundary. CKCSS still needs a few reusable helpers for accessibility,
typography, overflow, responsive visibility, and native state communication.

## Decision

Add a small `ck-utilities` layer containing named, token-based helpers. Keep
layout and components as the primary API. Use native pseudo-classes, ARIA
attributes, and scoped `data-ck-state` attributes for state. Add container
queries only as progressive enhancement with a viewport-safe fallback.

Arbitrary values, arbitrary selectors, class scanning, plugins, `@apply`, and a
JavaScript runtime remain out of scope.

## Consequences

- The public CSS grows only when a helper has a documented semantic use case.
- Accessibility helpers become reusable across static HTML projects.
- Components can expose selected states without inventing JavaScript-specific
  class contracts.
- The utility API must be reviewed for scope creep at every addition.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-21.
