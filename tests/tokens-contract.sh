#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

test -f "$project_dir/src/tokens.css"
test -f "$project_dir/site/tokens.html"

for token in \
  --ck-color-surface-raised \
  --ck-color-primary-hover \
  --ck-color-primary-ring \
  --ck-color-backdrop \
  --ck-iznik-glaze \
  --ck-iznik-glaze-50 \
  --ck-iznik-glaze-950 \
  --ck-iznik-cobalt-50 \
  --ck-iznik-cobalt-500 \
  --ck-iznik-cobalt-950 \
  --ck-iznik-turquoise-50 \
  --ck-iznik-turquoise-500 \
  --ck-iznik-turquoise-950 \
  --ck-iznik-bole-50 \
  --ck-iznik-bole-500 \
  --ck-iznik-bole-950 \
  --ck-iznik-leaf-50 \
  --ck-iznik-leaf-950 \
  --ck-iznik-ochre-50 \
  --ck-iznik-ochre-950 \
  --ck-iznik-plum-50 \
  --ck-iznik-plum-950 \
  --ck-font-size-2xl \
  --ck-font-size-display \
  --ck-tracking-wide \
  --ck-shadow-lg \
  --ck-duration-standard \
  --ck-focus-ring-width \
  --ck-z-overlay; do
  grep -q -- "$token" "$project_dir/src/tokens.css"
done

grep -q 'href="/assets/ckcss.min.css"' "$project_dir/site/tokens.html"
grep -q 'rel="canonical"' "$project_dir/site/tokens.html"
grep -q -- '--ck-iznik-cobalt-500' "$project_dir/site/tokens.html"
grep -q -- '--ck-font-size-2xl' "$project_dir/site/tokens.html"
grep -q '<script' "$project_dir/site/tokens.html" && exit 1 || true

# Raw color literals belong in tokens.css only (ADR 0011); every other source
# file must consume semantic --ck-color-* tokens.
for src_file in "$project_dir"/src/*.css; do
  case "$src_file" in
    */tokens.css) continue ;;
  esac
  grep -qE '#[0-9a-fA-F]{3,8}|rgb\(' "$src_file" && exit 1 || true
done

# Breakpoint values are centralized in scripts/breakpoints.sh (ADR 0018); a
# literal min-width/max-width in an @media or @container condition means a
# source file bypassed the $ck-bp-sm/$ck-bp-md/$ck-bp-lg placeholder.
for src_file in "$project_dir"/src/*.css; do
  grep -qE '@(media|container)[^{]*\((min|max)-width:[[:space:]]*(40rem|48rem|64rem|640px|768px|1024px)\)' "$src_file" && exit 1 || true
done

printf '%s\n' 'Tokens contract passed.'
