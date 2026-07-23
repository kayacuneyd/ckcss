---
title: Header
paths:
  - site/patterns/marketing/header.html
order: 09
family: header
wave: 2
---

A site header with brand, horizontal nav, and two CTAs at ≥40rem, falling back to
a `<details>`/`<summary>`-based mobile menu below that — the same JavaScript-free
approach already documented at `site/mobile-navigation.html`, reused here rather
than introducing the `enhance/navigation.js` toggle for a pattern whose basic
render must work with zero JS per `docs/product/patterns.md` rule 3.

## States

- Default (≥40rem): horizontal nav + CTAs visible, mobile `<details>` hidden via
  `ck-only-mobile`.
- Mobile (<40rem): nav/CTAs hidden via `ck-hide-mobile`; `<details>` menu visible,
  open/closed is the native `<details>` state (no JS state to design).
- Current page: `aria-current="page"` on the active nav link — shown in both the
  desktop nav and the mirrored mobile list.

## Semantic HTML & accessibility

- `<header>` → `<nav aria-label="Ana gezinme">` (desktop) and a second
  `<nav aria-label="Mobil gezinme">` inside `<details>` (mobile) — two `<nav>`
  landmarks with distinct labels, not a duplicate-unlabeled pair.
- Native `<details>` gives full keyboard support (Enter/Space to toggle, no
  custom key handling needed) and works with zero JavaScript.

## Tokens

`ck-cluster`/`--spread`, `ck-nav`, `ck-button`/`--quiet`, `ckcss-mobile-nav`
(existing site-only class), `ck-hide-mobile`/`ck-only-mobile`.

## Responsive behavior

The `ck-hide-mobile`/`ck-only-mobile` pair switches at the existing 40rem
breakpoint (see the `display: revert` caveat already documented in
`src/utilities.css` — this pattern only uses them on plain nav/div elements, never
combined with a flex/grid primitive, so the revert-based restore is safe here).
A sticky header is a one-line CSS addition (`position: sticky` +
`var(--ck-z-sticky)`), not a separate pattern.
