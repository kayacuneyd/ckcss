# CKCSS

CKCSS is a modern, static CSS framework and HTML/CSS UI kit for shared hosting,
static websites, PHP applications, and other projects that should not require a
build system or JavaScript runtime.

CKCSS is inspired by W3.CSS's simple distribution model; it is not a fork.

## Author

Built by [Cüneyt Kaya](https://kayacuneyt.com).

## Product contract

```html
<link rel="stylesheet" href="/assets/ckcss.min.css">
```

That is the complete consumer installation path. CKCSS documentation and release
artifacts must remain usable on ordinary shared hosting. Download tagged releases
from [GitHub Releases](https://github.com/kayacuneyd/ckcss/releases), browse the
[installation guide](https://ckcss.digitaltamam.com/download.html), or pin a
specific tag on jsDelivr:

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kayacuneyd/ckcss@v0.1.0-rc.2/dist/ckcss.min.css">
```

Never use an unpinned `latest` URL in production. For a smaller distribution,
choose one self-contained entry point from `dist/modules/`; modules are
alternatives to the complete bundle, not additive files.

## Development

```bash
npm install
npm run build
npm run test:contracts   # static contracts + icons
npm run test:a11y        # axe-core WCAG 2.2 AA (Chromium/Firefox/WebKit)
npm run test:visual      # light/dark/RTL visual baselines
npm run test:quality     # contracts + a11y + visual
```

Build the committed consumer artefacts with `./scripts/build-foundation.sh`.
The result is `dist/ckcss.css`, `dist/ckcss.min.css`, and
`dist/ckcss-icon-sprite.svg`. See [the component guide](docs/product/components.md)
and `examples/` for semantic, copyable usage. Icon catalog: `examples/icons.html`.

## License

CKCSS is released under the [MIT license](LICENSE); see `CONTRIBUTING.md` and
`SECURITY.md` for the contribution and disclosure process. The self-hosted
Aleo font files remain under the SIL Open Font License
(`site/assets/fonts/OFL.txt`).
