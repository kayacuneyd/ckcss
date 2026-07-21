# Changelog

All notable changes to this project will be documented in this file.

This project follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and
semantic versioning where releases are applicable.

## [Unreleased]

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
