# Definition of Done

A change is done only when the applicable items are complete:

- Problem, scope, non-goals, and acceptance criteria are recorded.
- Code is reviewed and follows project conventions.
- Risk-appropriate tests and checks pass.
- Security-sensitive changes receive a security review.
- Documentation and decision records are updated when behavior or architecture changes.
- Every new public CKCSS class or token has a live entry on the public component
  catalog with semantic guidance and a copyable HTML snippet; its contract test
  verifies both the distributed CSS and catalog source.
- New components and Enhance behaviors pass the i18n contract: logical
  properties only, no injected user-facing strings, and localizable generated
  content (ADR 0015).
- Deployment has a rollback path and production smoke verification where applicable.
- The owner can state how the change will be measured after release.
