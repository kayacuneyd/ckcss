# ADR 0012: MIT license and community baseline files

## Context

CKCSS distributes a static CSS artefact intended for reuse on shared hosting,
static sites, and server-rendered applications. Until now the repository had
no license, contribution guide, or security policy, which blocks adoption:
without an explicit license, default copyright applies and reuse is not
permitted.

## Options

1. MIT — short, permissive, and the norm for CSS frameworks (W3.CSS,
   Bootstrap, Pico, Open Props).
2. Apache 2.0 — adds a patent grant, but heavier than this project needs.
3. CC0 / public domain — maximally permissive but removes attribution and is
   ambiguous for code in some jurisdictions.

## Decision

Choose MIT for the repository content (CSS sources and artefacts, Enhance
modules, scripts, and documentation). Ship a standard MIT `LICENSE` file with
"Cüneyt Kaya" as the copyright holder, a short `CONTRIBUTING.md`
pointing at the project workflow, and a `SECURITY.md` with supported versions
and a private reporting channel. The CI contract requires `LICENSE` to exist.
The self-hosted Aleo font files remain under their own SIL Open Font License
(`site/assets/fonts/OFL.txt`), which this decision does not relicense.

## Consequences

- Consumers may embed `ckcss.css`/`ckcss.min.css` in commercial and
  proprietary projects with attribution.
- Contributions are licensed under MIT per `CONTRIBUTING.md`.
- The license choice is recorded and reviewable like any other product
  decision.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-21.
