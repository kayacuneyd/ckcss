# ADR 0011: İznik-inspired palette and Aleo typography

**Status:** Alias names are unchanged; alias scale values were corrected by
[ADR 0014](0014-type-scale-and-palette-alias-cleanup.md).

## Decision

CKCSS exposes an optional İznik-inspired primitive palette alongside semantic
color tokens. The raw `--ck-iznik-*` tokens name material colors (glaze, ink,
cobalt, turquoise, bole, leaf, ochre, and plum); components consume semantic
tokens such as `--ck-color-primary` and `--ck-color-danger` only. Product teams
may use primitive tokens for local brand details without coupling the core
component API to a particular hue.

The default display and sans font stack starts with `Aleo`, followed by safe
fallbacks. CKCSS does not bundle a font binary in the core CSS distribution.
The CKCSS site self-hosts the regular and bold Aleo files under
`site/assets/fonts/`; the core CSS distribution still does not bundle font
binaries.

## Rationale

The palette draws from the cobalt, turquoise, green, and bole-red relationships
of İznik tilework without reducing the framework to flag colours or decorative
motifs. Semantic mappings keep that cultural starting point replaceable, allow
dark-theme remapping, and make contrast validation practical. Aleo is
distributed under the SIL Open Font License;
the project keeps the font source optional so consumers retain control over
hosting, performance, and licensing presentation.

## Consequences

- `--ck-font-display` and `--ck-font-sans` use Aleo first.
- Named `--ck-iznik-*` source tokens are documented but are not used directly
  by core components.
- Existing `--ck-palette-blue|coral|mint|violet-*` aliases remain for local,
  opt-in brand details.
- Components must continue using semantic tokens; direct colour literals are
  rejected by the token contract.
- Semantic foreground/background pairs are contrast-tested at WCAG AA (4.5:1).
- The site’s self-hosted `@font-face` files can be replaced by a consumer’s own
  font files without changing the CKCSS token API.
