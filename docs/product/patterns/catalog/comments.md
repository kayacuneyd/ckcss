---
title: Comments
paths:
  - site/patterns/publisher/comments.html
order: 46
family: comments
wave: 8
---

Threaded discussion list + a comment form. The only genuinely new Publisher
family — `blog-templates` and `related-articles` folded entirely into the
marketing `blog` family.

## States
Static content pattern — a real comment/reply round-trip is a server
concern outside CKCSS's scope; this documents the structure only.

## Semantic HTML & accessibility
Nested replies are nested `<ol>` lists (a list inside a list item) — this is
the correct way to convey "these replies belong to that comment" to assistive
technology, rather than visually indenting `<div>`s with no structural
relationship.

## Tokens
`ck-avatar`, `ck-textarea`, `ck-button--quiet`.

## Responsive behavior
Reply indentation (`padding-inline-start: var(--ck-space-6)`) stays constant
at all widths — no breakpoint needed for a single level of nesting.
