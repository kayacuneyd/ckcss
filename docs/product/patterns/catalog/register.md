---
title: Register
paths:
  - site/patterns/auth/register.html
order: 15
family: auth
wave: 3
---

Account-creation form, sharing `auth.html`'s two-pane `ckcss-auth` layout so login
and register feel like one continuous flow rather than two disconnected designs.
`auth.html`'s "Kayıt olun" link now points here instead of a dead `#signup` anchor.

## States

Default form + native browser validation (`required`, `minlength="8"` on the
password field, `type="email"`) — no custom validation UI in the basic pattern.

## Semantic HTML & accessibility

- Real `<label>`/`for` pairs on every field, including the terms checkbox
  (wrapped in a `<label>` so its whole text is clickable/tappable).
- Password field has a `<p class="ck-field__help">` stating the minlength rule
  before the user hits submit, not only as a native validation error after.

## Tokens

`ck-sidebar`, `ckcss-auth`/`ckcss-auth-aside`/`ckcss-auth-form` (existing,
shared with `auth.html`), `ck-field`, `ck-input`, `ck-button`.

## Responsive behavior

Inherits `auth.html`'s existing `ck-sidebar` breakpoint behavior — collapses to
one column below 48rem.
