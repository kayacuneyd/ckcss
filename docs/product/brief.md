# CKCSS Product Brief

## Problem

Small teams, static-site developers, PHP/WordPress users, and shared-hosting
customers often need a coherent modern UI but do not want a Node.js build pipeline
or a JavaScript component runtime. W3.CSS proves the value of a single-file,
class-based framework, but its legacy layout and token model do not provide a
modern, accessible design-system foundation.

## Target users

- Developers maintaining static HTML, PHP, WordPress, Laravel, or server-rendered sites.
- Small agencies that need reusable, low-maintenance UI foundations for client sites.
- Developers who prefer semantic HTML and progressive enhancement over framework lock-in.

## Proposed solution

CKCSS Core is a versioned static CSS file with design tokens, layout primitives,
accessibility-first components, and responsive utilities. CKCSS UI Kit is a library
of documented HTML/CSS page and component recipes built only with CKCSS Core.

## MVP scope

- CSS reset/base, tokens, typography, container, grid, stack, cluster, and spacing.
- Buttons, cards, badges, alerts, inputs, selects, textareas, form states, and tables.
- Light/dark token themes, reduced-motion support, responsive examples, and static docs.
- Browser/accessibility checks and versioned `dist/ckcss.css` + `dist/ckcss.min.css`.

## Explicit non-goals

- Tailwind-compatible utility generation or a build-time class scanner.
- A JavaScript component runtime, React/Vue wrappers, or proprietary web components.
- JS-only widgets such as date pickers, auto-rotating carousels, or managed toast queues.
- Copying W3.CSS source, branding, or class names as a fork.

## Validation and success metrics

- A developer can build an accessible landing page from the docs in 30 minutes with only
  a linked CSS file and static HTML.
- A shared-hosting demo works with no server-side build or client-side JavaScript.
- At least three real internal/client pages can use the same tokens and components without
  local CSS overrides for basic layout, forms, and buttons.
- Core CSS stays within the size budget decided by the Foundation feature specification.

## Stop or pivot conditions

- Core usage requires a build step or runtime JavaScript to be practical.
- Component naming or token customization is repeatedly confusing in user testing.
- The core bundle grows beyond its agreed budget without clear user value.

## Initial risks and open questions

- Browser baseline and whether container queries are core or progressive enhancement.
- Whether themes are hand-authored only or include optional generated palettes.
- Whether UI Kit examples ship in this repository or a separate documentation repository.
