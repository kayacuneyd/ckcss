# Engineering Constitution

This project is governed by the **KayaEOS Engineering & Design Constitution**:

- Canonical source: <https://github.com/kayacuneyd/kayaengineeringos/blob/main/constitution.md>
- Adopted version: **2.0.0** (2026-07-24) — CKCSS's first locally-adopted constitution file,
  numbered 2.0.0 to align with the shared KayaEOS Engineering & Design Constitution framework
  also adopted the same day by the sibling [DevinimJS](https://github.com/kayacuneyd/devinimjs)
  repo (`constitution.md`). Both repos, plus DizgePHP, follow the same canonical §1–§10; this
  file makes the discipline concrete for CKCSS's specific product boundary (static CSS, optional
  JS enhancement, shared-hosting distribution) the same way DevinimJS's does for a runtime
  reactivity library. Where this file is silent, canonical wins.

All playbooks, ADRs, code reviews and development workflows in this repository derive from, and
must not contradict, that constitution. Key bindings for daily work:

- §1 Design first — components, states and tokens before code.
- §2 Simplicity — YAGNI, 3-pass rule, no premature abstraction. See ADR-0020 (drawer composed
  from `[popover]`/`<dialog>` instead of a new component) as the canonical precedent.
- §3 Quality gates — `npm run test:contracts` (nine shell/JS contract suites plus
  `token-contrast.mjs`) and the Playwright engine matrix are non-negotiable before a release tag.
- §5 Progressive enhancement — **not waived** for CKCSS. This is the opposite posture from
  DevinimJS: Core is JavaScript-free by design (ADR-0003) and every Enhance module must leave
  the page fully usable if it never loads (ADR-0013). Progressive enhancement is the product,
  not an exception to it.
- §8 Security — never trust input; Enhance modules never write untrusted content via
  `innerHTML`/`insertAdjacentHTML` (enforced by `tests/i18n-contract.sh`'s string-injection
  check, which doubles as an XSS-surface guard).
- §9 Performance — `dist/ckcss.min.css` stays at or under **65536 bytes (64 KiB)** (ADR-0021), measured as
  plain minified bytes (`wc -c`, not gzip — see "Performance and distribution budget" below).
- §10 SemVer + Keep-a-Changelog. Pre-1.0: token/API removal is acceptable only during the beta
  window per ADR-0014; after 1.0 the same class of change requires a deprecation cycle per
  ADR-0010.

## CKCSS build-free & shared-hosting boundary

These rules preserve the "one `<link>` tag, no build, no runtime" promise (ADR-0001, ADR-0003,
ADR-0006):

1. Consumers install by linking a committed static file — `dist/ckcss.css` or
   `dist/ckcss.min.css` — or one self-contained module from `dist/modules/`. No npm install, no
   build step, no JavaScript runtime is ever required of a consumer.
2. Source lives modularized under `src/` with cascade layers; `dist/` is the only thing a
   consumer touches. A maintainer-only assembler/minifier may exist, but it produces
   deterministic, committed artifacts — it is never a dependency the consumer runs.
3. CKCSS **Core** (CSS + semantic HTML recipes) contains no JavaScript. Where interaction is
   needed, use native HTML capabilities first: `details`/`summary`, `dialog`, `popover`, form
   validation. CSS may style a native control's states; it may not own arbitrary lifecycle logic
   that only JavaScript can express.
4. CKCSS **Enhance** (`enhance/*.js`) is the sole permitted JavaScript layer, and it is optional
   by construction, not by convention: each module is an independent ES module with **zero
   imports of other modules** (checked by `tests/enhance-contract.sh`), attaches only through
   documented `data-ck-*` hooks, keeps no global application state, and the page must remain
   fully usable if the module never loads. A feature that cannot satisfy all four properties is
   not an Enhance module — it belongs in a consuming application, not in CKCSS.
5. Never propose promoting an Enhance capability into Core, or adding a new JS-behavioral
   component with its own state/lifecycle management, without first checking whether it can be
   composed from what Core already offers (native elements + one small positioning/sizing class,
   as ADR-0020 did for `.ck-drawer`). Composition beats a new component; a new component beats a
   new JS state-management pattern.
6. Browser baseline is currently-supported evergreen Chrome/Edge/Firefox/Safari-class engines
   (ADR-0004). Any progressive-enhancement feature (container queries, `light-dark()`) needs a
   documented, functional fallback for an engine that lacks it — it must not be the only way to
   use the page.

