#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

for path in src/reset.css src/tokens.css src/base.css src/ckcss.css src/utilities.css examples/foundation.html; do
  test -f "$project_dir/$path"
done

grep -q -- '--ck-color-primary' "$project_dir/src/tokens.css"
grep -q -- 'data-ck-theme="dark"' "$project_dir/src/tokens.css"
grep -q -- ':focus-visible' "$project_dir/src/base.css"
grep -q -- 'prefers-reduced-motion' "$project_dir/src/base.css"
grep -q -- 'Ordinary flow gets semantic rhythm' "$project_dir/src/base.css"
grep -q -- '@layer ck-reset, ck-tokens, ck-base, ck-layout, ck-components, ck-utilities' "$project_dir/src/ckcss.css"
grep -q -- 'ck-visually-hidden' "$project_dir/src/utilities.css"
grep -q -- 'ck-query-container' "$project_dir/src/utilities.css"
test -f "$project_dir/scripts/build-modules.sh"
grep -q -- 'ck-font-display' "$project_dir/src/tokens.css"
grep -q -- 'ck-palette-coral-500' "$project_dir/src/tokens.css"

"$project_dir/scripts/build-foundation.sh"
"$project_dir/scripts/build-modules.sh"
test -s "$project_dir/dist/ckcss.css"
test -s "$project_dir/dist/ckcss.min.css"
grep -q -- '--ck-color-primary' "$project_dir/dist/ckcss.css"
grep -q -- ':focus-visible' "$project_dir/dist/ckcss.css"
test -s "$project_dir/dist/modules/ckcss-core.min.css"
test -s "$project_dir/dist/modules/ckcss-layout.min.css"

printf '%s\n' 'Foundation contract passed'
