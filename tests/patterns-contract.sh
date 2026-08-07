#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
page="$project_dir/site/patterns.html"

test -f "$page"
grep -q 'href="/assets/ckcss.min.css"' "$page"
grep -q 'rel="canonical"' "$page"
grep -q 'class="ck-grid ck-grid--3"' "$page"
grep -q 'class="ck-sidebar' "$page"
grep -q 'class="ck-card"' "$page"
grep -q 'class="ck-alert ck-alert--success"' "$page"
grep -q 'class="ck-skip-link"' "$page"
grep -q 'ckcss-catalog-nav' "$page"
grep -q 'href="/patterns/marketing/hero.html"' "$page"
grep -q 'href="/patterns/ecommerce/product-card.html"' "$page"
grep -q 'src="/assets/gallery.js"' "$page"
test "$(grep -c '<script' "$page")" -eq 1
grep -q 'https://ckcss.digitaltamam.com/patterns.html' "$project_dir/site/sitemap.xml"
for pattern in pricing contact; do
  test -f "$project_dir/site/$pattern.html"
  grep -q "href=\"/assets/ckcss.min.css\"" "$project_dir/site/$pattern.html"
  grep -q "rel=\"canonical\"" "$project_dir/site/$pattern.html"
  grep -q '<script' "$project_dir/site/$pattern.html" && exit 1 || true
  grep -q "https://ckcss.digitaltamam.com/$pattern.html" "$project_dir/site/sitemap.xml"
done

test -f "$project_dir/site/variants.html"
grep -q 'href="/assets/ckcss.min.css"' "$project_dir/site/variants.html"
grep -q 'rel="canonical"' "$project_dir/site/variants.html"
grep -q '<script' "$project_dir/site/variants.html" && exit 1 || true
for page_name in interactions mobile-navigation themes sources 404 500 maintenance; do
  test -f "$project_dir/site/$page_name.html"
done
test -f "$project_dir/site/modular.html"
test -f "$project_dir/site/enhance.html"
test -f "$project_dir/site/navigation-enhance.html"
test -f "$project_dir/site/css-lab.html"

for page_name in product-patterns marketing-patterns states; do
  test -f "$project_dir/site/$page_name.html"
  grep -q 'href="/assets/ckcss.min.css"' "$project_dir/site/$page_name.html"
  grep -q 'rel="canonical"' "$project_dir/site/$page_name.html"
  grep -q '<script' "$project_dir/site/$page_name.html" && exit 1 || true
done

for pattern in app-shell data-management auth; do
  test -f "$project_dir/site/$pattern.html"
  grep -q 'href="/assets/ckcss.min.css"' "$project_dir/site/$pattern.html"
  grep -q 'rel="canonical"' "$project_dir/site/$pattern.html"
  grep -q '<script' "$project_dir/site/$pattern.html" && exit 1 || true
  grep -q "https://ckcss.digitaltamam.com/$pattern.html" "$project_dir/site/sitemap.xml"
done

test -f "$project_dir/site/guide.html"
grep -q 'https://ckcss.digitaltamam.com/guide.html' "$project_dir/site/sitemap.xml"

printf '%s\n' 'Patterns contract passed.'
