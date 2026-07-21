# ADR 0015: Internationalization and RTL policy

## Context

CKCSS targets shared hosting and server-rendered sites worldwide, but the
framework's i18n posture was implicit. A 2026-07-21 audit found a strong base
— zero physical directional properties in `src/`, locale-aware case folding
in the table filter, and no `text-transform` usage — alongside four gaps:
`enhance/forms.js` hardcoded Turkish toggle labels, the breadcrumb separator
was a fixed `"/"`, no contract guarded the logical-property boundary, and the
browser matrix never rendered an RTL or non-Latin document.

## Decision

1. CKCSS generates no prose. CSS may only emit tokenized separators or
   counters; Enhance modules never write user-facing strings — labels belong
   to the page's markup (`data-ck-label-*` hooks where a swap is needed).
2. Logical properties are mandatory for anything direction-sensitive; the
   i18n contract rejects physical directional properties in `src/`.
3. Locale sensitivity comes from the document: `lang` and `dir` are the
   page's responsibility. Enhance modules read
   `document.documentElement.lang` for locale-sensitive operations instead of
   assuming a locale.
4. Script support is layered: Aleo remains the default Latin face
   (ADR 0011); non-Latin scripts use the documented `--ck-font-sans`
   override pattern, and no font binary enters the core distribution.

## Consequences

- `tests/i18n-contract.sh` guards rules 1–3 and runs in
  `npm run test:contracts`.
- The Playwright matrix renders RTL Arabic and CJK documents per engine and
  asserts inline-start ordering and zero horizontal overflow.
- New components must pass the i18n contract; the breadcrumb separator ships
  as `--ck-breadcrumb-separator` and is documented on the public catalog.
- `enhance/forms.js` only swaps toggle text when both
  `data-ck-label-show` and `data-ck-label-hide` are present.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-21.
