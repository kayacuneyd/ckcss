---
title: CRUD modal
paths:
  - site/patterns/application/crud-modal.html
order: 25
family: crud-modal
wave: 6a
---

A native `<dialog>` edit modal, with delete-confirmation and success-message
shown as labeled reference cards rather than a second/third real dialog (only
one native `<dialog>` can meaningfully be "open" at a time). Folds Flowbite's
`crud-create-modals`/`crud-update-modals`/`crud-read-modals` (the base modal),
`crud-delete-confirm`, and `crud-success-message` into one family — the latter
two are **states** of this family per its own state matrix, not standalone
patterns.

## States

- `open` (default reference render) — the edit modal, matching
  `examples/components.html`'s established "shown open for documentation"
  convention.
- `confirm` — delete-confirmation, shown as a `ck-card` reference block.
- `success` — post-save confirmation, shown as a `ck-alert--success` reference
  block.

## Semantic HTML & accessibility

- `<dialog class="ck-dialog" aria-labelledby="...">` with a real `<form
  method="dialog">` — closing needs no JavaScript once the dialog is open;
  *opening* it does require JS since there's no HTML-only way to call
  `showModal()`, which is why the reference render shows it already `open`
  rather than closed-by-default (same resolution `examples/components.html`
  already uses).
- The trigger button carries `data-ck-dialog-open="crud-edit-dialog"` for the
  optional `enhance/dialog.js` module — the page works with or without it.

## Tokens

`ck-dialog`, `ck-alert--success`, `ck-card`, `data-ck-state` (documentation only).

## Responsive behavior

`.ck-dialog`'s `max-inline-size: calc(100vw - 2rem)` already handles narrow
viewports with no pattern-specific breakpoint.
