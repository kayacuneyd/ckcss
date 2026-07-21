# ADR 0007: Establish a shared visual rhythm for the CKCSS site

## Context

The landing page and component catalog had a clear editorial direction, but
their spacing, panel treatment, radius, code blocks, and responsive composition
were not governed by one visible site-level system. This made the pages feel
assembled from individually styled sections rather than one coherent product.

## Options

1. Keep the current page-specific values and tune sections independently.
2. Adopt Tailwind's visual values directly and reproduce its presentation.
3. Define a small CKCSS site system for spacing, containers, radii, surfaces,
   code panels, and section rhythm while preserving CKCSS's editorial identity.

## Decision

Choose option 3. The site keeps its coral, mint, ink, and paper palette and
editorial display typography, but uses shared site tokens for macro spacing,
panel radii, code presentation, and decorative shadows. The landing hero and
component examples must use the same panel and responsive composition rules.

The site layer remains separate from the public CKCSS core API. No JavaScript
is required for the visual treatment.

## Consequences

- Future site sections should consume the existing `--ckcss-*` site tokens
  instead of introducing one-off spacing or radius values.
- Code examples have a consistent frame, toolbar, readable padding, and mobile
  overflow behavior.
- The visual language is inspired by design-system discipline, not a copy of
  Tailwind's defaults or branding.
- Responsive visual verification remains required at narrow, tablet, and wide
  viewports.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-21.
