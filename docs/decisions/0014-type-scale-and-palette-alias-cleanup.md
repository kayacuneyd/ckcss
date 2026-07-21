# ADR 0014: One named type scale and coherent palette alias steps

## Context

Two font-size scales shipped side by side: named
(`--ck-font-size-xs|sm|md|lg|xl|display`) and numbered
(`--ck-font-size-0…5`), with overlapping duplicates (`0` = `sm`, `1` = `md`,
`2` = `lg`, `3` = `xl`, `5` = `display`). A dual scale invites exactly the
naming confusion the brief lists as a pivot condition, and ADR 0010's clause
"existing numbered tokens remain supported" froze the duplication.

The `--ck-palette-coral|mint|violet-*` aliases also broke their own scale:
`coral-50` equalled `coral-100`, `violet-950` pointed at `plum-700`, and
`mint` mixed two source families (leaf and turquoise) across steps.

## Decision

During the beta window, remove the numbered font-size tokens and keep one
named scale: `xs, sm, md, lg, xl, 2xl, display`. The new
`--ck-font-size-2xl: clamp(1.5rem, 3vw, 2rem)` covers the old `-4` step used
by `h2`. Migration map: `0→sm`, `1→md`, `2→lg`, `3→xl`, `4→2xl`,
`5→display`. This supersedes the "numbered tokens remain supported" clause of
ADR 0010.

Keep the four alias names but remap each to a single İznik source family with
matching steps: `blue→cobalt` (already coherent, unchanged), `coral→bole`,
`mint→leaf`, `violet→plum` (`50/100/500/700/950`). No page, example, or
component consumed the old values, so no visual change is expected; alias
names are unchanged.

## Consequences

- One type scale to learn; the catalog and contracts test a single list.
- Token removal is acceptable only because CKCSS is pre-1.0; after 1.0 the
  same class of change requires a deprecation cycle per ADR 0010.
- Alias scales now behave predictably: 50 is the lightest step and 950 the
  darkest within one source family.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-21.
