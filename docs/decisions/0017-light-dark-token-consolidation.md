# ADR 0017: Consolidate theme tokens with `light-dark()`

## Context

`src/tokens.css` defined every semantic color token once for light mode, then repeated
the full set again under `[data-ck-theme="dark"]` and a third time inside
`@media (prefers-color-scheme: dark) { :root:not([data-ck-theme]) { ... } }`. Two
hand-maintained copies of the same ~25 tokens invite drift: a value changed in one
block and not the other silently desyncs explicit dark mode from system-preference
dark mode. Two dark-only tokens (`--ck-color-primary-strong`, `--ck-color-danger-strong`)
had already drifted into raw hex literals that don't match any `--ck-iznik-*` scale
step, violating the token contract recorded in
[ADR 0011](0011-palette-and-aleo-typography.md).

## Decision

Use `light-dark()` (Baseline across evergreen Chrome, Firefox, and Safari releases
well inside the [ADR 0004](0004-browser-support.md) baseline) for every semantic
color token. `:root` sets `color-scheme: light dark` so the function resolves
automatically from system preference; `[data-ck-theme="dark"]` and
`[data-ck-theme="light"]` now only ever set `color-scheme`, never repeat token values.
The two drifted literals are replaced with direct references to existing
`--ck-iznik-cobalt-200` / `--ck-iznik-bole-200` scale steps, matching how every other
"-strong" alias already points at a named scale step.

## Consequences

- Every semantic token has exactly one declaration; there is no second block that can
  drift out of sync.
- `tests/token-contrast.mjs` and the token contract test are the source of truth for
  verifying the consolidated tokens still meet the WCAG AA policy from ADR 0011.
- Consumers on older non-evergreen engines that lack `light-dark()` fall back to
  whichever branch the engine's default color-scheme resolution picks; this is
  consistent with ADR 0004's "no paid browser-testing service required" posture and
  does not change the documented browser baseline.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-23.
