---
title: Account overview
paths:
  - site/patterns/ecommerce/account-overview.html
order: 34
family: account-overview
wave: 7
---

Customer-facing account hub: section nav, profile summary, and quick stats —
the e-commerce counterpart to `app-shell.html` (which is an internal/admin
shell), cross-linking to `orders-overview.html`, `checkout.html`, and
`payment-forms.html` as its sub-sections rather than duplicating their content.

## States

Static overview pattern — no loading/empty/error states.

## Semantic HTML & accessibility

- Account section nav is a real `<nav aria-label="Hesap bölümleri">` with
  `aria-current="page"` on the active item.
- Avatar uses `aria-hidden="true"` since the adjacent text already names the
  person — the avatar is decorative here, not the only identifying content.

## Tokens

`ck-sidebar`, `ck-avatar`, `ck-grid--3`, `ck-cluster--spread`.

## Responsive behavior

`ck-sidebar` collapses to one column below 48rem, same as every other sidebar
pattern in the catalog.
