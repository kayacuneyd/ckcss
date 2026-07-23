---
title: Event schedule
paths:
  - site/patterns/marketing/event-schedule.html
order: 43
family: event-schedule
wave: 8
---

A conference/event agenda, reusing `status-timeline.html`'s (wave 7)
`ck-timeline` structure for a schedule instead of a process/status sequence —
the same component genuinely fits both use cases.

## States
`aria-current="step"` marks the current/next session; past/future sessions are
otherwise styled the same (unlike a status timeline, an agenda doesn't need a
strong "completed" visual distinction).

## Semantic HTML & accessibility
`<ol class="ck-timeline">` — ordered, since sessions have a fixed sequence.

## Tokens
`ck-timeline`.

## Responsive behavior
No pattern-specific breakpoint needed.
