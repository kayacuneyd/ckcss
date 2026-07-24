#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

find "$project_dir/site" -type f -name '*.html' -print | while IFS= read -r page; do
  grep -q 'class="ckcss-site-menu"' "$page"
  grep -q 'data-ckcss-site-footer' "$page"
  awk '/data-ckcss-shell/{header_line=NR} /<main/{main_line=NR} END { exit !(header_line && main_line && header_line < main_line) }' "$page"
  awk '/data-ckcss-site-footer/{footer_line=NR} /<\/body>/{body_line=NR} END { exit !(footer_line && body_line && footer_line < body_line) }' "$page"
done

find "$project_dir/site/patterns" -type f -name '*.html' -print | while IFS= read -r page; do
  grep -q 'ckcss-pattern-journey' "$page"
done

printf '%s\n' 'Site chrome contract passed.'
