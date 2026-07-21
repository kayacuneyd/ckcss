# CKCSS Architecture Overview

CKCSS ships static CSS and documentation. It has no runtime service, database,
or JavaScript dependency.

```text
src/ CSS modules
        ↓ release assembly/minification (optional developer tooling)
dist/ckcss.css + dist/ckcss.min.css
        ↓
static HTML, PHP, WordPress, Laravel, or any server-rendered application
```

## Source layers

1. `reset.css` — minimal normalization and safe defaults.
2. `tokens.css` — colors, typography, spacing, radius, shadows, motion, and z-index.
3. `base.css` — semantic elements, focus, selection, reduced motion, and typography.
4. `layout.css` — container, grid, stack, cluster, sidebar, and responsive primitives.
5. `components.css` — component contracts with `ck-` prefixes.
6. `utilities.css` — small opt-in helpers only where primitives are insufficient.

Source order is represented through CSS cascade layers. `dist/` is a committed
consumer artifact; implementation details remain in `src/`.

## Public API boundary

- Stable public classes start with `ck-`.
- CSS custom properties beginning with `--ck-` are documented customization points.
- HTML examples use semantic native elements first.
- JavaScript behaviors are never a CKCSS Core requirement.

See `docs/decisions/` for concrete architectural decisions.
