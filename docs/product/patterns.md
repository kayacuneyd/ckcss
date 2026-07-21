# CKCSS UI Kit patterns

Patterns are complete HTML page sections composed from CKCSS tokens, layout
primitives, semantic components, and limited helpers. They are copyable recipes,
not a runtime or a second component API.

## Pattern rules

- Use one linked static CKCSS file.
- Use semantic HTML and native states.
- Do not require JavaScript, npm, a bundler, or local CSS to render the basic pattern.
- Keep source order as the accessible reading order.
- Document responsive behavior, accessibility, and customization tokens.
- Prefer existing CKCSS classes over pattern-specific core classes.

## Available patterns

- `patterns.html`: dashboard/overview page with metrics, project list, status
  alert, and quick-start card.
- `pricing.html`: three-tier pricing page with selected plan and contact CTA.
- `contact.html`: accessible project brief form with labels and help text.
- `app-shell.html`: SaaS sidebar, toolbar, dashboard metrics, and empty activity state.
- `data-management.html`: searchable project table with filters, pagination, and empty/loading/error states.
- `auth.html`: accessible sign-in form with native controls and recovery links.
- `product-patterns.html`: settings, documentation, editorial, search, checkout, and task board sections.
- `marketing-patterns.html`: FAQ, testimonial, comparison, final CTA, and changelog sections.
- `states.html`: empty, loading, error, and selected state reference.
- `variants.html`: menu, sidebar, hero, CTA, form, newsletter, and footer variants.

The pattern catalog will grow after each pattern has a real semantic contract,
copyable source, and static contract coverage.
