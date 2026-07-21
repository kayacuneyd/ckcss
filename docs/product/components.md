# Essential Components — v0.1.0-beta

CKCSS components are semantic HTML enhanced by one static stylesheet. Copy the
examples below after linking `dist/ckcss.min.css`; no JavaScript is required.

## Buttons

Use a native `button` for in-page actions and an `a` element for navigation.
Apply `.ck-button` and, where needed, one modifier: `--secondary`, `--quiet`,
or `--danger`. Native `disabled` communicates unavailable button actions;
links may use `aria-disabled="true"` and must not retain an actionable `href`.

```html
<button class="ck-button" type="submit">Save changes</button>
<a class="ck-button ck-button--secondary" href="/account">Cancel</a>
```

## Cards, badges, and alerts

Cards use `article` where their content can stand alone. Use `ck-card__header`,
`ck-card__body`, and `ck-card__footer` only as direct card regions. Badges are
short status labels, never the sole way to communicate an important state.
Alerts require a readable title and message; use their severity modifier for
supplementary visual meaning.

```html
<article class="ck-card">
  <div class="ck-card__body"><h2>Project update</h2><p>Published today.</p></div>
</article>
<p class="ck-alert ck-alert--warning"><strong class="ck-alert__title">Review needed</strong> Update your email address.</p>
```

## Form controls

Pair every `.ck-input`, `.ck-select`, or `.ck-textarea` with a `label`. For an
invalid field, set `aria-invalid="true"`, point `aria-describedby` to visible
`.ck-field__error` text, and do not rely only on the red border. CKCSS supplies
visible keyboard focus; applications retain responsibility for validation and
submission behavior.

```html
<div class="ck-field">
  <label class="ck-field__label" for="email">Email</label>
  <input class="ck-input" id="email" aria-invalid="true" aria-describedby="email-error">
  <p class="ck-field__error" id="email-error">Enter a valid email address.</p>
</div>
```

## Tables and customization

Wrap wide data tables in `.ck-table-wrap`; `.ck-table` keeps semantic table
markup and scrolls horizontally only when necessary. Customize colours, spacing,
radius, and shadows by overriding documented `--ck-` tokens after the CKCSS
link. The complete interactive demo is `examples/components.html`.

## Helpers and states

CKCSS provides a deliberately small helper layer; layout primitives and
semantic components remain the preferred API. Use `.ck-visually-hidden` for
screen-reader-only content, `.ck-skip-link` for keyboard skip navigation, and
`.ck-focus-ring` when a custom focusable element needs the standard focus ring.
Other helpers include `.ck-text-small`, `.ck-text-lead`, `.ck-text-muted`,
`.ck-width-full`, `.ck-max-readable`, `.ck-overflow-auto`, and `.ck-truncate`.

Visibility helpers are explicit: `.ck-only-mobile` is hidden from 40rem upward,
`.ck-only-wide` appears at 64rem, `.ck-hide-mobile` hides from 40rem upward, and
`.ck-hide-desktop` hides from 64rem upward. Prefer `.ck-grid`, `.ck-sidebar`,
and component-owned responsive behavior for layout.

Component state uses native HTML where possible. Buttons support
`aria-pressed`, `aria-expanded`, and `aria-busy`. Cards support
`data-ck-state="selected|loading"`; alerts support `role="status"`,
`aria-live="polite"`, and `data-ck-state="dismissed"`. Fields may use
`data-ck-state="invalid|loading"` in addition to `aria-invalid` and visible
feedback text. Tables can expose `data-ck-state="loading"` on their wrapper.
Container-query enhancement is opt-in with
`.ck-query-container` and `.ck-query-grid`; the fallback is a single-column
grid.
## Responsive navigation and data helpers

`ck-breadcrumb`, `ck-tabs`, `ck-pagination`, `ck-stepper`, `ck-timeline`,
`ck-avatar-group`, and `ck-progress` provide static semantic presentation
patterns. They do not fetch data or manage application state; native links,
lists, `aria-current`, and `progressbar` semantics remain application-owned.
