# W3.CSS Audit for CKCSS

## Scope and evidence

This audit reviews `vitorlans/w3-css` master as retrieved on 2026-07-20. The source
contains one 23,061-byte `w3.css` file; its latest repository commit is 2018-04-18.
The CSS header identifies W3.CSS 4.10 from February 2018. CKCSS may learn from its
public API and distribution model but must not copy code before license, attribution,
and compatibility review.

## What to preserve

| W3.CSS strength | Why it matters | CKCSS decision |
| --- | --- | --- |
| One linked CSS file | Works on static/shared hosting | Preserve as the primary install path |
| No JS runtime | Low operational complexity | Preserve for Core and UI Kit recipes |
| Readable class-based HTML | Fast onboarding | Preserve with a consistent `ck-` prefix |
| Practical primitives | Enables quick pages | Preserve conceptually; redesign API and states |
| Responsive defaults | Useful for non-framework users | Preserve with modern CSS primitives |

## Gaps to resolve

| Area | W3.CSS observation | CKCSS direction |
| --- | --- | --- |
| Tokens/themes | Fixed literals dominate colors, spacing, radius, and shadow | CSS custom-property token system; light/dark and brand overrides |
| Layout | Float-based columns and fixed breakpoint classes | Grid, flex, `minmax`, logical sizing, optional container queries |
| CSS architecture | One monolithic file with no cascade layers | Source modules ordered with `@layer`; committed standalone output |
| API isolation | Global selectors and generic IDs/classes can collide | `ck-` public prefix and scoped base rules |
| Specificity | Many utilities rely on `!important` | Low-specificity API; exceptions require ADR and tests |
| Accessibility | Minimal visible focus/state contract in component API | Focus-visible, contrast tokens, reduced motion, semantic examples, keyboard notes |
| Components | Visual primitives exist, but state/variant contracts are sparse | Document variants, states, tokens, markup, and browser behavior per component |
| Interaction | CSS-only modal/dropdown patterns leave behavior to consumers | Native HTML first; optional app-owned enhancement outside Core |
| Documentation | Repository README is minimal and lacks component contracts | Static docs with copyable HTML, states, a11y, customization, and migration guidance |
| Delivery | NPM package metadata exists but no published GitHub releases | Versioned releases, changelog, static downloadable artifacts, integrity metadata |
| Quality gates | No visible tests or CI source structure | CSS, browser, visual, and accessibility verification before releases |

## CKCSS compatibility position

CKCSS will not promise W3.CSS class compatibility in v1. A compatibility layer would
import the legacy API, constrain the design, and blur migration responsibility.
Instead, CKCSS will publish a migration table for the most common W3.CSS patterns.

## Research follow-ups

1. Audit W3.CSS license and attribution requirements before copying any snippet.
2. Test real W3.CSS pages to identify the highest-value migration patterns.
3. Compare Bootstrap, Pico.css, and modern CSS capabilities only after CKCSS MVP API is defined.
