# ADR 0012: Native and enhanced navigation recipes

## Decision

CKCSS ships two navigation recipes: a native `<details>` recipe in Core/UI Kit
and an optional `navigation.js` enhancement. The enhanced module is independent,
does not import a runtime, and changes only documented ARIA/data attributes and
focus behavior.

## Rationale

CSS-only checkbox hamburger patterns can provide visual toggling but do not
provide reliable focus return, Escape handling, or application state
coordination. Native HTML gives a robust baseline; the optional module adds
behavior only where an application needs a drawer.

## Consequences

- Small static sites need no JavaScript navigation.
- App projects can opt into drawer behavior without adopting a framework.
- Both recipes are documented and contract-tested separately.
