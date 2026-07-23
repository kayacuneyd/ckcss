---
title: Reset password
paths:
  - site/patterns/auth/reset-password.html
order: 16
family: auth
wave: 3
---

The classic "forgot password" flow: a request-email form, and the confirmation
state shown after submitting. Distinct from `account-recovery` (below), which
covers what to do when the user *can't* use email at all.

## States

Two states shown side by side on the static reference page (`data-ck-state`
documents which is which — used for reference only, not for styling):

- `request` — the default form state.
- `sent` — the post-submit confirmation (`ck-alert--success`, `role="status"`
  `aria-live="polite"` so assistive tech announces it without a page reload).

In real use, the server/JS renders one state in place of the other; a static
pattern page shows both stacked for reference, exactly like `site/states.html`
already does for its own state examples.

## Semantic HTML & accessibility

- Confirmation state uses `role="status"`/`aria-live="polite"` on the alert, the
  same pattern already used throughout the component catalog for non-error
  status messages.

## Tokens

`ck-sidebar`, `ckcss-auth` (shared with `auth.html`/`register.html`),
`ck-alert--success`, `ck-field`, `ck-input`, `ck-button`.

## Responsive behavior

Same `ck-sidebar` breakpoint as the rest of the auth family.
