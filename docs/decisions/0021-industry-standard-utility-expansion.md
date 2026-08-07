# ADR 0021: Industry-standard utility expansion and size budget

## Context

`EMPOWERMENT.md` defines the path from CKCSS beta to an industry-standard
utility + component framework (Tailwind/Bootstrap/Pico/Open Props parity on
scope, while keeping build-free delivery and shared tokens). ADR 0009 limited
helpers to a small semantic set; real product use still required ad-hoc spacing,
flex, sizing, and effect classes outside the framework.

Shipping ~200 token-based utilities, print styles, form expansions, and feedback
components grows `dist/ckcss.min.css` past the 26624-byte budget from ADR 0019.
The EMPOWERMENT success target of &lt; 20KB minified is incompatible with that
scope once the existing ~25KB core is retained for backward compatibility.

## Decision

1. Expand the public utility API under the `ck-` prefix and `ck-utilities`
   layer: spacing, sizing, display, flex/grid, position/z-index, typography,
   border/effects, motion, print helpers, and a11y preference helpers. Prefer
   logical properties and existing `--ck-*` tokens.
2. Keep layout primitives and BEM components as the primary composition model;
   utilities complement them and do not replace them.
3. Keep Core JavaScript-free. Theme toggle remains optional Enhance
   (`enhance/theme.js`) with `data-ck-theme` / `data-theme` contract.
4. Raise the enforced minified core budget to **65536 bytes (64 KiB)** to cover
   utility parity while leaving headroom. Modular entry points remain available
   for smaller installs.
5. Fraction width class names use hyphens (`ck-w-1-2`), not slashes, for tool
   and selector safety.

## Consequences

- ADR 0009 is amended: the helper set is intentionally larger, still token-based
  and documented, without arbitrary values or a compiler.
- Future growth still needs a budget ADR or modularization; 64 KiB is not a
  blank check.
- Consumers on shared hosting still use a single static stylesheet.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-26.
