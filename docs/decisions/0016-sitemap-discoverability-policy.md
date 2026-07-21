# 0016 — Sitemap discoverability policy

## Context

CKCSS keeps static public routes for focused demonstrations, legacy links, and
deep documentation. Listing every one in the XML sitemap made primary adoption
paths indistinguishable from auxiliary or experimental material.

## Options

1. Keep every public route in the sitemap.
2. Remove auxiliary routes entirely.
3. Keep all routes published, but include only primary product, documentation,
   and curated example routes in the sitemap.

## Decision

Choose option 3. The sitemap includes the landing page, distribution, AI guide,
primary documentation, themes, Enhance, and curated application/pattern
examples. `states`, `variants`, `interactions`, `mobile-navigation`, `sources`,
`modular`, `navigation-enhance`, and `css-lab` remain published but are omitted.

## Consequences

- Existing URLs and direct links remain valid.
- Search engines receive a clearer primary information architecture.
- New auxiliary routes must not be added to the sitemap without an explicit
  discoverability decision.

## Owner and date

Product owner · 2026-07-21
