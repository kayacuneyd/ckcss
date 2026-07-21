# ADR 0013: CKCSS Enhance ships optional, independent behavior modules

## Context

ADR 0003 drew the JavaScript boundary as "application JavaScript may enhance
a pattern but is not shipped or required by CKCSS". The beta grew a set of
small, reusable behavior modules under `enhance/` (navigation, theme, dialog,
tabs, forms, table, toast) that the public site already demonstrates, while
the decision record still said "not shipped" and `docs/product/enhance.md`
listed existing modules as planned. The recorded boundary and reality had
diverged.

## Decision

Amend ADR 0003. CKCSS **Core** stays JavaScript-free: no module is required,
loaded by the CSS, or imported by another module. CKCSS **Enhance** is a
shipped, optional companion of independent ES modules that attach only to
documented `data-ck-*` hooks, keep no global application state, and leave the
page fully usable when JavaScript is disabled or a module never loads.

The product brief's non-goals still stand: managed widget systems such as
date pickers, auto-rotating carousels, and managed toast *queues* remain out
of scope. `enhance/toast.js` is a single timed `role="status"` toast per
trigger — it does not queue, stack, or globally manage toasts.

## Consequences

- `tests/enhance-contract.sh` enforces the module contract (no imports,
  hook-based discovery, documented ARIA behavior) and runs as part of
  `npm run test:contracts`.
- Every Enhance module needs a live demo on the public catalog
  (`site/enhance.html`) and a documentation entry in
  `docs/product/enhance.md` before release.
- Consumers who never load Enhance keep the Core contract unchanged.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-21.
