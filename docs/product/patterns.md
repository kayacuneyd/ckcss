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
- `404.html`, `500.html`, `maintenance.html`: minimal not-found, server-error, and
  maintenance pages (see `docs/product/patterns/catalog/error-page.md`).
- `patterns/marketing/hero.html`: centered and split-with-media hero variants
  (see `docs/product/patterns/catalog/hero.md`).
- `patterns/marketing/header.html`: site header with JS-free `<details>` mobile
  nav fallback (see `docs/product/patterns/catalog/header.md`).
- `patterns/marketing/footer.html`: multi-column footer and minimal
  newsletter-footer variant (see `docs/product/patterns/catalog/footer.md`).
- `patterns/marketing/cta.html`: centered CTA banner and split CTA with an
  email-capture form (see `docs/product/patterns/catalog/cta.md`).
- `patterns/marketing/feature.html`: three-column feature grid and alternating
  text/media feature rows (see `docs/product/patterns/catalog/feature.md`).
- `patterns/marketing/content.html`: long-form article layout with a
  table-of-contents/tip sidebar (see `docs/product/patterns/catalog/content.md`).
- `patterns/marketing/trust-signal.html`: customer-logo strip, testimonial grid,
  and stat badges (see `docs/product/patterns/catalog/trust-signal.md`).
- `patterns/auth/register.html`: account-creation form sharing `auth.html`'s
  two-pane layout (see `docs/product/patterns/catalog/register.md`).
- `patterns/auth/reset-password.html`: password-reset request form and its
  post-submit confirmation state (see `docs/product/patterns/catalog/reset-password.md`).
- `patterns/auth/account-recovery.html`: alternative recovery-method chooser for
  when email access is lost (see `docs/product/patterns/catalog/account-recovery.md`).
- `patterns/auth/user-onboarding.html`: post-signup setup stepper and checklist
  (see `docs/product/patterns/catalog/user-onboarding.md`).
- `patterns/ecommerce/product-card.html`: category filter and product grid with
  a loading-state example (see `docs/product/patterns/catalog/product-card.md`).
- `patterns/ecommerce/product-detail.html`: product page with variant selection
  and a specs table (see `docs/product/patterns/catalog/product-detail.md`).
- `patterns/ecommerce/checkout.html`: shipping/payment form with an order
  summary sidebar (see `docs/product/patterns/catalog/checkout.md`).
- `patterns/ecommerce/shopping-cart.html`: full-page cart table with an empty
  state (see `docs/product/patterns/catalog/shopping-cart.md`).

The pattern catalog will grow after each pattern has a real semantic contract,
copyable source, and static contract coverage.
