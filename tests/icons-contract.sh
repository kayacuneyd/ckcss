#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

test -f "$project_dir/src/icons/ckcss-icon-sprite.svg"
test -f "$project_dir/src/icons/manifest.json"
test -f "$project_dir/dist/ckcss-icon-sprite.svg"

# Source and dist sprites must match.
cmp -s "$project_dir/src/icons/ckcss-icon-sprite.svg" "$project_dir/dist/ckcss-icon-sprite.svg"

count=$(grep -c 'id="ck-icon-' "$project_dir/src/icons/ckcss-icon-sprite.svg" || true)
test "$count" -ge 100

manifest_count=$(node -e "const m=require('./src/icons/manifest.json'); if(m.count!==m.icons.length) process.exit(2); process.stdout.write(String(m.count))" )
test "$manifest_count" -eq "$count"

# Component base class exists.
grep -q -- '.ck-icon' "$project_dir/src/components.css"

# No fill-only icons without currentColor stroke path contract: every symbol uses currentColor.
grep -q 'stroke="currentColor"' "$project_dir/src/icons/ckcss-icon-sprite.svg"
grep -q 'fill="currentColor"' "$project_dir/src/icons/ckcss-icon-sprite.svg" && exit 1 || true

printf '%s\n' "Icons contract passed ($count symbols)."
