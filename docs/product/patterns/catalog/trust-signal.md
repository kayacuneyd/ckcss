---
title: Trust signal
paths:
  - site/patterns/marketing/trust-signal.html
order: 14
family: trust-signal
wave: 2
---

Three ways to show "others already trust this": a customer-logo strip, a
testimonial grid, and stat badges. Folds Flowbite's separate `social-proof`,
`testimonial`, and `customer-logos` categories into one family — all three
communicate the same "trust signal" message in a different visual shape, per the
consolidation in `docs/research/ui-kit-patterns-gap-analysis.md`.

## States

Static content pattern — no interactive states.

## Semantic HTML & accessibility

- Logo strip is a `<ul role="list">` of plain text names (placeholders — real
  usage would use `<img alt="...">` logos, not styled text).
- Testimonials use `<figure>`/`<blockquote>`/`<figcaption>` so the quote and its
  attribution are programmatically associated, not just visually adjacent.
- Each variant's heading is visually hidden (`ck-visually-hidden`), same rationale
  as the `feature` family: the eyebrow communicates the variant visually, the
  heading exists for assistive-technology landmark boundaries.

## Tokens

`ck-cluster`/`--spread`, `ck-grid--3`, `ck-card`, `ckcss-pattern-number` (existing
site-only class, already used on `site/patterns.html`).

## Responsive behavior

`ck-grid--3` collapses to one column below 40rem; the logo strip and stat row
both wrap via `ck-cluster`'s `flex-wrap` rather than needing a breakpoint.
