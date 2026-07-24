#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
mkdir -p "$project_dir/dist"

. "$project_dir/scripts/breakpoints.sh"

{
  printf '%s\n' '/*! CKCSS v0.1.0-beta.3 | Foundation, layout, essential components and helpers */'
  printf '%s\n' '@layer ck-reset, ck-tokens, ck-base, ck-layout, ck-components, ck-utilities;'
  printf '\n'
  cat "$project_dir/src/reset.css"
  printf '\n'
  cat "$project_dir/src/tokens.css"
  printf '\n'
  cat "$project_dir/src/base.css"
  printf '\n'
  cat "$project_dir/src/layout.css"
  printf '\n'
  cat "$project_dir/src/components.css"
  printf '\n'
  cat "$project_dir/src/utilities.css"
} > "$project_dir/dist/ckcss.css"

ck_expand_breakpoints "$project_dir/dist/ckcss.css"
python3 "$project_dir/scripts/minify-css.py" "$project_dir/dist/ckcss.css" "$project_dir/dist/ckcss.min.css"

printf '%s\n' 'Built dist/ckcss.css and dist/ckcss.min.css'
