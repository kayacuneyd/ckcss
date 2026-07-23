---
title: App navbar
paths:
  - site/patterns/application/app-navbar.html
order: 23
family: app-shell
wave: 5
---

An in-app top bar (brand + global search + notifications + user menu) that
complements `app-shell.html`'s sidenav/toolbar/dashboard content, plus an
app-level footer bar. Together, `app-shell.html` + this page cover Flowbite's
`sidenav`, `navbar`, `navbars`, `shells`, and `dashboard-footer` categories as
one "app-shell" family — this page fills the two pieces `app-shell.html` didn't
already have (a dedicated top navbar with a user/notifications menu, and an
app-level footer bar), rather than rebuilding what it already covers well.

## States

- Notifications: badge count shown (`ck-badge--danger`) when unread items exist;
  the `<details>` dropdown open/closed state is native, no JS state to design.
- User menu: same native `<details>` open/closed pattern.

## Semantic HTML & accessibility

- Both dropdowns are native `<details>`/`<summary>` — same JS-free approach as
  the wave 2 `header.html` mobile nav and the existing `mobile-navigation.html`.
- Search input has a visually-hidden `<label>`.
- The footer's status/quick-links `<nav>` has its own `aria-label`, distinct
  from the main app navigation landmark.

## Tokens

`ck-cluster`/`--spread`, `ck-field`, `ck-avatar`, `ck-badge--danger`, `ck-card`
(dropdown panels), `--ck-z-dropdown` (the dropdown panels are the first real
usage of this token outside the base token scale — confirms it wasn't dead
weight).

## Responsive behavior

The cluster-based layout wraps naturally at narrow widths; a production page
would likely collapse search/notifications into the `header.html` mobile-nav
`<details>` pattern from wave 2 below a chosen breakpoint — left as an
integration note rather than duplicated here.
