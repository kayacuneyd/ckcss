# ADR 0018: Centralize breakpoint values at build time

## Context

`layout.css` and `utilities.css` each hardcoded the same three raw breakpoint values
(`40rem`, `48rem`, `64rem`) independently across multiple `@media`/`@container` rules.
`var()` custom properties cannot be referenced inside a media feature per the CSS
Custom Properties spec, so the usual token mechanism can't remove this duplication.
Left as-is, a future change to what "the tablet breakpoint" means requires finding and
updating every literal occurrence by hand, with no single source of truth to check
against.

## Decision

Introduce `scripts/breakpoints.sh` as the one place `CK_BP_SM`/`CK_BP_MD`/`CK_BP_LG`
are defined. Source files (`src/layout.css`, `src/utilities.css`) reference them as
`$ck-bp-sm` / `$ck-bp-md` / `$ck-bp-lg` placeholders inside `@media`/`@container`
conditions. `build-foundation.sh` and `build-modules.sh` source `breakpoints.sh` and
call `ck_expand_breakpoints` on the assembled CSS before minification, so the
placeholders never reach `dist/`. This keeps [ADR 0001](0001-css-architecture.md)'s
guarantee intact: consumers still only ever see plain, static `@media (min-width: ...)`
rules in `dist/ckcss.css`; no build step is required of them, only of maintainers
producing a release, which was already true before this change.

## Consequences

- `layout.css` and `utilities.css` can never drift on what "sm"/"md"/"lg" means —
  there is exactly one file that defines the values.
- Editing `src/*.css` directly with a plain CSS linter will show the `$ck-bp-*`
  placeholders as invalid `@media`/`@container` conditions; this is an accepted
  trade-off of authoring convenience for de-duplication, consistent with how any
  preprocessed source (Sass, PostCSS custom media) is not valid CSS on its own either.
- `npm run build` must run before `dist/` reflects a `src/layout.css` or
  `src/utilities.css` change to breakpoint-scoped rules.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-23.
