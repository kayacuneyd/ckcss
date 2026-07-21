# Release and Rollback

## v0.1.0-beta release gate

- Run `./tests/foundation-contract.sh`, `./tests/layout-contract.sh`,
  `./tests/components-contract.sh`, and `./tests/landing-contract.sh` from a
  clean checkout.
- Run `./scripts/build-site.sh`; commit the resulting `dist/ckcss.css`,
  `dist/ckcss.min.css`, and `site/assets/ckcss.css` artefacts together.
- Confirm `dist/ckcss.min.css` is no larger than 24 KB and that it is a real
  minified form of the assembled CSS.
- Run the open-source Playwright workflow. It must pass Chromium, Firefox, and
  WebKit smoke coverage at 390, 768, and 1440 px before the beta tag is
  created. WebKit is engine coverage, not a claim of testing a real Safari
  device or operating system.

## Verification

- Smoke-test the linked minified file on an ordinary static HTTP server; no
  JavaScript or consumer build tool may be needed.
- Check the deployed landing, `/robots.txt`, and `/sitemap.xml` over HTTPS.
- Record the version, bundle size, browser-matrix URL, and result in the
  release review before tagging.

## Rollback

For the static landing, roll back by restoring the previous committed `site/`
directory and reloading the validated Nginx configuration. For framework users,
retain every versioned `dist/` artefact; rollback is changing the linked CSS file
back to the prior version. CKCSS has no data migrations.
