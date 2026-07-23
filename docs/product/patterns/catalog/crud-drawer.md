---
title: CRUD drawer
paths:
  - site/patterns/application/crud-drawer.html
order: 28
family: crud-drawer
wave: 6b
---

An edge-anchored off-canvas panel, resolved as a composition (new `.ck-drawer`
positioning class) rather than a new JS-behavioral component — see
[ADR 0020](../../decisions/0020-drawer-composition-over-new-component.md) for
the full decision and the `dist/ckcss.min.css` budget measurement (+139 bytes,
still under the ADR 0019 budget). Folds Flowbite's `crud-create-drawers`,
`crud-update-drawers`, `crud-read-drawers`, and `faceted-search-drawers` into
one family, and also serves as the off-canvas variant for `shopping-cart.html`
(no separate cart-drawer page needed — same class, different content).

## States

- Modal drawer (`<dialog class="ck-dialog ck-drawer" open>`): shown open for
  reference, same convention as `crud-modal.html`.
- Light-dismiss drawer (`<div popover class="ck-drawer">`): shown as a code
  snippet, not a live-rendered element — there's no declarative HTML way to
  render a popover pre-opened the way `<dialog open>` works, so a real static
  "open by default" render isn't possible without JavaScript.

## Semantic HTML & accessibility

- `.ck-drawer` only sets position/size — it never decides modality; the author
  picks `<dialog>` (full focus trap) or `[popover]` (light dismiss, no trap) per
  ADR 0020, and must choose deliberately for their actual use case rather than
  assuming one option is always safe.
- Logical `inset-inline: auto 0` anchors to the *end* edge, correctly flipping
  in RTL contexts per ADR 0015, rather than hardcoding a physical `right: 0`.

## Tokens

`ck-drawer` (new — positioning only), composed with existing `ck-dialog` or
`[popover]` for chrome/backdrop/focus behavior.

## Responsive behavior

`max-inline-size: min(24rem, 100vw)` makes the panel near-full-width on small
screens and a fixed 24rem panel on larger ones, with no separate breakpoint.
