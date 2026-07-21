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
grep -q 'https://ckcss.digitaltamam.com/tokens.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/patterns.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/pricing.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/contact.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/guide.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/docs.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/product-patterns.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/marketing-patterns.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/states.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/variants.html' "$project_dir/site/sitemap.xml"
for page_name in interactions mobile-navigation themes sources; do
  grep -q "https://ckcss.digitaltamam.com/$page_name.html" "$project_dir/site/sitemap.xml"
done
grep -q 'https://ckcss.digitaltamam.com/modular.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/enhance.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/navigation-enhance.html' "$project_dir/site/sitemap.xml"
grep -q 'https://ckcss.digitaltamam.com/css-lab.html' "$project_dir/site/sitemap.xml"
grep -q '<script' "$page" && exit 1 || true

printf '%s\n' 'Catalog contract passed.'
