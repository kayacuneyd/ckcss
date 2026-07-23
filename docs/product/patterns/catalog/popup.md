---
title: Popup
paths:
  - site/patterns/marketing/popup.html
order: 41
family: popup
wave: 8
---

A marketing popup (welcome offer) built on the same native `<dialog>`
technique as `crud-modal.html`/`crud-drawer.html` — same mechanism, marketing
content instead of an application action. Shown declaratively `open` for
reference, per the established convention.

## States
Default (open, reference render). Show/hide-frequency logic (e.g. "once per
7 days") is a server/JS decision outside CKCSS's scope — the catalog stub says
so explicitly rather than silently implying CKCSS manages it.

## Semantic HTML & accessibility
Real `<label>` (visually hidden) on the email field; `method="dialog"` lets
either button close it without JS.

## Tokens
`ck-dialog`, `ck-badge--success`.

## Responsive behavior
Inherits `ck-dialog`'s existing `max-inline-size: calc(100vw - 2rem)`.
