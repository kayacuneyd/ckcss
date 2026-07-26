# Changelog

All notable changes to this project will be documented in this file.

This project follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and
semantic versioning where releases are applicable.

## [0.1.0-rc.1] - 2026-07-26

### Added

- Industry-standard expansion per `EMPOWERMENT.md` / ADR 0021:
  - **Utilities:** spacing, sizing, display, flex/grid, position/z-index,
    typography, border/radius, shadows, opacity, overflow, transitions,
    animation keyframes, print helpers (`ck-no-print`, `ck-print-only`),
    a11y helpers (`ck-sr-only`, contrast/reduced-motion preferences).
  - **Print stylesheet:** `src/print.css` (nav/toast hide, link URLs, page margins).
  - **Forms:** `ck-fieldset`, `ck-form-grid`/`row`/`group`, `ck-choice-grid`,
    `ck-search`, `ck-file`, `ck-range`, validation (`ck-is-valid`/`invalid`),
    `ck-form-error-summary`, floating label pattern.
  - **Components:** `ck-toast`, `ck-banner`, `ck-tooltip`, `ck-popover`,
    `ck-snackbar`, `ck-accordion`, `ck-empty-state`, `ck-stat`, `ck-list`,
    `ck-description-list`, `ck-tree`, `ck-icon` (+ `dist/ckcss-icon-sprite.svg`).
  - **Theme:** `data-theme` alias, `auto` mode; Enhance `theme.js` cycles
    light → dark → auto with `localStorage` and `prefers-color-scheme`.
  - **Tokens:** `--ck-space-0`, type sizes 3xl/4xl, semibold, snug line-height,
    max-size scale, radius none/circle, z-index scale tokens.
- Size budget raised to 64 KiB minified (ADR 0021).
- Example: `examples/utilities.html`.
- **Sprint A quality gate:**
  - `npm run test:a11y` — axe-core WCAG 2.2 AA on quality fixture + examples (Chromium/Firefox/WebKit)
  - `npm run test:visual` — pixelmatch baselines for light/dark/RTL × 390/768/1440
  - `tests/fixtures/quality-kit.html` shared harness
  - `npm run test:quality` runs contracts + a11y + visual
- **Icon set:** 189 SVG symbols in `src/icons/ckcss-icon-sprite.svg` (copied to `dist/`), `tests/icons-contract.sh` enforces ≥100.

### Changed

- Backward compatible: existing layout/component classes retain behavior.
- Fraction width utilities use hyphen form (`ck-w-1-2`), not slash.

## [0.1.0-beta.3] - 2026-07-24

### Added

- `constitution.md`: adopted the **KayaEOS Engineering & Design Constitution v2.0.0**, CKCSS's
  first locally-adopted constitution file, numbered to align with the sibling DevinimJS repo's
  same-day adoption. Makes existing ADRs (0001–0020) into enforceable clauses across five areas:
  the build-free/shared-hosting boundary (Core JS-free per ADR-0003, Enhance optional per
  ADR-0013), the 26624-byte `dist/ckcss.min.css` distribution budget (ADR-0006/0019), token
  discipline (`ck-`/`--ck-` prefix per ADR-0002, rem-based measurement per ADR-0008, single
  type scale per ADR-0014, `light-dark()` single-declaration tokens per ADR-0017), the fluid
  design/responsive contract (centralized breakpoints per ADR-0018, logical-properties-only per
  ADR-0015), and a new AI & Developer Contract section (composition-before-new-component per the
  ADR-0020 precedent, no invented tokens/breakpoints, i18n/RTL and Core/Enhance boundary checks
  before any change is presented as done). No prior rule changed; existing ADRs are the source
  of truth and this file cites them directly rather than restating divergent numbers.
- `tests/tokens-contract.sh`, `tests/foundation-contract.sh`: closed three enforcement gaps the
  new constitution surfaced between what the ADRs require and what the contract tests actually
  checked. The raw hex/`rgb()` literal ban (ADR-0011) covered only `components.css`; it now
  covers every `src/*.css` file except `tokens.css` itself. The `!important` ban covered only
  `components.css` and `layout.css`; it now also covers `reset.css`, `base.css` and
  `utilities.css`. New: a check that rejects a literal `40rem`/`48rem`/`64rem`/`640px`/`768px`/
  `1024px` inside an `@media`/`@container` condition anywhere in `src/`, since nothing previously
  guarded ADR-0018's `$ck-bp-sm`/`$ck-bp-md`/`$ck-bp-lg` placeholder convention from being
  bypassed. No source file changed — all three checks pass against current `src/` unmodified.

