---
title: Product card
paths:
  - site/patterns/ecommerce/product-card.html
order: 19
family: product-card
wave: 4
---

Category filter + product grid. Folds Flowbite's separate `product-cards` and
`product-categories` categories into one family — a category filter is just a
control bolted onto the same underlying grid.

## States

- Default: populated grid.
- Loading: one card shown with `data-ck-state="loading"` and `ck-skeleton`
  placeholders for image/text — the documented way to represent this state
  without inventing new markup.

## Semantic HTML & accessibility

- Category filter is a real `<nav aria-label="Ürün kategorileri">` of `<a>`
  links, `aria-current="true"` on the active one — not a `<div>` of `onclick`
  handlers.
- "Sepete ekle" (add to cart) is a real `<button type="button">` since it has no
  form to submit on this page (the actual add-to-cart submission happens on
  `product-detail.html`'s form).

## Tokens

`ck-grid--3`, `ck-badge`, `ck-card`, `ck-skeleton`.

## Responsive behavior

`ck-grid--3` collapses to one column below 40rem; the category filter wraps via
`ck-cluster`'s `flex-wrap`.
