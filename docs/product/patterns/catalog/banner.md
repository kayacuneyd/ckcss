---
title: Banner
paths:
  - site/patterns/marketing/banner.html
order: 37
family: banner
wave: 8
---

A top-of-page announcement strip, shown above `<main>` (before the skip link's
target, matching how such banners sit outside primary content in real sites).

## States
Default (visible) and dismissed — dismissal needs a small script (or the same
`data-ck-state="dismissed"` attribute pattern `.ck-alert` already uses); the
static reference page documents this rather than requiring it, per patterns.md
rule 3 (JS optional, page fully usable without it).

## Semantic HTML & accessibility
`role="note"` on the wrapping div signals supplementary, non-critical content.

## Tokens
`ckcss-section--ink` (existing, shared with `cta.html`), `ck-button--quiet`.

## Responsive behavior
`ck-cluster--spread` wraps naturally on narrow viewports.
