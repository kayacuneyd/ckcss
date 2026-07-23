---
title: Orders overview
paths:
  - site/patterns/ecommerce/orders-overview.html
order: 33
family: orders-overview
wave: 7
---

A customer-facing order-history table — distinct from wave 5's
`advanced-table.html` (an internal/admin data table with bulk actions): this
one is a simpler, read-mostly list linking out to `status-timeline.html` and
`request-form.html` per row.

## States

Static list pattern — no loading/empty/error states beyond what
`data-management.html` already documents generically for tables.

## Semantic HTML & accessibility

- Status badges reuse the same color convention as the rest of the catalog
  (`ck-badge--success`/`ck-badge`/`ck-badge--warning` for
  done/in-progress/needs-attention).
- Per-row action links have descriptive text ("Detay", "Talep gör") rather
  than repeated bare "Click here" text, since screen reader users often
  navigate a page's links out of table context.

## Tokens

`ck-table`, `ck-badge`, `ck-button--quiet`.

## Responsive behavior

Same `ck-table-wrap` horizontal-scroll behavior as `data-management.html`/
`advanced-table.html`.
