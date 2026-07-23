# Feature: UI Kit patterns

## Problem and user outcome

Developers building common page types (marketing sections, auth flows, dashboards,
e-commerce checkout, CRUD screens) currently have to compose CKCSS primitives from
scratch every time. A broader catalog of complete, copyable page patterns lets them
start from a working, accessible recipe instead of an empty page.

## Scope

- 41 pattern families (see `docs/research/ui-kit-patterns-gap-analysis.md` for the
  full derivation), grouped into 8 sequenced delivery waves, spanning marketing
  sections, auth/account flows, e-commerce, application shells/data tables, CRUD
  interactions, and transactional/support/publisher content.
- Each pattern is a complete page or page section built only from CKCSS tokens,
  layout primitives, semantic components, and the limited-helpers layer, per the
  5 rules already in `docs/product/patterns.md`.
- New pages live under `site/patterns/<group>/<pattern-id>.html`; the 10 existing
  flagship patterns stay at their current flat `site/` paths.
- Every pattern documents its full interactive state matrix
  (default/hover/focus/active/disabled/loading/empty/error), not just its default
  render.

## Non-goals

- Any JavaScript widget the product brief already excludes: date pickers,
  auto-rotating carousels, managed toast queues. CKCSS Enhance modules
  (`dialog.js`, `table.js`, `tabs.js`, `forms.js`) remain the only sanctioned
  optional behavior layer.
- Treating the Flowbite Blocks screenshots in `componens-img/` as source to copy —
  they are structural/visual reference only; no markup was captured, and none
  should be approximated from Tailwind conventions.
- A new `ck-drawer` component by default — the CRUD-drawer and off-canvas-cart
  patterns (wave 6b) must first be attempted as a composition of `[popover]`
  positioned via tokens; a new component is a fallback, not a starting point, and
  requires its own ADR and size-budget check.
- Expanding `docs/product/roadmap.md` into one row per wave — granular status is
  tracked in the local `docs/swarm/active-work.md` working file instead.

## States and acceptance criteria

- Given a new pattern page, when it's viewed with only the linked `ckcss.min.css`
  and no JavaScript, then the page renders fully and remains usable (patterns.md
  rule 3).
- Given a pattern with interactive elements, when a user tabs through it, then
  focus order matches visual/reading order and every focusable element has a
  visible `:focus-visible` state.
- Given a pattern's error/empty/loading states, when they're triggered, then they
  are documented and stylistically consistent with the same tokens as the default
  state — not a separate, undocumented visual language.
- Given the wave 6b drawer question, when a `[popover]`-based prototype is built,
  then `dist/ckcss.min.css` size is measured before/after and compared against the
  26624-byte budget before deciding whether a new component is justified.
- Given a completed wave, when accessibility and browser QA evaluate it, then they
  report zero axe violations and verified rendering at 375/768/1280px with real
  command-output evidence, matching the standard already set by SWARM-003.

## Open questions

- Whether any wave beyond 6b will need a new public `ck-` component/token, and if
  so which ADR number it lands on (checked freshly via `ls docs/decisions/` at
  that time, not assumed).
- Whether `product-patterns.html`/`marketing-patterns.html`'s existing partial
  coverage should be formally merged into the new `site/patterns/` pages or left
  as-is alongside them — left to each wave's designer to resolve case by case.
