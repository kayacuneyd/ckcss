---
title: Newsletter
paths:
  - site/patterns/marketing/newsletter.html
order: 40
family: newsletter
wave: 8
---

A newsletter signup backed by an explicit value-proposition list — distinct
from the compact newsletter forms already embedded in wave 2's `footer.html`
and `cta.html`, which assume the surrounding page already made the case to
subscribe.

## States
Native form validation only (`required`, `type="email"`).

## Semantic HTML & accessibility
Value props are a real `<ul>`, shown before the form in source order so
screen-reader users hear the "why" before reaching the input.

## Tokens
`ck-grid--2`, `ck-field`.

## Responsive behavior
Collapses to one column below 40rem.
