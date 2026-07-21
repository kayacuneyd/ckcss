# CKCSS New Project Spec

## Goal

Build a static, modern CSS framework and HTML/CSS UI kit that gives shared-hosting
and server-rendered projects a simple alternative to build-dependent CSS ecosystems.

## Users And Jobs

- Static/PHP developers need a production-ready visual foundation from one CSS file.
- Agencies need repeatable, themeable UI patterns without per-project CSS drift.
- HTML-first developers need accessible components without adopting a JavaScript framework.

## MVP Scope

- Core tokens, reset/base, layout primitives, responsive utilities, and essential components.
- Static component documentation and example pages.
- Committed distributable CSS files and a documented browser/accessibility test process.

## Pages And Flows

- Documentation index: installation, tokens, layout, components, accessibility, migration.
- Component pages: render, copyable HTML, variants, states, accessibility notes, tokens.
- Example pages: landing page, auth form, dashboard shell, table-heavy admin screen.

## Data And Integrations

No runtime data store, API, authentication, payments, uploads, email, or third-party
integration. Optional documentation hosting is a static deployment concern.

## Content And Assets

Documentation, HTML examples, CSS source, visual fixtures, and generated release
artifacts are versioned in this repository. Icons must be inline SVG or external
assets chosen with an explicit license record.

## Non-Functional Requirements

- Consumers require only a static CSS link.
- JavaScript-free core and shared-hosting compatibility.
- Prefix all public classes with `ck-`.
- Accessible defaults, keyboard-visible focus, reduced-motion support, and documented
  browser support.
- Stable semantic versioning, changelog, and migration guidance.

## Stack Direction

Standard CSS and semantic HTML. Development validation tools may be added only after
an ADR confirms they remain optional for framework consumers.

## Launch Criteria

- Core CSS and minified CSS are published with integrity/version metadata.
- Docs include installation, token customization, 10+ essential components, and examples.
- Browser/accessibility checks pass for the declared support matrix.
- At least one real shared-hosting deployment proves the no-build claim.

## Assumptions

- Modern evergreen browsers are the initial primary target.
- CKCSS is an independent implementation, informed by W3.CSS but not a fork.

## Open Questions

- Exact browser support matrix.
- CSS size budget for Core and optional UI Kit.
- Documentation domain and release/CDN distribution.
