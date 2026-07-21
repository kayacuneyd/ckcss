# Feature: Foundation — layers, tokens, reset, and base

## Problem and user outcome

Developers need a safe, themeable starting point that does not force a project into
hard-coded colors, inconsistent spacing, or inaccessible focus behavior.

## Scope

- Cascade layer order, `--ck-` token contract, light/dark theme overrides.
- Minimal reset, typography base, visible focus, and reduced-motion behavior.
- Documented CSS size budget and no-global-selector policy.

## Non-goals

- Components, utility catalog, auto-generated palettes, or legacy browser polyfills.

## Acceptance criteria

- Given a linked CKCSS file, a page receives consistent box sizing and base typography.
- A user can override documented tokens without editing framework source.
- Keyboard focus is visible on links and form controls.
- Reduced-motion preferences suppress nonessential animation.
- No public class lacks the `ck-` prefix.
