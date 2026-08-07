# Migration: EMPOWERMENT / industry-standard utilities

## Summary

CKCSS gains a large token-based utility layer and expanded components while
keeping existing classes stable. No build step is required for consumers.

## What stays the same

- Link one stylesheet: `dist/ckcss.min.css` (or a modular entry under `dist/modules/`).
- All prior `ck-*` layout and component classes keep their behavior.
- Theme attribute `data-ck-theme` continues to work; `data-theme` is an alias.
- Core remains JavaScript-free. Theme toggle is optional Enhance.

## What is new

| Area | Classes / files |
| --- | --- |
| Spacing / sizing / flex | `ck-m-*`, `ck-p-*`, `ck-gap-*`, `ck-w-*`, `ck-flex-*`, … |
| Print | `ck-no-print`, `ck-print-only`, automatic `@media print` |
| Forms | `ck-fieldset`, `ck-search`, `ck-file`, `ck-range`, `ck-is-valid`, … |
| Feedback | `ck-toast`, `ck-banner`, `ck-empty-state`, `ck-stat`, … |
| Icons | `.ck-icon` + `dist/ckcss-icon-sprite.svg` |
| Theme JS | `enhance/theme.js` cycles light → dark → auto |

## Naming notes

- Fraction widths: `ck-w-1-2` (not `ck-w-1/2`).
- Screen-reader: `ck-sr-only` aliases `ck-visually-hidden`.
- Prefer logical inset helpers: `ck-start-0` / `ck-end-0` (no physical left/right utilities).

## Bundle size

Minified core budget is **65536 bytes** (ADR 0021). Check with:

```sh
./scripts/build-foundation.sh
wc -c dist/ckcss.min.css
```

## Quality gate (Sprint A)

```sh
npm install
npm run test:quality   # contracts + axe WCAG 2.2 AA + visual baselines
npm run test:a11y      # axe only
npm run test:visual    # light/dark/RTL × 390/768/1440
# After intentional UI changes:
npm run test:visual:update
```

## Icons

```html
<svg class="ck-icon" aria-hidden="true" focusable="false">
  <use href="/path/to/ckcss-icon-sprite.svg#ck-icon-search"></use>
</svg>
```

Catalog: `examples/icons.html` · source: `src/icons/manifest.json` (≥100 symbols).

## Replace project-local utilities

If a host app defined `kt-mb-2`, `kt-flex`, etc., map them to CKCSS:

| Local | CKCSS |
| --- | --- |
| `kt-mb-2` | `ck-mb-2` |
| `kt-mt-3` | `ck-mt-3` |
| `kt-flex` | `ck-flex` |
| `kt-gap-2` | `ck-gap-2` |
| `kt-flex-wrap` | `ck-flex-wrap` |