## Performance and distribution budget

1. **Absolute core budget.** `dist/ckcss.min.css` must be `<= 65536` bytes (ADR-0021), enforced by
   `tests/components-contract.sh` (`wc -c`). This is plain minified size, not gzip — do not
   conflate it with DevinimJS's `min+gzip` budget, which is a different metric for a different
   artifact type.
  2. **The budget is a deliberate margin, not a blank check.** ADR-0019 raised the budget to
    26624 bytes for defect fixes; ADR-0021 raised it to 65536 bytes to fit industry-standard
    token-based utilities, print styles, and expanded form/feedback components from
    `EMPOWERMENT.md`. Prefer reusing an existing semantic token or composing from existing
    primitives before spending budget on something new. Modular `dist/modules/*` entry points
    remain available for smaller installs.
  3. **Every PR that changes `dist/ckcss.min.css` states the before/after byte count.** A PR that
    grows the bundle without stating the delta, or that could have reused an existing token/class
    instead of adding one, is non-compliant. A PR that grows the bundle enough to threaten the
    65536-byte ceiling requires its own budget ADR (ADR-0019/0021 are the template), not a silent
    bump of the number in `components-contract.sh`.
4. **No font binaries in the core distribution.** Aleo is the default typeface (ADR-0011), but
   the core CSS never bundles a font file; the site self-hosts its own copies. This keeps the
   distribution boundary honest — a consumer who links `ckcss.min.css` gets CSS, not a hidden
   asset payload.
5. **No paid or hosted browser-testing dependency.** The release gate runs an open-source
   Playwright Chromium/Firefox/WebKit matrix at 390/768/1440px (ADR-0006); no maintainer or
   consumer workflow may introduce a paid device-cloud dependency as a required gate.

## Product and design principles

CKCSS is a CSS-first, progressive-enhancement framework. The following are constitutional
constraints; `docs/product/css-principles.md` and `docs/product/definition-of-done.md` hold the
operational detail:

1. **Mobile-first, content-determined layout.** Start mobile-first and let content decide where
   a breakpoint is actually needed, rather than designing desktop-first and retrofitting small
   screens.
2. **Fluid functions before breakpoints.** Prefer `clamp()`, `min()`, `max()`, `ch`, `minmax()`
   and `auto-fit` before reaching for a new `@media` rule. See "Fluid design and responsive
   contract" below for the enforceable version.
3. **Layout primitives own spacing; components own internal rhythm.** Don't let a component
   reach outside itself to control page-level layout spacing, and don't let a page-level
   primitive dictate a component's internal padding.
4. **Semantic HTML is usable before CSS or JavaScript loads.** A page must make sense as plain
   HTML first; CSS is a presentation layer on top, and JavaScript (Enhance) is optional
   behavior on top of that.
5. **State is explicit, not implied.** Use native pseudo-classes, `aria-*` attributes and scoped
   `data-ck-state` attributes as the state contract — never a class name alone to signal "open"
   or "selected."
6. **Motion is optional and reversible.** Animation must honor
   `@media (prefers-reduced-motion: reduce)`; it communicates state, it never gatekeeps content
   discovery.
7. **Token-led design.** Colors, type, spacing, radii, elevation and motion come from `--ck-*`
   tokens; see "Mathematical design and token discipline" for the enforceable version.
8. **Explainable, copyable examples.** Every documented class or token has a live catalog entry
   with a copyable HTML snippet, verified by contract test against both the distributed CSS and
   the catalog source (`docs/product/definition-of-done.md`).

## Mathematical design and token discipline

`src/tokens.css` is the single source of numeric and chromatic truth, governed primarily by
ADR-0002, ADR-0008, ADR-0011, ADR-0014 and ADR-0017. These clauses make token-led design
mechanically checkable.

1. **`ck-` / `--ck-` is the only public prefix (ADR-0002).** Every documented class begins with
   `ck-`; every public custom property begins with `--ck-`. Component APIs compose base + variant
   classes (`ck-btn ck-btn-primary`), never a single monolithic class per variant.
2. **rem is the scalable-measurement unit (ADR-0008).** Spacing, padding, gaps, typography,
   component dimensions, radius and container limits use `rem`. Reserve `px` only for
   pixel-sensitive detail: 1px hairline borders and 2–3px focus outlines. Use `%`, `fr`, and `ch`
   for fluid layout and readable text measurement. Use `999px` only for an intentional pill
   shape — never as a generic "large radius" value. A `rem`-scalable property expressed in raw
   `px` is a token-policy violation, not a style preference.
