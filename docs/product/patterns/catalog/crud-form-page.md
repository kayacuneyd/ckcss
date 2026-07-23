---
title: CRUD form page
paths:
  - site/patterns/application/crud-form-page.html
order: 26
family: crud-form-page
wave: 6a
---

A full-page create/edit form for records with more fields than comfortably fit
in a modal — complements `crud-modal.html`'s short edit flow. Folds Flowbite's
`crud-create-forms`/`crud-update-forms` into one family (create and edit share
the same field set; only the submit label and pre-filled values differ).

## States

Static form pattern — native browser validation (`required`) only; no custom
validation UI in the basic pattern (see `docs/product/components.md` for the
`aria-invalid` pattern when a page needs custom error copy).

## Semantic HTML & accessibility

- Two `<fieldset>`/`<legend>` groups ("Proje bilgileri", "Erişim") — matches the
  grouping convention already used in wave 4's `checkout.html`.
- The "public" checkbox has a `.ck-choice__help` line explaining its effect
  before the user toggles it, not only as an after-the-fact confirmation.

## Tokens

`ck-field`, `ck-textarea`, `ck-select`, `ck-choice`, `ck-grid--2`.

## Responsive behavior

`ck-grid--2` (owner/status row) collapses to one column below 40rem.
