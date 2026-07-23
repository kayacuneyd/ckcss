---
title: Discount & promo
paths:
  - site/patterns/ecommerce/discount-promo.html
order: 35
family: discount-promo
wave: 7
---

A campaign banner and a coupon-code form. Folds Flowbite's `discount` and
`promotional-sections` categories into one family — both exist to communicate
"you're getting a price advantage," just in different shapes (a passive banner
vs. an active code-entry form).

## States

- Coupon form: default, and an `ck-alert--success` confirmation shown
  `hidden` by default — same "documented but not forced open" convention as
  `crud-read-section.html`'s quick-edit dialog, since applying a real coupon
  needs a server round-trip this static page can't perform.

## Semantic HTML & accessibility

- The banner uses `ckcss-section--ink` (existing site-only class, already used
  by wave 2's `cta.html`), not a new class.
- Coupon input has a visually-hidden `<label>`.

## Tokens

`ckcss-section--ink`, `ck-alert--success`, `ck-cluster`.

## Responsive behavior

Both sections wrap via `ck-cluster`'s `flex-wrap` with no dedicated breakpoint.
