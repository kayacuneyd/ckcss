# UI Kit Patterns — gap analysis and consolidation

## Purpose

`componens-img/manifest.json` catalogs 458 reference screenshots (visual inspiration
only — no HTML/CSS source was captured) across 78 Flowbite Blocks categories, used
as a taxonomy to scope CKCSS's own "UI Kit patterns" roadmap line. This document
maps those 78 categories down to a bounded backlog of **41 pattern families**,
folding style-variants (e.g. hero's 18 screenshots are one family, not 18) and
state-variants (e.g. a delete-confirmation dialog is a *state* of its parent
pattern, per the state matrix every pattern already requires under
`docs/product/patterns.md`) into their parent family, and crediting the 6 existing
CKCSS patterns that already cover part of this ground.

Every family listed below must still be genuinely rebuilt semantic-HTML-first with
CKCSS tokens/primitives/components — the source screenshots carry no code to reuse,
by design (see `flowbite_components_screenshots.py`, which screenshots each block's
`<iframe>` rather than scraping markup).

## Marketing group (28 categories → 20 families)

| Family | Folds in (category: image count) | Existing CKCSS coverage |
| --- | --- | --- |
| hero | hero (18), storefront-hero (7, e-commerce-themed variant) | none dedicated |
| cta | cta (10) | none dedicated |
| feature | feature (10) | none dedicated |
| content | content (9) | none dedicated |
| header | header (8) | none dedicated |
| team | team (8) | none dedicated |
| footer | footer (7) | none dedicated |
| pricing | pricing (7) | **extends `site/pricing.html`** |
| contact | contact (6) | **extends `site/contact.html`** |
| trust-signal | social-proof (6), testimonial (5), customer-logos (5) | none dedicated |
| banner | banner (5) | none dedicated |
| blog | blog (5), blog-templates (6, Publisher), related-articles (5, Publisher) | none dedicated |
| faq | faq (5) | none dedicated |
| newsletter | newsletter (5) | none dedicated |
| popup | popup (5) | none dedicated |
| portfolio | portfolio (5) | none dedicated |
| event-schedule | event-schedule (4) | none dedicated |
| cookie | cookie (4) | none dedicated |
| auth | login (5), register (5), reset-password (5), account-recovery (5), user-onboarding (4) | **extends `site/auth.html`** |
| error-page | 404 (3), 500 (3), maintenance (3) | none dedicated |

## Application group (22 categories → 8 families)

| Family | Folds in | Existing CKCSS coverage |
| --- | --- | --- |
| data-table | table-headers (13), table-footers (6), advanced-tables (7), filter (8), faceted-search-modals (5, as a filter variant) | **extends `site/data-management.html`** |
| app-shell | sidenav (12), navbar (6), navbars (6, e-commerce group), shells (8), dashboard-footer (7) | **extends `site/app-shell.html`** |
| crud-modal | crud-create-modals (7), crud-update-modals (7), crud-read-modals (6); crud-delete-confirm (6) and crud-success-message (5) are **states** of this family's state matrix, not separate patterns | none dedicated |
| crud-drawer *(wave 6b, blocked)* | crud-create-drawers (5), crud-update-drawers (5), crud-read-drawers (6), faceted-search-drawers (4) | none dedicated |
| crud-form-page | crud-create-forms (5), crud-update-forms (5) | none dedicated |
| crud-read-section | crud-read-sections (6) | none dedicated |
| *(dropped as standalone)* | `crud` (5, generic overview) — becomes intro copy inside crud-modal/crud-form-page docs, not its own pattern | — |

## E-commerce group (25 categories → 12 families)

| Family | Folds in | Existing CKCSS coverage |
| --- | --- | --- |
| product-card | product-cards (5), product-categories (6) | partial — `site/product-patterns.html` |
| product-detail | product-overview (5), product-information (4) | partial — `site/product-patterns.html` |
| reviews | product-review (3), reviews-history (5) | none dedicated |
| status-timeline | order-tracking (5), refund-status (5), refunds (5) — one underlying UI reused across 3 contexts | none dedicated |
| request-form | refund-forms (5), service-repair-forms (4), warranties (5), customer-service (5) | none dedicated |
| checkout | checkout (5) | none dedicated |
| payment-forms | payment-forms (8) | none dedicated |
| shopping-cart | shopping-cart (5) — built as a full page/`<dialog>` cart in wave 4; off-canvas variant deferred to wave 6b | none dedicated |
| order-confirmation | order-confirmation (5) | none dedicated |
| orders-overview | orders-overview (5) | none dedicated |
| account-overview | account-overview (5) | none dedicated |
| discount-promo | discount (6), promotional-sections (5) | none dedicated |

## Publisher group (3 categories → 1 new family)

| Family | Folds in | Existing CKCSS coverage |
| --- | --- | --- |
| comments | comments (4) | none dedicated |
| *(folded elsewhere)* | blog-templates, related-articles → folded into marketing `blog` family above | — |

## Total: 41 pattern families

- Marketing: 20
- Application: 8
- E-commerce: 12
- Publisher: 1 (net new; 2 of its 3 categories fold into marketing)

6 existing patterns (`pricing.html`, `contact.html`, `app-shell.html`,
`data-management.html`, `auth.html`, `product-patterns.html`) already give partial
coverage to 6 of the 41 families — those waves extend rather than duplicate them.

## Open architecture question (wave 6b)

Neither `crud-drawer` nor the shopping-cart off-canvas variant have a first-class
CKCSS component today. Default resolution: compose from `[popover]` positioned via
tokens (no new component, no ADR needed). Only fall back to a new `ck-drawer`
component — which would need its own ADR and a `dist/ckcss.min.css` size-budget
check against the 26624-byte ceiling set in
[ADR 0019](../decisions/0019-size-budget-increase-for-parity-fixes.md) — if
composition genuinely can't deliver the required semantics/focus-trap behavior.
