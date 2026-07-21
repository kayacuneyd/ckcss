#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

for module in navigation theme dialog tabs forms table toast; do
  test -f "$project_dir/enhance/$module.js"
  grep -q -- 'data-ck-' "$project_dir/enhance/$module.js"
  grep -q -- 'import ' "$project_dir/enhance/$module.js" && exit 1 || true
done

grep -q -- 'aria-expanded' "$project_dir/enhance/navigation.js"
grep -q -- 'localStorage' "$project_dir/enhance/theme.js"
grep -q -- 'showModal' "$project_dir/enhance/dialog.js"
grep -q -- 'aria-selected' "$project_dir/enhance/tabs.js"
grep -q -- 'checkValidity' "$project_dir/enhance/forms.js"
grep -q -- 'data-ck-table-row' "$project_dir/enhance/table.js"
grep -q -- 'setTimeout' "$project_dir/enhance/toast.js"

printf '%s\n' 'Enhance contract passed.'
