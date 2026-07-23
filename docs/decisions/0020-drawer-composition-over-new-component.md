# ADR 0020: Compose off-canvas drawers from `[popover]`/`<dialog>` instead of a new component

## Context

Wave 6b of the UI Kit Patterns rollout (`docs/product/features/005-ui-kit-patterns.md`)
needed an off-canvas drawer pattern for the CRUD-drawer family, faceted-search
drawers, and an off-canvas shopping-cart variant. Neither `[popover]` nor
`<dialog>` is edge-anchored by default — both center as a small floating panel
(`[popover]`'s current sizing) or a centered modal (`<dialog>`'s UA default).
The open question, per the gap-analysis, was whether this needs a new
JS-behavioral `ck-drawer` component (with its own open/close state management
and focus-trap implementation) or can be solved as a CSS-only positioning
composition on top of the two native elements CKCSS already uses.

## Decision

Add one small CSS class, `.ck-drawer`, to `ck-components`:

```css
.ck-drawer { inset-block: 0; inset-inline: auto 0; margin: 0; max-inline-size: min(24rem, 100vw); min-block-size: 100%; border-radius: 0; overflow-y: auto; }
```

It only sets positioning/sizing (logical `inset-inline: auto 0` anchors to the
end edge in both LTR and RTL, per ADR 0015) and takes no position on which
native element it decorates:

- `<div popover class="ck-drawer">` — a light-dismiss drawer (Escape/outside
  click closes it, top-layer stacking) for supplementary panels — filters,
  quick views — that don't need to block interaction with the rest of the page.
- `<dialog class="ck-dialog ck-drawer">` — a fully modal, focus-trapped drawer
  (native `showModal()`/`method="dialog"` semantics, same as `crud-modal.html`)
  for flows that must block the rest of the page until resolved.

This resolves the one real gap between the two native elements — `[popover]`
does not enforce a strict focus trap the way `<dialog>` + `showModal()` does —
by letting the consumer pick the right element for their use case instead of
CKCSS guessing for them, with zero new JavaScript either way.

**Budget check (the falsifiable gate this ADR was required to pass):** adding
`.ck-drawer` moved `dist/ckcss.min.css` from 25677 to 25816 bytes (+139 bytes),
still 808 bytes under the 26624-byte budget set in
[ADR 0019](0019-size-budget-increase-for-parity-fixes.md). Composition fits
comfortably; a new component was not justified.

## Consequences

- No new public component, no JS, no second budget ADR needed.
- `enhance/dialog.js`'s existing `data-ck-dialog-open` hook works unchanged for
  the `<dialog class="ck-dialog ck-drawer">` variant; the `[popover]` variant
  uses the browser's native `popovertarget` attribute (no Enhance module
  required, though one could be added later purely for `data-ck-*`-hook
  consistency with the rest of Enhance — not required for this wave).
- Documented trade-off: `[popover]`-based drawers are not strictly modal;
  pattern authors must choose `<dialog>` instead when that matters, not assume
  `.ck-drawer` alone guarantees it.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-23.
