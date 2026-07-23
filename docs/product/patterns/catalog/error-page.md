---
title: Error & status pages
paths:
  - site/404.html
  - site/500.html
  - site/maintenance.html
order: 07
family: error-page
wave: 1
---

Three minimal, self-contained pages for the "sorry, something went wrong" moments
every deployed site needs: a not-found page, a server-error page, and a maintenance
page. All three already existed in `site/` before this wave; this entry documents
them as a formal UI Kit pattern family and adds them to the catalog.

## States

Each page IS a state (there is no interactive state matrix beyond it) — the pages
themselves represent the empty/error/unavailable state of the rest of the site:

- **404** — content not found. CTA back to home and to `/patterns.html`.
- **500** — a server-side error. CTA to retry (`/`) and to `/contact.html` for support.
- **maintenance** — planned downtime. Single CTA back to home.

## Semantic HTML & accessibility

- Each page is a single `<main class="ck-container ck-stack ckcss-error">` with one
  `<h1>`, one `<p>`, and 1-2 `<a class="ck-button">` calls to action — heading order
  and reading order are identical, satisfying `docs/product/patterns.md` rule 4.
- `<meta name="robots" content="noindex">` on all three (correct for pages that
  should never be indexed or linked from `sitemap.xml`/`robots.txt` — verified
  neither file references them, which is intentional, not a gap).
- Buttons/links use the same `:focus-visible` ring as every other CKCSS interactive
  element (`src/base.css`'s global rule) — no page-specific focus styling needed.
- No form controls, so no additional ARIA/label requirements beyond the link text
  already being descriptive ("Ana sayfaya dön", "Destek iste", etc.).

## Tokens

Only existing semantic tokens and classes: `ck-container`, `ck-stack`, `ck-cluster`,
`ck-button`/`ck-button--secondary`, plus the site-only `ckcss-error`/
`ckcss-error-code` wrapper classes already defined in `site/assets/site.css` (not
part of the CKCSS public API). No new tokens or classes were needed.

## Responsive behavior

`ck-container`'s default max-width and `ck-stack`'s vertical rhythm already handle
all viewport sizes with no page-specific breakpoints — verified at 375/768/1280px.
