# ADR 0002: `ck-` is the public class and token prefix

## Context

CKCSS will be embedded in sites that may already use theme, CMS, or legacy CSS.

## Decision

All documented classes begin with `ck-`; all public custom properties begin with
`--ck-`. Component APIs use composable base + variant classes, for example
`ck-btn ck-btn-primary`.

## Consequences

- Lower collision risk than generic class names.
- Slightly longer HTML, but predictable migration and searchability.
- W3.CSS class compatibility is intentionally not provided in v1.
