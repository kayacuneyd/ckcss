# ADR 0006: v0.1.0-beta ships two static artefacts with a strict quality gate

## Context

CKCSS promises a one-link, build-system-free consumer experience. The alpha
release assembled only an unminified CSS file even though the public contract and
architecture already named a minified artefact. Essential Components also expand
the public API enough to require explicit beta release evidence.

## Options

1. Keep only the unminified file and defer release packaging.
2. Add a dependency-heavy maintainer toolchain.
3. Assemble both committed artefacts with the existing portable toolchain and
   enforce static, size, and browser checks at release time.

## Decision

Choose option 3. `scripts/build-foundation.sh` creates `dist/ckcss.css` and
`dist/ckcss.min.css`; its small Python minifier preserves syntax and performs no
semantic rewriting. The minified beta core must remain at or below 24 KB. This
leaves room for the complete 50–950 İznik palette while preserving a strict,
small static-distribution budget.

Contract tests and CI verify generated artefacts. An open-source Playwright
matrix is required before tagging: Chromium, Firefox, and WebKit at 390, 768,
and 1440 px. WebKit is an engine-level Safari compatibility signal, not a claim
of testing an Apple Safari device. No hosted browser service or credentials are
part of the framework or consumer installation path.

## Consequences

- Consumers select either committed static file with one stylesheet link.
- Maintainers need Python 3 only for release assembly; no Node, package install,
  or runtime is introduced for users.
- `v0.1.0-beta` remains blocked from tagging until the open-source browser
  engine matrix records a successful run.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-21.
