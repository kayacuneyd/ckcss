# Feature: Layout primitives

## Problem and user outcome

Developers need responsive page composition without float grids or bespoke per-page CSS.

## Scope

- Container, stack, cluster, grid, split/sidebar, and responsive gap behavior.
- Grid/flex-first implementation with documented breakpoints and fallbacks.

## Non-goals

- A Tailwind-style utility generator, masonry layout, or JavaScript resize observers.

## Acceptance criteria

- A developer can build one-, two-, and three-column layouts from semantic HTML.
- Layout remains readable at narrow viewports without horizontal scrolling.
- Component spacing comes from documented `--ck-` tokens.
