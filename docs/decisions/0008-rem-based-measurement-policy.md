# ADR 0008: Use rem-based scalable measurements

## Context

CKCSS needs a predictable visual scale for spacing, typography, component
dimensions, and radius. Arbitrary pixel values make responsive composition and
user-controlled text sizing harder to reason about.

## Decision

Use `rem` for scalable design values: spacing, padding, gaps, typography,
component dimensions, radius, and container limits. Use `clamp()` with `rem`
minimum and maximum values plus a fluid viewport term where a value should grow
between breakpoints.

Retain `px` for pixel-sensitive details: 1px borders, hairlines, and 2–3px
focus outlines. Use `%`, `fr`, and `ch` for fluid layout and readable text
measurements. Use `999px` only for intentional pill shapes.

## Consequences

- New public tokens must use the policy and be documented in the component catalog.
- Existing component spacing remains token-driven rather than embedding units in
  individual selectors.
- The policy improves consistency and respects user font-size preferences without
  forcing every visual detail into `rem`.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-21.
