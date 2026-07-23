---
title: Payment forms
paths:
  - site/patterns/ecommerce/payment-forms.html
order: 29
family: payment-forms
wave: 7
---

A standalone, reusable card + billing-address form — the same form embedded in
`checkout.html`'s flow, extracted so it can be used on its own (e.g. an
"update payment method" account page).

## States

Native browser validation only (`required`, `inputmode="numeric"`,
`maxlength="4"` on CVC) — no custom validation UI in the basic pattern.

## Semantic HTML & accessibility

- Every card field uses the correct `autocomplete` token (`cc-name`,
  `cc-number`, `cc-exp`, `cc-csc`) so browser/password-manager autofill works
  correctly for payment forms specifically.
- `inputmode="numeric"` opens a numeric keyboard on mobile without changing the
  field's `type` away from `text` (a real credit-card number isn't a
  spin-button `type="number"`).

## Tokens

`ck-field`, `ck-choice`, `ck-alert`, `ck-grid--2`.

## Responsive behavior

`ck-grid--2` (expiry/CVC row) collapses to one column below 40rem.
