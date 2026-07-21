# Contributing to CKCSS

Thank you for your interest in improving CKCSS. Please read the following
before opening a change:

1. `docs/product/brief.md` — problem, scope, and explicit non-goals.
2. `docs/product/definition-of-done.md` — what "done" means here.
3. `docs/operations/release-and-rollback.md` — release expectations.

## Ground rules

- Consumers install CKCSS with a single `<link rel="stylesheet">`. Never add a
  consumer-facing build step, JavaScript runtime, or package install.
- Public classes use the `ck-` prefix; documented custom properties use `--ck-`.
- Components consume semantic `--ck-color-*` tokens only — raw colour literals
  in component CSS are rejected by the token contract.
- Core CSS uses logical properties only; physical directional properties are
  rejected by the i18n contract. Enhance modules never write user-facing
  strings — labels live in the page's markup (ADR 0015).
- Record significant technical or product decisions in `docs/decisions/`.
- Do not commit secrets or local environment files.

## Checks

Run the full contract suite before handing off:

```bash
npm run test:contracts
```

Generated artefacts (`dist/`, `site/assets/`) are committed. Rebuild them with
`./scripts/build-site.sh` so the CI staleness check passes.

## License

By contributing you agree that your contributions are licensed under the
project's [MIT license](LICENSE).