## [0.1.0-beta.2] - 2026-07-23

### Added

- `.ck-button--success`, `.ck-button--warning`, `.ck-button--info` color variants, and
  `.ck-button--sm`/`--lg`, `.ck-input--sm`/`--lg`, `.ck-select--sm`/`--lg` size variants,
  backed by new `--ck-control-height-sm|md|lg` tokens.
- `.ck-container--fluid` for an edge-to-edge container.
- `.ck-d-sm-block`/`--flex`/`--grid`/`--inline-flex` explicit responsive display
  utilities, safe to pair with `.ck-hide-mobile`/`.ck-only-*` on elements that also
  carry a flex/grid layout primitive class.
- `fieldset`/`legend`/`hr` are now normalized and token-styled in the reset and base
  layers.
- `--ck-font-weight-normal|medium|bold` tokens and an expanded `--ck-z-*` scale
  (`--ck-z-dropdown`, `--ck-z-toast`).

### Fixed

- Dark-theme tokens no longer duplicate every value across `[data-ck-theme="dark"]`
  and the `prefers-color-scheme` media block; both now resolve from one `light-dark()`
  declaration per token (ADR 0017), removing two literal hex colors that had drifted
  outside the documented palette scale.
- The switch component's focus-visible outline no longer uses a translucent glow
  token as a solid outline color (was low-contrast); it now uses the same opaque
  `--ck-color-focus` token as every other interactive element.
- `.ck-skip-link` now references `--ck-z-sticky` instead of a hardcoded `z-index: 10`.

### Changed

- Breakpoint values are now centralized in `scripts/breakpoints.sh` and expanded at
  build time instead of being repeated as raw literals in `layout.css`/`utilities.css`
  (ADR 0018); `dist/` output is unchanged.
- The core size budget is raised from 24 KB to 26 KB to accommodate the fixes and
  additions above (ADR 0019).

## [0.1.0-beta.1] - 2026-07-21

### Added

- `ck-choice`, `ck-switch`, `ck-nav`, and native `ck-dialog` presentation APIs.
- Versioned GitHub Release, self-host, jsDelivr, and modular CSS installation guide.
- Semantic light, dark, and custom-brand token override documentation.

### Changed

- Modular entry point headers now carry the exact release version and build output
  remains clean after contract verification.

### Added

- Initial project contract.
- Essential Components beta: buttons, cards, badges, alerts, form controls,
  and responsive tables.
- Static component guide and interactive component example.
- Deterministic `ckcss.min.css` release artefact and 24 KB beta size gate.
- Complete 50–950 İznik source scales for glaze, cobalt, turquoise, bole,
  leaf, ochre, and plum; semantic component tokens remain separate.
- MIT `LICENSE`, `CONTRIBUTING.md`, and `SECURITY.md`; the CI contract now
  requires the license file (ADR 0012).
- `tests/enhance-contract.sh` now runs as part of `npm run test:contracts`
  (ADR 0013).
- ADR 0015 i18n & RTL policy, `tests/i18n-contract.sh`, and RTL Arabic + CJK
  cases in the Playwright smoke matrix (inline-start ordering and zero
  horizontal overflow per engine).
- `--ck-breadcrumb-separator` token for localizable breadcrumb separators,
  documented on the public token catalog.
- `data-ck-label-show`/`data-ck-label-hide` hooks in `enhance/forms.js`.

### Changed

- **Breaking (beta):** the numbered font-size scale (`--ck-font-size-0` …
  `--ck-font-size-5`) is replaced by the single named scale
  `--ck-font-size-xs|sm|md|lg|xl|2xl|display`; `--ck-font-size-2xl` is new
  (ADR 0014). Migration map: `0→sm`, `1→md`, `2→lg`, `3→xl`, `4→2xl`,
  `5→display`.
- `--ck-palette-coral|mint|violet-*` alias steps now map to one coherent
  İznik source family per alias (bole, leaf, plum); alias names unchanged
  (ADR 0014).
- `docs/product/enhance.md` documents the shipped Enhance module contract and
  hooks; ADR 0013 amends ADR 0003 to record the optional shipped modules.
- `enhance/forms.js` no longer rewrites toggle text unless both
  `data-ck-label-*` hooks are present; labels belong to page markup instead of
  hardcoded Turkish strings (ADR 0015).
- `enhance/table.js` folds case with `document.documentElement.lang` so
  locale-sensitive matching (e.g. Turkish İ/i) follows the page language.
