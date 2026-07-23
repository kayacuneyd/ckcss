---
title: Feature
paths:
  - site/patterns/marketing/feature.html
order: 12
family: feature
wave: 2
---

A three-column feature grid for equally-weighted features, and an alternating
text/media row layout for features that need deeper individual explanation.

## States

Static content pattern — no interactive states beyond the badges/cards already
covered by the components layer.

## Semantic HTML & accessibility

- Grid variant uses `<article>` per feature card (self-contained unit of content).
- Row variant's media placeholders use `role="img"` + descriptive `aria-label`,
  same convention as the hero pattern's placeholder.
- Both variant headings (`<h2>`) are visually hidden (`ck-visually-hidden`) since
  the eyebrow text already communicates "which variant" visually and the heading
  exists purely to give screen reader users a landmark boundary between variants.

## Tokens

`ck-grid--3`, `ck-grid--2`, `ck-card`, `ck-badge`, `--ck-space-5`.

## Responsive behavior

Both grids collapse to one column below 40rem. The row variant alternates which
side text/media sit on per row — source order matches each row's own visual
order (no CSS reordering), so reading order stays correct at every width.
