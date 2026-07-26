#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
page="$project_dir/site/components.html"

test -f "$page"
grep -q 'href="/assets/ckcss.min.css"' "$page"
grep -q 'rel="canonical" href="https://ckcss.digitaltamam.com/components.html"' "$page"
grep -q 'class="ck-button"' "$page"
grep -q 'class="ck-card"' "$page"
grep -q 'class="ck-input"' "$page"
grep -q 'class="ck-table"' "$page"
grep -q 'aria-invalid="true"' "$page"
grep -q 'class="ckcss-example-code"' "$page"
grep -q 'class="ckcss-code-block"' "$page"
grep -q 'CKCSS bileşenlerini canlı önizleme' "$page"
grep -q -- '--ck-space-4:' "$page"
grep -q -- '--ck-radius-md:' "$page"
grep -q -- '--ck-radius-pill:' "$page"
grep -q -- 'ck-visually-hidden' "$page"
grep -q -- 'ck-query-container' "$page"
grep -q -- 'aria-pressed' "$page"
grep -q 'https://ckcss.digitaltamam.com/components.html' "$project_dir/site/sitemap.xml"
grep -q 'href="/tokens.html"' "$page"
grep -q 'ck-choice' "$page"
grep -q 'ck-switch' "$page"
grep -q 'ck-nav' "$page"
grep -q 'ck-dialog' "$page"
test -f "$project_dir/site/download.html"
test -f "$project_dir/site/ai.html"
test -f "$project_dir/site/llms.txt"
test -f "$project_dir/site/llms-full.txt"
test -f "$project_dir/site/ckcss-manifest.json"
grep -q 'rel="canonical" href="https://ckcss.digitaltamam.com/download.html"' "$project_dir/site/download.html"
grep -q 'https://ckcss.digitaltamam.com/download.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/ai.html' "$project_dir/site/sitemap.xml"
grep -q 'https://cdn.jsdelivr.net/gh/kayacuneyd/ckcss@v0.1.0-rc.1/dist/ckcss.min.css' "$project_dir/site/ckcss-manifest.json"
grep -q 'Use only documented `ck-` classes' "$project_dir/site/llms.txt"
grep -q 'https://ckcss.digitaltamam.com/tokens.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/patterns.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/pricing.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/contact.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/guide.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/docs.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/product-patterns.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/marketing-patterns.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/themes.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/enhance.html' "$project_dir/site/sitemap.xml"
for page_name in states variants interactions mobile-navigation sources modular navigation-enhance css-lab; do
  if grep -q "https://ckcss.digitaltamam.com/$page_name.html" "$project_dir/site/sitemap.xml"; then
    printf '%s\n' "Auxiliary route must not be in sitemap: $page_name.html" >&2
    exit 1
  fi
done
grep -q 'src="/assets/enhance/source.js"' "$page"
test -f "$project_dir/enhance/source.js"

printf '%s\n' 'Catalog contract passed.'
