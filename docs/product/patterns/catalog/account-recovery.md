---
title: Account recovery
paths:
  - site/patterns/auth/account-recovery.html
order: 17
family: auth
wave: 3
---

Recovery-method chooser for when the user can't use their normal
email-reset-link flow — backup email, SMS, or manual support verification.
Links to `reset-password.html` for the common case where email access is fine.

## States

Static form pattern — no loading/error states beyond the native radio-group
selection itself.

## Semantic HTML & accessibility

- One `<fieldset>`/`<legend>` wraps the whole radio group — the initially-drafted
  version used a separate `<fieldset>` per option plus a redundant
  `role="radiogroup"`, which was corrected during implementation review to the
  single-fieldset-per-group pattern that's both simpler and matches native
  semantics (a `<fieldset>` + shared `name` already conveys "these are one
  group" without any ARIA role needed).
- Each option is a `.ck-choice` div (not its own fieldset) with a real
  `<label for>` pair.

## Tokens

`ck-sidebar`, `ckcss-auth` (shared), `ck-choice`, `ck-choice__help`, `ck-button`.

## Responsive behavior

Same `ck-sidebar` breakpoint as the rest of the auth family.
