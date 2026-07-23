# ADR 0019: Raise the core size budget from 24576 to 26624 bytes

## Context

`tests/components-contract.sh` enforced `dist/ckcss.min.css <= 24576` bytes (24 KiB),
and the bundle was already within 3 bytes of that ceiling before this change. A
Bootstrap-parity architecture review (see ADR 0017, ADR 0018, and the review that
produced them) fixed several real defects that necessarily add bytes — a missing
`fieldset`/`legend`/`hr` reset, a low-contrast focus ring on the switch component, a
token-contract violation (raw hex literals in dark-theme tokens), a dead z-index
token, and a `display: revert` bug in the responsive visibility utilities — plus
added genuinely missing component API surface requested by the review: button/input
`sm`/`lg` size variants and `success`/`warning`/`info` button color variants (the
existing semantic color tokens had no corresponding button variant and no
contrast-safe fill to use for one).

Non-essential additions (a print stylesheet, hover-darken transitions on the three
new button variants, and per-variant `on-success`/`on-warning`/`on-info` tokens that
turned out to resolve identically to the existing `--ck-color-on-primary`) were cut
during implementation specifically to minimize the budget impact before concluding a
budget change was necessary.

## Decision

Raise the enforced budget in `tests/components-contract.sh` to 26624 bytes (26 KiB),
sized to the bundle after the fixes above (~25.7 KB) plus a small margin, rather than
degrade correctness fixes or drop the requested component variants to stay under a
budget calibrated to the pre-fix feature set.

## Consequences

- The budget still has a deliberately small margin — it is not a blank check for
  future additions; new component/utility surface should keep favoring reused
  semantic tokens (as `--ck-color-on-primary` reuse in this change did) over new
  tokens where the resolved value would be identical.
- Any future addition that grows the bundle further must again either fit the
  existing margin or justify a further budget ADR.

Owner: Cüneyt Kaya <https://kayacuneyt.com>. Date: 2026-07-23.
