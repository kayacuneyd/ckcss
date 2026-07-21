# Feature: Limited utility and state helpers

## Problem and user outcome

CKCSS component and layout primitives cover common page composition, but small
accessibility, typography, overflow, and state needs currently require local
CSS. Developers need a small token-based helper API without adopting a build
pipeline or a Tailwind-style utility matrix.

## Scope

- Accessibility helpers: visually hidden, skip link, and focus ring.
- Token-based typography and sizing helpers.
- Overflow, truncation, readable measure, and full-width helpers.
- Explicit mobile/wide visibility helpers.
- Native `aria-*` and `data-ck-state` component state contracts.
- Progressive container-query grid enhancement with viewport-safe fallback.

## Non-goals

- Arbitrary values or arbitrary selectors.
- A utility for every CSS property.
- Class scanning, bundling, plugins, `@apply`, or JavaScript runtime state.
- Replacing semantic components and layout primitives with utility combinations.

## Acceptance criteria

- Given one linked CSS file, helper classes work without JavaScript or a build step.
- Every public helper uses the `ck-` prefix and documented `--ck-` tokens.
- `.ck-visually-hidden` preserves assistive-technology access and `.ck-skip-link`
  becomes visible on keyboard focus.
- Component state is expressible with native `aria-*` or documented
  `data-ck-state` attributes.
- Container-query enhancement has a one-column fallback when unsupported.
- Helper usage appears in the public component catalog with copyable HTML.
- The minified core remains within the 24 KB beta budget.
