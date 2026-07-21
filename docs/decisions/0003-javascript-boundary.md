# ADR 0003: JavaScript-free Core with native HTML first

**Status:** Amended by [ADR 0013](0013-enhance-optional-modules.md) — CKCSS
now ships optional Enhance modules; Core remains JavaScript-free.

## Context

The product promise is a framework that works on shared hosting and static HTML
without a runtime dependency.

## Decision

CKCSS Core and UI Kit recipes contain CSS and semantic HTML only. Where interaction
is necessary, use native capabilities such as `details`, `summary`, `dialog`, and
form controls. Application JavaScript may enhance a pattern but is not shipped or
required by CKCSS.

## Consequences

- CSS can style a modal but cannot own arbitrary modal lifecycle management.
- Documentation must distinguish native/CSS behavior from app-owned behavior.
- Complex JS widgets remain outside MVP scope.
