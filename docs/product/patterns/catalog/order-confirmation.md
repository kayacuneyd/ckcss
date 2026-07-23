---
title: Order confirmation
paths:
  - site/patterns/ecommerce/order-confirmation.html
order: 32
family: order-confirmation
wave: 7
---

Post-checkout success page: confirmation message, order number, order summary,
and next-step links (track order, keep shopping).

## States

Single success state — this page only exists to represent "order placed,"
which is why the confirmation alert is the page's primary content, not one of
several states like `reset-password.html`'s two-state reference.

## Semantic HTML & accessibility

- Confirmation message uses `role="status"`/`aria-live="polite"` so it's
  announced immediately when the page loads, same pattern as
  `reset-password.html`'s "sent" state and `crud-modal.html`'s success card.

## Tokens

`ck-alert--success`, `ck-card`, `ck-text-center`.

## Responsive behavior

Centered single-column content works at every width with no breakpoint needed.
