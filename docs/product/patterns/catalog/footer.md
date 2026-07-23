---
title: Footer
paths:
  - site/patterns/marketing/footer.html
order: 10
family: footer
wave: 2
---

A full multi-column footer (product/company/legal link groups + copyright + social
links) and a minimal single-row footer with an inline newsletter form.

## States

Newsletter form: default, and native `required`/`type="email"` invalid-state
feedback (browser-native, no `aria-invalid` styling needed since there's no
custom validation UI in this pattern — see `docs/product/components.md` for the
full `.ck-input[aria-invalid]` treatment when a page needs custom error copy).

## Semantic HTML & accessibility

- Each link group is its own `<nav aria-label="...">` — three distinct landmarks,
  not one generic `<nav>` wrapping everything.
- The mini footer's form has a visually-hidden `<label>` for the email field
  (`ck-visually-hidden`) so screen reader users get a labeled field even though
  the placeholder alone would be visually sufficient.

## Tokens

`ck-grid--3`, `ck-cluster`/`--spread`, `ck-stack`/`--compact`, `ck-field`
(implicitly via `ck-input`/`ck-button`), `--ck-color-border`, `--ck-space-4`.

## Responsive behavior

`ck-grid--3` collapses to one column below 40rem; the mini footer's cluster wraps
naturally via `ck-cluster`'s `flex-wrap`.
