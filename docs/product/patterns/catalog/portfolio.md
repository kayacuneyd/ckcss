---
title: Portfolio
paths:
  - site/patterns/marketing/portfolio.html
order: 42
family: portfolio
wave: 8
---

A filterable project/case-study grid, reusing the same category-filter
convention as `product-card.html` (wave 4).

## States
Static content pattern — no interactive states beyond the filter links
themselves (filtering behavior would be server/JS-driven, out of scope for a
static pattern).

## Semantic HTML & accessibility
Whole cards are links (`<a class="ck-card">`) since each card has only one
destination (unlike `blog.html`, which needed a scoped title link because of
an additional badge).

## Tokens
`ck-grid--3`, `ck-badge`.

## Responsive behavior
Collapses to one column below 40rem; filter nav wraps via `ck-cluster`.
