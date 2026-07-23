---
title: Request form
paths:
  - site/patterns/ecommerce/request-form.html
order: 31
family: request-form
wave: 7
---

One structured form (order number + request type + description) reused for
refunds, warranty claims, service/repair requests, and general customer
service — Flowbite's `refund-forms`, `service-repair-forms`, `warranties`, and
`customer-service` categories are all structurally the same form with
different "request type" options.

## States

Native form validation only; no custom validation UI in the basic pattern.

## Semantic HTML & accessibility

- Request type is one `<fieldset>`/`<legend>` radio group using `.ck-choice`
  divs — same convention as `account-recovery.html` (wave 3) and
  `checkout.html` (wave 4), kept consistent across the whole catalog.
- The description `<textarea>` has a `.ck-field__help` line setting
  expectations before submission.

## Tokens

`ck-choice`, `ck-textarea`, `ck-field__help`.

## Responsive behavior

Single-column `ck-stack` layout works at every width with no breakpoint needed.
