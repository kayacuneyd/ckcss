---
title: User onboarding
paths:
  - site/patterns/auth/user-onboarding.html
order: 18
family: auth
wave: 3
---

Post-signup setup flow: a step indicator plus a checklist card showing which
setup tasks are done and which remain. Unlike the rest of the auth family, this
page represents the *post*-authentication moment, not a pre-auth screen.

## States

- Step progress: `aria-current="step"` marks the active step in the `ck-stepper`.
- Checklist items: done (`ck-badge--success`) vs. pending (a real action button).
- Overall progress: a `role="progressbar"` div with `aria-valuenow`/min/max.

## Semantic HTML & accessibility

- `ck-stepper` is a real `<ol>` — steps are ordered, and screen readers get
  "item N of 3" for free from list semantics.
- The progress indicator uses `.ck-progress` as a `<div role="progressbar">`,
  not a native `<progress>` element — `.ck-progress`'s CSS targets a plain
  `<span>` child for the fill bar, which native `<progress>` doesn't support the
  same way, so the ARIA-role div is the correct markup for this CSS component
  (a native `<progress value>` element does not accept freely styled children).

## Tokens

`ck-stepper`, `ck-card`, `ck-badge--success`, `ck-progress`, `ck-cluster--spread`.

## Responsive behavior

`ck-stepper`'s `display: grid` and `ck-cluster`'s wrap already handle narrow
viewports with no page-specific breakpoint needed.
