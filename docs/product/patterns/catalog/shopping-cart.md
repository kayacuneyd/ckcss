---
title: Shopping cart
paths:
  - site/patterns/ecommerce/shopping-cart.html
order: 22
family: shopping-cart
wave: 4
---

A full-page cart (table of line items + summary), deliberately **not** an
off-canvas/drawer mini-cart. Per
`docs/research/ui-kit-patterns-gap-analysis.md`, the off-canvas variant is
deferred to wave 6b alongside the CRUD-drawer architecture question (compose
from `[popover]` first; a new `ck-drawer` component is a fallback, not a
default) — building it here would have quietly smuggled that open question into
an "unblocked" wave.

## States

- Default: populated cart table.
- Empty: a `data-ck-state="empty"` card is present in the markup (`hidden`) as a
  documented reference for what the empty state looks like — in real use the
  server/JS toggles which of the two blocks renders, exactly like
  `reset-password.html`'s two-state reference pattern from wave 3.

## Semantic HTML & accessibility

- Cart items are a real `<table>` with a visually-hidden `<caption>` and
  `scope="row"` product-name headers — not a list of styled `<div>`s.
- Each quantity `<input type="number">` has its own visually-hidden `<label>`
  (`for`/`id`) naming which product it belongs to, since the visible column
  header ("Adet") alone doesn't disambiguate rows for screen reader users
  navigating input-by-input rather than row-by-row.
- "Kaldır" (remove) is a real `<button type="button">` per row.

## Tokens

`ck-table`, `ck-sidebar--end`, `ck-card`, `ck-visually-hidden`.

## Responsive behavior

`ck-table-wrap` provides horizontal scroll on narrow viewports rather than
letting the table overflow the page; `ck-sidebar--end` collapses to one column
below 48rem.
