---
title: Team
paths:
  - site/patterns/marketing/team.html
order: 36
family: team
wave: 8
---

Team-member card grid: avatar, name, title, social links.

## States
Static content pattern — no interactive states.

## Semantic HTML & accessibility
Each card has its own `<nav aria-label="<name> sosyal bağlantıları">` since
multiple identically-purposed navs on one page each need a distinguishing
label for assistive tech.

## Tokens
`ck-grid--3`, `ck-avatar`.

## Responsive behavior
Collapses to one column below 40rem.
