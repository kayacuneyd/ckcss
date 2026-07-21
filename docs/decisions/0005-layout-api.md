# ADR 0005: Composable layout primitives over float grids

## Context

CKCSS needs a compact layout API for static HTML that avoids W3.CSS-style float
columns and avoids a large utility-class matrix.

## Decision

Ship five layout primitives: `ck-container`, `ck-stack`, `ck-cluster`, `ck-grid`,
and `ck-sidebar`. They use logical properties, flexbox, CSS Grid, custom-property
configuration, and progressive responsive breakpoints. No float classes or fixed
12-column API are included in the first layout release.

## Consequences

- HTML remains readable and the public API stays small.
- Consumers can tune spacing and grid widths with documented `--ck-` tokens or
  component-local custom properties.
- Container queries and specialized layouts remain future enhancements, not a
  requirement for first-party pages.
