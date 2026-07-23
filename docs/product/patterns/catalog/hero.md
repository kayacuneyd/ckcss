---
title: Hero
paths:
  - site/patterns/marketing/hero.html
order: 08
family: hero
wave: 2
---

Two hero layouts sharing one token set: a centered single-column hero and a
split hero with a media placeholder. Consolidates Flowbite's 18 hero screenshot
variants and its e-commerce-themed `storefront-hero` category into one family —
those 18 were style variants of the same underlying section, not distinct patterns.

## States

Static content pattern — no loading/error/empty states. Interactive elements are
the two CTA buttons (default/hover/focus-visible, all inherited from `.ck-button`
and the global focus ring — no pattern-specific state styling needed).

## Semantic HTML & accessibility

- One page `<h1>` plus one `<h2>` per variant, matching source/reading order.
- The split hero's media placeholder uses `role="img"` with a descriptive
  `aria-label` since it's a static placeholder, not a real `<img>`.
- Buttons are real `<a class="ck-button">` elements, not `<div>`s.

## Tokens

`ck-container`, `ck-stack`/`ck-stack--relaxed`, `ck-cluster`, `ck-grid--2`,
`ck-card`, `ck-button`/`--secondary`/`--quiet`. No new tokens or site-only classes.

## Responsive behavior

`ck-grid--2` collapses to one column below 40rem; the centered variant is
single-column at all widths by design.
