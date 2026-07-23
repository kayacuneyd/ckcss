---
title: CTA
paths:
  - site/patterns/marketing/cta.html
order: 11
family: cta
wave: 2
---

A centered full-width CTA banner and a split CTA with an inline email-capture
form. A fuller, standalone-page version of the brief inline CTA demo already at
`site/marketing-patterns.html#cta` — that one stays as a compact catalog example,
this is the complete pattern with its own documented states/tokens.

## States

Email form: default and native browser validation feedback (`required`,
`type="email"`), same as the footer family's newsletter form — no custom
validation UI in the basic pattern.

## Semantic HTML & accessibility

- The ink-toned banner is `<section class="ckcss-section--ink ck-card">` — an
  existing site-only class, not a new one.
- The split variant's form has a real `<label>` (not just a placeholder) tied to
  the input via `for`/`id`.

## Tokens

`ckcss-section--ink` (existing), `ck-card`, `ck-cluster`, `ck-grid--2`,
`ck-field`, `ck-button`/`--secondary`.

## Responsive behavior

`ck-grid--2` collapses to one column below 40rem; the centered banner's button
cluster wraps via `ck-cluster`'s `flex-wrap`.
