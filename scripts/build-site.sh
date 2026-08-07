#!/usr/bin/env sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
project_dir=$(CDPATH= cd -- "$script_dir/.." && pwd)

"$project_dir/scripts/build-foundation.sh"
"$project_dir/scripts/build-modules.sh"
mkdir -p "$project_dir/dist" "$project_dir/site/assets"
if test -f "$project_dir/src/icons/ckcss-icon-sprite.svg"; then
  cp "$project_dir/src/icons/ckcss-icon-sprite.svg" "$project_dir/dist/ckcss-icon-sprite.svg"
  cp "$project_dir/src/icons/ckcss-icon-sprite.svg" "$project_dir/site/assets/ckcss-icon-sprite.svg"
fi
cp "$project_dir/dist/ckcss.css" "$project_dir/site/assets/ckcss.css"
cp "$project_dir/dist/ckcss.min.css" "$project_dir/site/assets/ckcss.min.css"
mkdir -p "$project_dir/site/assets/modules"
cp "$project_dir/dist/modules/"* "$project_dir/site/assets/modules/"
mkdir -p "$project_dir/site/assets/enhance"
cp "$project_dir/enhance/"*.js "$project_dir/site/assets/enhance/"

printf '%s\n' 'Landing assets built.'
