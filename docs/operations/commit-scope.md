# Commit scope for the first public beta

This repository serves two things from one static codebase: the CKCSS framework
and its public documentation/showcase. The public beta commit must keep the
source, generated distributables, and static-site assets aligned.

## Commit

- Framework source and build logic: `src/`, `enhance/`, `scripts/`,
  `package.json`, and `package-lock.json`.
- Release artefacts: `dist/ckcss.css`, `dist/ckcss.min.css`, and the supported
  modular CSS entry points in `dist/modules/`.
- Static site and the assets it actually serves: `site/`, including generated
  `site/assets/ckcss*.css`, `site/assets/modules/`, `site/assets/enhance/`, and
  the self-hosted Aleo files with their OFL notice.
- Tests, CI, examples, product documentation, decisions, release notes, legal
  files, and contributor/security guidance.

## Do not commit

- Dependency installation: `node_modules/`.
- Local visual-test evidence: `test-results/`, Playwright reports, and blob
  reports. CI uploads browser screenshots as build artifacts instead.
- Local design-tool metadata: `.hallmark/`.
- Python caches, virtual environments, local environment files, and operating
  system metadata.
- Credentials, deploy keys, local server logs, or any `.env` file other than a
  deliberately created `.env.example`.

## Staging procedure

1. Run `npm run build`, `npm run test:contracts`, and the release checks.
2. Review `git status --short` and `git diff --check`.
3. Stage the reviewed project scope with `git add` for the listed paths; do not
   use a blind all-files command if unrelated work appears in the worktree.
4. Inspect `git diff --cached --stat` and `git diff --cached --check`.
5. Make one intentional beta commit, then create the GitHub tag/release from
   that exact commit.

The release artefacts are intentionally committed. A GitHub Release must be
reproducible from the source tree and must contain the same files linked by the
documentation site.
