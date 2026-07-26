# CKCSS public API surface

CKCSS has a semantic, build-free public API. Layout primitives and components
are the primary interface. Token-based utilities (ADR 0021) cover spacing,
sizing, display, flex/grid, position, typography, borders, effects, motion,
print, and a11y helpers without a compiler.

## Color token contract

The default source palette is inspired by İznik ceramic balance: glaze white,
cobalt, turquoise, bole red, leaf green, ochre, and plum. Source tokens use
the `--ck-iznik-*` prefix and are available for deliberate local brand details.
Each family (`glaze`, `cobalt`, `turquoise`, `bole`, `leaf`, `ochre`, and
`plum`) exposes a complete `50, 100, …, 900, 950` scale: light values are
suited to surfaces and subtle borders, mid values to accents, and dark values
to readable foregrounds and dark surfaces.
Framework components must use semantic `--ck-color-*` tokens only, so a project
can replace the source palette without rewriting component CSS.

## Type scale

One named font-size scale is public: `--ck-font-size-xs`, `-sm`, `-md`,
`-lg`, `-xl`, `-2xl`, and `-display`. The numbered scale was removed during
beta; the migration map is recorded in
[ADR 0014](../decisions/0014-type-scale-and-palette-alias-cleanup.md).

## Public class categories

### Layout

`ck-container`, `ck-container--narrow`, `ck-container--wide`, `ck-stack`,
`ck-stack--compact`, `ck-stack--relaxed`, `ck-cluster`,
`ck-cluster--spread`, `ck-grid`, `ck-grid--2`, `ck-grid--3`,
`ck-grid--auto-fit`, `ck-sidebar`, and `ck-sidebar--end`.

### Components

`ck-button`, `ck-button--secondary`, `ck-button--quiet`, `ck-button--danger`,
`ck-card`, `ck-card__header`, `ck-card__body`, `ck-card__footer`, `ck-badge`,
`ck-alert`, `ck-field`, `ck-field__label`, `ck-field__help`,
`ck-field__error`, `ck-input`, `ck-select`, `ck-textarea`, `ck-table-wrap`,
and `ck-table`.

### Helpers (legacy aliases kept)

`ck-visually-hidden` (alias `ck-sr-only`), `ck-skip-link`, `ck-focus-ring`,
`ck-text-small`, `ck-text-lead`, `ck-text-muted`, `ck-text-center`,
`ck-width-full`, `ck-max-readable`, `ck-overflow-auto`, `ck-truncate`,
`ck-hide-mobile`, `ck-only-mobile`, `ck-hide-desktop`, and `ck-only-wide`.

### Utilities (ADR 0021)

Spacing: `ck-m-{0..8}`, `ck-mt|mb|ms|me|mx|my-{0..8}`, `ck-p-{0..8}`,
`ck-pt|pb|ps|pe|px|py-{0..8}`, `ck-gap-{0..8}`, `ck-mx-auto`.

Sizing: `ck-w-full`, `ck-w-auto`, `ck-w-1-2` … `ck-w-3-4`, `ck-h-full`,
`ck-h-screen`, `ck-min-h-screen`, `ck-max-w-sm|md|lg|xl|2xl|full|prose`.

Display / flex / grid: `ck-d-{block|flex|grid|none|…}`, `ck-flex`,
`ck-flex-col|row|wrap`, `ck-justify-*`, `ck-items-*`, `ck-self-*`,
`ck-order-*`, `ck-grid-cols-{1..12}`, `ck-col-span-*`, responsive
`ck-d-{sm|md|lg}-*`.

Position / z: `ck-relative|absolute|fixed|sticky`, `ck-inset-0`, `ck-z-{0|10|20|30|40|50}`.

Typography / effects: `ck-text-{xs…4xl}`, `ck-fw-*`, `ck-lh-*`, `ck-border*`,
`ck-rounded*`, `ck-shadow*`, `ck-opacity-*`, `ck-overflow-*`, `ck-transition*`,
`ck-animate-*`, `ck-no-print`, `ck-print-only`.

### New components (EMPOWERMENT P0/P1)

Forms: `ck-fieldset`, `ck-legend`, `ck-form-grid`, `ck-form-row`,
`ck-form-group`, `ck-choice-grid`, `ck-search`, `ck-file`, `ck-range`,
`ck-is-valid`, `ck-is-invalid`, `ck-form-error-summary`, `ck-floating-label`.

Feedback / data: `ck-toast`, `ck-banner`, `ck-tooltip`, `ck-popover`,
`ck-snackbar`, `ck-accordion`, `ck-empty-state`, `ck-stat`, `ck-list`,
`ck-description-list`, `ck-tree`, `ck-icon`.

### Progressive layout enhancement

`ck-query-container` and `ck-query-grid` opt into container-query enhancement;
the base layout remains usable without container-query support.

### Theme contract

`data-ck-theme="light|dark|auto"` (alias `data-theme`). Optional Enhance:
`enhance/theme.js` with `[data-ck-theme-toggle]`.

## Governance rules

- All public classes use the `ck-` prefix.
- All documented customization properties use the `--ck-` prefix.
- A new public class needs a semantic purpose, catalog example, documentation,
  and contract coverage.
- Arbitrary values, arbitrary selectors, class scanning, plugins, `@apply`, and
  JavaScript runtime state are not part of CKCSS Core.
- Layout primitives and semantic components are preferred over utility chains.
- Token removals are breaking changes: allowed only pre-1.0, and afterwards
  only through a documented deprecation cycle (ADR 0014).
