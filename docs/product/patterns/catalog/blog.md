---
title: Blog
paths:
  - site/patterns/marketing/blog.html
order: 38
family: blog
wave: 8
---

Blog post grid + a related-articles list. Folds Flowbite's `blog`,
`blog-templates`, and `related-articles` (the latter two from the Publisher
group) into one family — all three are variations of "list of posts."

## States
Static content pattern — no interactive states.

## Semantic HTML & accessibility
Image placeholders use `role="img"` + `aria-label`, same convention as
`hero.html`/`feature.html`. Post titles are real links inside `<h3>`, not
card-wrapping anchors, since each card also needs a separate category badge —
keeping the link scoped to the title avoids the whole card being one giant
ambiguous link target.

## Tokens
`ck-grid--3`, `ck-badge`, `ck-card`.

## Responsive behavior
Collapses to one column below 40rem.
