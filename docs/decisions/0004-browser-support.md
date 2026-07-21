# ADR 0004: Modern evergreen browsers are the initial baseline

## Context

CKCSS aims to use modern CSS while remaining pragmatic for shared-hosting users.

## Decision

Target currently supported evergreen Chrome, Edge, Firefox, and Safari-class
engines. The free release gate runs Playwright Chromium, Firefox, and WebKit;
WebKit is an engine-level compatibility signal and is not represented as a real
Safari device or operating-system test.
Progressive enhancements may use features such as container queries only when a
functional fallback is documented. Internet Explorer is out of scope.

## Consequences

- Browser matrix and version policy must be published before v0.1.
- No paid browser-testing service is required for CKCSS Core verification.
- Every enhancement needs an observable fallback or an explicit support note.
