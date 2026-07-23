---
title: Advanced table
paths:
  - site/patterns/application/advanced-table.html
order: 24
family: data-table
wave: 5
---

Row-selection checkboxes, a bulk-action toolbar, sortable-column markup, and a
totals footer row — complements `data-management.html`'s search/filter/
pagination table. Together they cover Flowbite's `table-headers`,
`table-footers`, `advanced-tables`, and `filter` categories as one "data-table"
family.

## States

- Bulk toolbar: shown here with 2 rows selected (a real, always-visible reference
  state on this static page — in production it would only render once ≥1 row is
  checked).
- Sort: `aria-sort="ascending"` shown on one column header as the documented
  markup shape; the actual sort behavior is server/JS-driven and out of scope
  for a static pattern.

## Semantic HTML & accessibility

- The bulk-action row uses `role="toolbar"` with an `aria-label`, grouping
  related buttons for assistive tech.
- Every checkbox (select-all and per-row) has its own visually-hidden `<label>`
  naming exactly what it selects — same convention as wave 4's
  `shopping-cart.html` quantity inputs.
- The totals row is a real `<tfoot>`, a distinct semantic region from `<tbody>`,
  not just a styled last row.

## Tokens

`ck-table`, `ck-badge`, `ck-visually-hidden`. No new tokens or classes.

## Responsive behavior

Same `ck-table-wrap` horizontal-scroll behavior as `data-management.html`.
