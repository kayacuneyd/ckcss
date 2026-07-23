---
title: Reviews
paths:
  - site/patterns/ecommerce/reviews.html
order: 45
family: reviews
wave: 8
---

Rating summary (average + distribution) + individual review list. Folds
Flowbite's `product-review` and `reviews-history` into one family. Complements
`product-detail.html` (wave 4) as a linkable, standalone section.

**Note:** this family was originally scoped for wave 4/7 in the gap-analysis
but was missed during those waves' implementation; built here in wave 8 to
close the gap rather than leave the 41-family backlog silently short by one.

## States
Static content pattern — no interactive states.

## Semantic HTML & accessibility
Star ratings are `aria-hidden` where a nearby number already states the score
(the summary card), and carry an explicit `aria-label` where no numeric text
is otherwise present (each review's per-item stars) — screen readers should
never be left to parse `★★★★☆` character-by-character.

## Tokens
`ck-grid--2`, `ck-card`.

## Responsive behavior
Collapses to one column below 40rem.
