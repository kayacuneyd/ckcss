#!/usr/bin/env sh
set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
page="$project_dir/site/index.html"

test -f "$project_dir/site/assets/ckcss.css"
test -f "$project_dir/site/assets/ckcss.min.css"
test -f "$project_dir/site/assets/site.css"
test -f "$project_dir/site/robots.txt"
test -f "$project_dir/site/sitemap.xml"
test -f "$project_dir/site/components.html"
test -f "$project_dir/site/tokens.html"
test -f "$project_dir/site/patterns.html"
test -f "$project_dir/site/pricing.html"
test -f "$project_dir/site/contact.html"
test -f "$project_dir/site/guide.html"
test -f "$project_dir/site/docs.html"

grep -q 'https://ckcss.digitaltamam.com/' "$page"
grep -q 'href="/assets/ckcss.min.css"' "$page"
grep -q 'class="ck-container ck-sidebar"' "$page"
grep -q 'class="ck-grid ck-grid--3"' "$page"
grep -q 'CKCSS; tek bir CSS dosyasıyla' "$page"
grep -q 'CANLI MINI SHOWCASE' "$page"
grep -q 'href="/components.html"' "$page"
grep -q 'href="/tokens.html"' "$page"
grep -q 'href="/docs.html"' "$page"
if grep -qi '<script' "$page"; then
  printf '%s\n' 'Landing must not require JavaScript.' >&2
  exit 1
fi

printf '%s\n' 'Landing contract passed.'
