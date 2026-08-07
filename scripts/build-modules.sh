#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
dist_dir="$project_dir/dist/modules"
mkdir -p "$dist_dir"

. "$project_dir/scripts/breakpoints.sh"

emit() {
  name=$1
  shift
  output="$dist_dir/ckcss-$name.css"
  : > "$output"
  printf '%s\n' "/*! CKCSS v0.1.0-rc.2 | $name entry */" >> "$output"
  printf '%s\n' '@layer ck-reset, ck-tokens, ck-base, ck-layout, ck-components, ck-utilities;' >> "$output"
  for source in "$@"; do
    cat "$project_dir/src/$source" >> "$output"
    printf '\n' >> "$output"
  done
  sed -i '${/^$/d;}' "$output"
  ck_expand_breakpoints "$output"
  python3 "$project_dir/scripts/minify-css.py" "$output" "$dist_dir/ckcss-$name.min.css"
}

emit core reset.css tokens.css base.css
emit layout reset.css tokens.css base.css layout.css
emit components reset.css tokens.css base.css layout.css components.css utilities.css print.css
emit forms reset.css tokens.css base.css layout.css components.css utilities.css print.css
emit navigation reset.css tokens.css base.css layout.css components.css utilities.css print.css
emit data reset.css tokens.css base.css layout.css components.css utilities.css print.css

printf '%s\n' 'Built modular CKCSS entry points.'
