---
title: Checkout
paths:
  - site/patterns/ecommerce/checkout.html
order: 21
family: checkout
wave: 4
---

Shipping address + payment method form with an order-summary sidebar.

## States

Static form pattern — native browser validation (`required`, `autocomplete`
hints for address autofill) is the only "state" beyond the default render; no
custom validation UI in the basic pattern.

## Semantic HTML & accessibility

- Address and payment sections are each their own `<fieldset>`/`<legend>` —
  screen reader users get the section grouping for free.
- Payment method is a real radio group (`.ck-choice` divs), matching the same
  convention as `product-detail.html`'s color selector and wave 3's
  `account-recovery.html`.
- Every address field uses the correct `autocomplete` token (`street-address`,
  `address-level2`, `postal-code`) so browser/password-manager autofill works.

## Tokens

`ck-sidebar--end`, `ck-choice`, `ck-field`, `ck-card` (order summary).

## Responsive behavior

`ck-sidebar--end` collapses to one column below 48rem; the summary card flows
after the form, matching source order.
