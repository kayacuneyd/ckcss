# CKCSS CSS principles

CKCSS uses a CSS-first, progressive-enhancement model inspired by modern
responsive CSS practice:

- Start mobile-first and let content determine breakpoints.
- Prefer `clamp()`, `min()`, `max()`, `ch`, `minmax()`, and `auto-fit` before
  adding a new breakpoint.
- Let layout primitives own spacing; component regions own their internal rhythm.
- Keep semantic HTML usable before CSS or JavaScript enhancement loads.
- Use `aria-*` and `data-ck-*` attributes as explicit state contracts.
- Keep animation optional and honor `prefers-reduced-motion`.
