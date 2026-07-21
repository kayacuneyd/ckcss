# CKCSS Enhance

CKCSS Enhance is the optional behavior companion to CKCSS Core. It ships as
independent ES modules under `enhance/`; it is never required, is not loaded
by `ckcss.min.css`, and no module imports another module or creates global
application state. [ADR 0013](../decisions/0013-enhance-optional-modules.md)
records the boundary.

## Module contract

Each module must:

- attach only to documented `data-ck-*` hooks it discovers in the DOM;
- never write user-facing strings — labels live in the page's markup
  (`data-ck-label-*` hooks where a swap is needed, ADR 0015);
- leave the page fully usable before it loads and when JavaScript is disabled;
- own no state outside the elements it enhances;
- pass `tests/enhance-contract.sh` and appear in the live catalog demo
  (`site/enhance.html`).

## Current modules

| Module | Hook(s) | Behavior |
| --- | --- | --- |
| `enhance/navigation.js` | `data-ck-menu-toggle="menu-id"` | Mobile menu toggling with `aria-expanded`, Escape close, and focus return. |
| `enhance/theme.js` | `data-ck-theme-toggle` | Light/dark toggle with `localStorage` persistence and `aria-pressed`. |
| `enhance/dialog.js` | `data-ck-dialog-open="dialog-id"` | Native `dialog.showModal()` with focus return on close. |
| `enhance/tabs.js` | `data-ck-tabs="group"`, `data-ck-tab`, `data-ck-tab-panel="group"` | Keyboard-accessible tabs (arrows, Home, End) with `aria-selected`. |
| `enhance/forms.js` | `data-ck-password-toggle="input-id"`, `data-ck-label-show`, `data-ck-label-hide`, `form[data-ck-enhance-form]` | Password visibility toggle (`aria-pressed`) and submit busy state (`aria-busy` after `checkValidity()`). Toggle text is swapped only when both label hooks are present. |
| `enhance/table.js` | `data-ck-table-filter="table-id"`, `data-ck-table-row`, `data-ck-table-empty` | Local, row-based table filtering with an empty-state slot; case folding follows `document.documentElement.lang`. |
| `enhance/toast.js` | `data-ck-toast-trigger="toast-id"`, `data-ck-toast-duration` | One timed `role="status"` toast per trigger; no queue. |

## Out of scope

Managed widget systems stay out of CKCSS: date pickers, auto-rotating
carousels, and managed toast *queues* remain product non-goals (see
`docs/product/brief.md`). Enhance ships small single-purpose behaviors only.

## Usage

```html
<link rel="stylesheet" href="/assets/ckcss.min.css">
<script type="module" src="/assets/enhance/navigation.js"></script>
```

Load only the modules a page uses. The HTML must remain usable before the
module loads and when JavaScript is disabled; Enhance only changes behavior
after discovering its documented hooks. New modules require the contract
test, a catalog demo, and a documentation entry before release.
