---
title: Status timeline
paths:
  - site/patterns/ecommerce/status-timeline.html
order: 30
family: status-timeline
wave: 7
---

One `ck-timeline` structure reused across two contexts: shipment tracking and
refund status. Folds Flowbite's `order-tracking`, `refund-status`, and
`refunds` categories into one family — all three are the same underlying
"steps toward an outcome" UI with different step labels.

## States

Each timeline item can be: completed (past step), `aria-current="step"`
(active step), or muted/pending (future step, styled with `ck-text-muted`) —
the same three-state model `user-onboarding.html`'s `ck-stepper` already uses,
applied here to a vertical timeline instead of a horizontal stepper.

## Semantic HTML & accessibility

- `<ol class="ck-timeline">` — an ordered list, since timeline steps have a
  meaningful sequence.
- `aria-current="step"` on the active item, consistent with how
  `user-onboarding.html` marks its active step.

## Tokens

`ck-timeline`, `ck-badge--success`, `aria-current`.

## Responsive behavior

`ck-timeline`'s `display: grid` and inline-start border already work at any
width with no pattern-specific breakpoint.
