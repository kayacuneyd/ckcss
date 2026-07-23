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
- `patterns/application/app-navbar.html`: in-app top bar with search,
  notifications, and a user menu, plus an app-level footer bar — complements
  `app-shell.html` (see `docs/product/patterns/catalog/app-navbar.md`).
- `patterns/application/advanced-table.html`: row selection, bulk-action
  toolbar, and a totals footer row — complements `data-management.html` (see
  `docs/product/patterns/catalog/advanced-table.md`).
- `patterns/application/crud-modal.html`: native-dialog edit modal with
  delete-confirm/success as documented states (see
  `docs/product/patterns/catalog/crud-modal.md`).
- `patterns/application/crud-form-page.html`: full-page create/edit form (see
  `docs/product/patterns/catalog/crud-form-page.md`).
- `patterns/application/crud-read-section.html`: read-only record detail view
  with a quick-edit dialog (see
  `docs/product/patterns/catalog/crud-read-section.md`).
- `patterns/application/crud-drawer.html`: edge-anchored off-canvas panel
  (`.ck-drawer` composition, ADR 0020), also the off-canvas variant for
  `shopping-cart.html` (see `docs/product/patterns/catalog/crud-drawer.md`).
- `patterns/ecommerce/payment-forms.html`: standalone card + billing-address
  form (see `docs/product/patterns/catalog/payment-forms.md`).
- `patterns/ecommerce/status-timeline.html`: shipment-tracking and
  refund-status timeline variants (see
  `docs/product/patterns/catalog/status-timeline.md`).
- `patterns/ecommerce/request-form.html`: refund/warranty/service/support
  request form (see `docs/product/patterns/catalog/request-form.md`).
- `patterns/ecommerce/order-confirmation.html`: post-checkout success page
  (see `docs/product/patterns/catalog/order-confirmation.md`).
- `patterns/ecommerce/orders-overview.html`: customer-facing order-history
  table (see `docs/product/patterns/catalog/orders-overview.md`).
- `patterns/ecommerce/account-overview.html`: customer account hub (see
  `docs/product/patterns/catalog/account-overview.md`).
- `patterns/ecommerce/discount-promo.html`: campaign banner and coupon-code
  form (see `docs/product/patterns/catalog/discount-promo.md`).
- `patterns/marketing/team.html`: team-member card grid (see
  `docs/product/patterns/catalog/team.md`).
- `patterns/marketing/banner.html`: top-of-page announcement strip (see
  `docs/product/patterns/catalog/banner.md`).
- `patterns/marketing/blog.html`: post grid and related-articles list (see
  `docs/product/patterns/catalog/blog.md`).
- `patterns/marketing/faq.html`: full-page FAQ list (see
  `docs/product/patterns/catalog/faq.md`).
- `patterns/marketing/newsletter.html`: signup with value-proposition list
  (see `docs/product/patterns/catalog/newsletter.md`).
- `patterns/marketing/popup.html`: native-dialog marketing popup (see
  `docs/product/patterns/catalog/popup.md`).
- `patterns/marketing/portfolio.html`: filterable project/case-study grid
  (see `docs/product/patterns/catalog/portfolio.md`).
- `patterns/marketing/event-schedule.html`: conference/event agenda (see
  `docs/product/patterns/catalog/event-schedule.md`).
- `patterns/marketing/cookie.html`: cookie-consent bar with a real
  accept/reject choice (see `docs/product/patterns/catalog/cookie.md`).
- `patterns/ecommerce/reviews.html`: rating summary and review list (see
  `docs/product/patterns/catalog/reviews.md`).
- `patterns/publisher/comments.html`: threaded discussion list and comment
  form (see `docs/product/patterns/catalog/comments.md`).

The pattern catalog will grow after each pattern has a real semantic contract,
copyable source, and static contract coverage.
