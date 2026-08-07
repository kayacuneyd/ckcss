#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

for path in src/components.css examples/components.html docs/product/components.md; do
  test -f "$project_dir/$path"
done

for selector in ck-button ck-card ck-badge ck-alert ck-field ck-input ck-select ck-textarea ck-choice ck-switch ck-table ck-table-wrap ck-disclosure ck-skeleton ck-breadcrumb ck-tabs ck-pagination ck-stepper ck-timeline ck-avatar ck-progress ck-nav ck-dialog ck-fieldset ck-form-grid ck-search ck-file ck-range ck-toast ck-banner ck-empty-state ck-stat ck-list ck-description-list ck-accordion ck-icon ck-form-error-summary; do
  grep -q -- ".$selector" "$project_dir/src/components.css"
done

grep -q -- 'aria-invalid="true"' "$project_dir/src/components.css"
grep -q -- ':focus-visible' "$project_dir/src/base.css"
grep -q -- 'aria-pressed="true"' "$project_dir/src/components.css"
grep -q -- 'data-ck-state="invalid"' "$project_dir/src/components.css"
grep -q -- 'data-ck-state="selected"' "$project_dir/src/components.css"
grep -q -- 'data-ck-state="dismissed"' "$project_dir/src/components.css"
grep -q -- 'aria-live="polite"' "$project_dir/src/components.css"
grep -q -- 'method="dialog"' "$project_dir/examples/components.html"
grep -q -- 'popover' "$project_dir/src/components.css"
grep -q -- '!important' "$project_dir/src/components.css" && exit 1 || true
grep -q -- '^\.[a-z]' "$project_dir/src/components.css" | grep -v '^\.ck-' && exit 1 || true

"$project_dir/scripts/build-foundation.sh"
test -s "$project_dir/dist/ckcss.min.css"
# Budget raised for industry-standard utilities (ADR 0021).
test "$(wc -c < "$project_dir/dist/ckcss.min.css")" -le 65536
grep -q -- '.ck-button' "$project_dir/dist/ckcss.css"
grep -q -- '.ck-table-wrap' "$project_dir/dist/ckcss.min.css"

printf '%s\n' 'Components contract passed'