3. **Fluid values combine `clamp()` with `rem` bounds plus a `vw` term** — never a bare `px`/`rem`
   value paired with a media-query override to "fix" it at another width. `--ck-font-size-2xl`
   and `--ck-font-size-display` are the reference pattern.
4. **One named type scale (ADR-0014).** `xs, sm, md, lg, xl, 2xl, display` is the complete,
   closed scale. A numbered duplicate scale, or a hand-picked font-size literal at a call site,
   does not ship.
5. **Components consume semantic tokens, never primitives or literals (ADR-0011).** Use
   `--ck-color-primary`, `--ck-color-danger`, etc. The raw `--ck-iznik-*` palette and the
   `--ck-palette-{blue,coral,mint,violet}-*` aliases exist for local brand/product detail outside
   component styling, not as a shortcut around the semantic layer. A raw hex/`rgb()` literal
   anywhere in `src/` is rejected by the token contract.
6. **Every semantic token has exactly one declaration (ADR-0017).** Use `light-dark()` with
   `color-scheme: light dark` on `:root`; `[data-ck-theme="dark"]`/`[data-ck-theme="light"]` only
   ever pin `color-scheme`, never repeat token values. Two hand-maintained copies of the same
   token (light block + dark block) is exactly the drift this ADR eliminated — don't reintroduce
   it.
7. **WCAG AA contrast is enforced, not eyeballed.** Every semantic foreground/background pairing
   must meet ≥4.5:1 (or ≥3:1 for large text/non-text UI), asserted in `tests/token-contrast.mjs`.
   A new or changed semantic color token that doesn't ship a corresponding assertion update does
   not merge.
8. **The utility layer is scope-gated, not open-ended (ADR-0009).** `ck-utilities` holds named,
   token-based helpers only — accessibility, typography, overflow, responsive visibility, native
   state communication. Arbitrary-value utilities, arbitrary selectors, class scanning, plugins,
   and `@apply` remain permanently out of scope; every new utility must be reviewed for scope
   creep against this ADR before it ships, not added by analogy to Tailwind.
9. **Breakpoint values are centralized, not repeated (ADR-0018).** `40rem`/`48rem`/`64rem` are
   defined exactly once, in `scripts/breakpoints.sh`; source files reference the
   `$ck-bp-sm`/`$ck-bp-md`/`$ck-bp-lg` placeholders, expanded at build time. A literal `@media
   (min-width: 40rem)` typed directly into a new source file — instead of the placeholder — is a
   drift risk this ADR exists specifically to prevent.

## Fluid design and responsive contract

1. **Fluid functions are the default; a breakpoint is the exception.** Reach for `clamp()`,
   `min()`, `max()`, `minmax()`, `auto-fit`/`auto-fill` and `ch` before adding a new `@media`
   rule. A breakpoint is justified only when the layout structurally reorganizes (stacked →
   multi-column, hidden → visible content), not for cosmetic resizing that a fluid function can
   express.
2. **Only the three centralized breakpoints are sanctioned (ADR-0018).** `$ck-bp-sm` (40rem/
   640px), `$ck-bp-md` (48rem/768px), `$ck-bp-lg` (64rem/1024px) are the complete set. A new
   arbitrary breakpoint value is a constitutional violation; if a genuinely new threshold is
   needed, it's a `scripts/breakpoints.sh` change proposed via ADR, not a one-off literal.
3. **Container queries are progressive enhancement with a mandatory fallback (ADR-0004,
   ADR-0009).** Use `@container` only behind `@supports (container-type: inline-size)` (or
   equivalent), with a documented, functional viewport-based layout for engines that don't
   support it — never as the only way a component lays out correctly.
4. **Logical properties only — this is also the responsive contract's i18n half
   (ADR-0015).** No physical directional property (`margin-left`, `text-align: right`,
   `float: left`, bare `left`/`right`) in `src/`; `tests/i18n-contract.sh` rejects them outright.
   A responsive layout that only works left-to-right is not done.
5. **Touch and pointer targets stay usable at every fluid step.** A component's interactive
   controls must not shrink below a usable hit area as fluid values scale down toward the small
   end of their `clamp()` range.
