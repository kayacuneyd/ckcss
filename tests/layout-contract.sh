#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

test -f "$project_dir/src/layout.css"
test -f "$project_dir/examples/layout.html"

for selector in ck-container ck-stack ck-cluster ck-grid ck-sidebar; do
  grep -q -- ".$selector" "$project_dir/src/layout.css"
done

grep -q -- 'float:' "$project_dir/src/layout.css" && exit 1 || true
grep -q -- '!important' "$project_dir/src/layout.css" && exit 1 || true
grep -q -- '@layer ck-layout' "$project_dir/src/layout.css"
grep -q -- '@import url("./layout.css")' "$project_dir/src/ckcss.css"

"$project_dir/scripts/build-foundation.sh"
grep -q -- '.ck-container' "$project_dir/dist/ckcss.css"
grep -q -- '.ck-sidebar' "$project_dir/dist/ckcss.css"

printf '%s\n' 'Layout contract passed'
