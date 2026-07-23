---
title: CRUD read section
paths:
  - site/patterns/application/crud-read-section.html
order: 27
family: crud-read-section
wave: 6a
---

A read-only record detail view (`<dl>` key/value pairs) with both a full-page
edit link and a "quick edit" native dialog for a single field — demonstrates
that a page can pair `crud-form-page.html` and `crud-modal.html` for different
edit depths without inventing a third form pattern.

## States

The quick-edit dialog here is closed by default (`<dialog>` with no `open`
attribute), unlike `crud-modal.html`'s reference render — the basic (no-JS)
render of *this* page already shows the full record, so there's no
documentation need to force the modal open; it exists purely as an optional
enhancement, wired via `data-ck-dialog-open` + `enhance/dialog.js`.

## Semantic HTML & accessibility

- Uses `<dl>`/`<dt>`/`<dd>` for the key-value data — the semantically correct
  element for this content, not a table or styled `<div>` grid pretending to be
  one.
- Status is shown with `ck-badge--success`, matching how status is represented
  everywhere else in the catalog (`data-management.html`, `product-card.html`).

## Tokens

`ck-grid--2` (applied to the `<dl>` itself), `ck-badge--success`, `ck-dialog`,
`ck-max-readable`.

## Responsive behavior

The `<dl>`'s `ck-grid--2` collapses to one column below 40rem; the description
row's `grid-column: 1 / -1` keeps it full-width at both sizes.
