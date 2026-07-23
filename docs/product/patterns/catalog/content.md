---
title: Content
paths:
  - site/patterns/marketing/content.html
order: 13
family: content
wave: 2
---

A long-form article layout with a table-of-contents/tip sidebar, built on
`ck-sidebar--end` so the sidebar sits after the article in both source order and
(at ≥48rem) visual order.

## States

Static content pattern — no interactive or loading/error states.

## Semantic HTML & accessibility

- `<article>` for the main content, `<aside>` for the sidebar — correct landmark
  roles for assistive technology.
- Pull quote is a real `<blockquote>` (`ckcss-quote`, existing site-only class),
  not a styled `<p>`.
- The "on this page" nav is a real `<nav aria-label="Sayfa içi bağlantılar">`.

## Tokens

`ck-sidebar`/`--end`, `ck-max-readable`, `ckcss-quote` (existing), `ck-alert`.

## Responsive behavior

`ck-sidebar` collapses to one column below 48rem — the sidebar flows after the
article, matching source order (no reflow needed since `--end` already puts the
sidebar second in the DOM).
