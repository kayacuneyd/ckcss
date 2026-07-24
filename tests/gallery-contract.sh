#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
page="$project_dir/site/patterns.html"

test -f "$project_dir/site/assets/gallery.js"
grep -q 'src="/assets/gallery.js"' "$page"
grep -q 'ckcss-gallery-stats' "$page"
grep -q 'ckcss-catalog-grid' "$project_dir/site/index.html"
grep -q 'ckcss-catalog-controls' "$project_dir/site/assets/site.css"
grep -q 'URLSearchParams' "$project_dir/site/assets/gallery.js"

printf '%s\n' 'Gallery contract passed.'