6. **Verification spans the full Playwright matrix, not just the two ends.** Chromium, Firefox
   and WebKit at 390px, 768px and 1440px (ADR-0006), plus an RTL Arabic and a CJK document
   render per engine (ADR-0015) — a component isn't responsive-by-default until it passes this
   matrix, not just "looks fine" at one checked width.

## AI and developer contract (anti-drift enforcement)

This section binds AI coding agents (including Claude Code sessions operating in this repo) and
human developers to the same enforcement standard, mirroring DevinimJS's constitution so the two
projects drift together, not apart.

1. **No invented tokens, ever.** An agent or developer must not write a new spacing, color,
   radius, shadow, duration, font-size, or breakpoint *literal*. The only legal moves are:
   (a) use an existing `--ck-*` token or `$ck-bp-*` placeholder, or (b) propose a new one via ADR
   and add it to `tokens.css`/`breakpoints.sh` first. A value that exists only inline at a call
   site is a defect, not a style nit.
2. **Composition before a new component; a new component before new JavaScript.** Before adding
   a `ck-*` component class or an `enhance/*.js` module, check whether the need is already met by
   composing native HTML + existing CSS primitives (ADR-0020 is the worked example: an
   off-canvas drawer needed no new component, just one 6-property positioning class layered on
   `[popover]`/`<dialog>`). If composition genuinely can't express it, prefer a new Core CSS
   component over a new Enhance module, and a new Enhance module over extending Core with
   JavaScript-dependent behavior (ADR-0003/ADR-0013's boundary is not negotiable per-feature).
3. **Self-verification before "done."** Before presenting a CSS/token/markup change as complete,
   state explicitly: which `--ck-*` tokens were used (spacing/color/type/radius/shadow/motion),
   that no raw literal or physical directional property was introduced, and the before/after
   `dist/ckcss.min.css` byte count if `dist/` changed. If any of those can't be stated, the
   change is not done.
4. **YAGNI applies with extra force to agents, and the utility/component layers are
   reviewed for scope creep by design (ADR-0009).** Do not add a new utility, component variant,
   or Enhance module because it seems generally useful — add it because a documented use case in
   `docs/product/features/` or an open ADR requires it. A diff that adds surface area beyond the
   stated task is non-compliant and must be trimmed before it's presented as a candidate change.
5. **i18n/RTL discipline is not skippable.** Every new component or Enhance behavior must pass
   `tests/i18n-contract.sh`: logical properties only, no injected user-facing strings from CSS or
   JS, localizable generated content routed through a token (like
   `--ck-breadcrumb-separator`) or a `data-ck-label-*` hook, never a hardcoded string.
6. **The Core/Enhance JavaScript boundary is checked, not assumed.** Before adding any JS
   behavior, verify against `tests/enhance-contract.sh`'s actual checks: the module has zero
   imports of other modules, attaches only via `data-ck-*` hooks, and the page stays usable
   without it. A change that can't pass that contract does not belong in this repo, regardless of
   how useful it would be.
7. **Build-free and budget boundaries are checked, not assumed.** Verify against "CKCSS
   build-free & shared-hosting boundary" and "Performance and distribution budget" above before
   proposing a change; state the `npm run build` + `wc -c` delta explicitly whenever `src/`
   changes could affect `dist/` size.
8. **Traceability.** Every AI-authored commit or PR follows AGENTS.md's guardrails: significant
   technical or product decisions go in `docs/decisions/` as a numbered ADR, work happens on a
   branch (never a direct push to `main`), and scope is not silently expanded — assumptions and
   open questions get recorded, not guessed past.
9. **Constitutional-tier files require human merge approval.** `constitution.md`,
   `docs/decisions/*.md`, `src/tokens.css`, and `scripts/breakpoints.sh` cannot be self-merged by
   an agent under any autonomy setting — a human reviews and approves changes to these
   specifically, even when other changes in the same task are pre-approved for autonomous merge.
10. **When this constitution and a request conflict, the constitution wins.** If an instruction
    would require violating a clause above (e.g. "just hardcode this breakpoint for now," "skip
    the RTL check, it's just one component"), the correct response is to say so explicitly and
    propose the compliant alternative — not to comply quietly and call it temporary. Temporary
    exceptions are how the token/breakpoint/prefix drift these ADRs were written to fix gets
    reintroduced.

Changes to these principles require an ADR or an explicit constitutional amendment. Use
`docs/product/` for operational guidance and `docs/decisions/` for the historical record of why
each rule exists.

If this file and the canonical constitution diverge, the canonical source wins.
Amendments follow the process defined in the constitution itself.
