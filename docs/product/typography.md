# CKCSS typography contract

Aleo remains the CKCSS display and body family by product decision. The system
still separates roles through size and line-height tokens:

- display: `--ck-line-display`
- heading: `--ck-line-heading`
- subheading: `--ck-line-subheading`
- body: `--ck-line-body`
- small: `--ck-line-small`

Headings use `clamp()` and readable character limits; body copy uses a longer
line-height and a `ch`-based measure where appropriate. Pattern pages must use
the same role tokens and may not introduce page-specific font sizes without an
ADR.
