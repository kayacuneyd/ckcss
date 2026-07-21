# CKCSS product site redesign

## Purpose

The public static site explains CKCSS, teaches adoption, and demonstrates the UI
kit without making JavaScript a prerequisite. The primary IA is landing, guide,
documentation hub, components, tokens, patterns, CSS Lab, and Enhance.

## Contracts

- Existing public HTML routes remain published. The sitemap contains only primary product, documentation, and curated example routes; auxiliary or experimental routes remain directly accessible but are omitted from it.
- Public Core classes remain `ck-`; product-site-only classes use `ckcss-`.
- Every main page has a canonical URL, a skip link, responsive navigation, and
  the same Aleo-led visual vocabulary.
- Each component example must keep semantic HTML and expose its source, state,
  responsive behavior, and accessibility guidance. Enhance remains optional.

## Verification

Check routes and canonicals, run the contract suite and build, and inspect the
landing, docs, components, patterns, and Enhance at 390px, 768px, and 1440px.
