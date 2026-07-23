---
title: Product detail
paths:
  - site/patterns/ecommerce/product-detail.html
order: 20
family: product-detail
wave: 4
---

Single-product page: image, variant selection, quantity, add-to-cart form, and a
specs table. Folds Flowbite's `product-overview` and `product-information`
categories into one family — a specs table is just a section of the same
underlying product page, not a separate pattern.

## States

- Default: in-stock, `ck-alert--success` stock message.
- Implicitly documented but not separately rendered: an out-of-stock state would
  swap the alert to `ck-alert--danger` and disable the add-to-cart button
  (`disabled`/`aria-disabled="true"`) — left as a documented extension point
  rather than a second full page, since it's a one-line change to this same page.

## Semantic HTML & accessibility

- Color variant is a real radio `<fieldset>`/`<legend>` with `.ck-choice` divs
  (input + `<label for>` pairs), not the label-wraps-span shape — matches the
  convention already established in wave 3's `account-recovery.html`.
- Specs table has a visually-hidden `<h2>` landmark and `scope="row"`/`scope="col"`
  headers for correct table navigation with a screen reader.
- The "favorite" toggle button uses `aria-pressed="false"` (a real toggle button
  state, not a decorative heart icon with no semantics).

## Tokens

`ck-grid--2`, `ck-choice`, `ck-table`, `ck-alert--success`, `ck-field`.

## Responsive behavior

`ck-grid--2` collapses to one column below 40rem; image stays first in source
order on all widths.
