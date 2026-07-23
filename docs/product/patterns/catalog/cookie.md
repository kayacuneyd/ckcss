---
title: Cookie consent
paths:
  - site/patterns/marketing/cookie.html
order: 44
family: cookie
wave: 8
---

A cookie-consent bar offering a real accept/reject choice rather than a single
acknowledgement button.

## States
Default (shown) and dismissed-after-choice — same `data-ck-state="dismissed"`
convention `.ck-alert` already documents, referenced rather than duplicated.

## Semantic HTML & accessibility
`role="region"` + `aria-label` identifies the consent bar as a distinct page
region for assistive tech.

## Tokens
`ck-card`, `ck-cluster--spread`.

## Responsive behavior
`ck-cluster--spread` wraps naturally on narrow viewports.
