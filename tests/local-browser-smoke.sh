#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
browser=$(command -v chromium || command -v chromium-browser || true)
browser_profile="/tmp/ckcss-chromium-smoke-$$"

if [ -z "$browser" ]; then
  printf '%s\n' 'Local browser smoke skipped: Chromium is not installed.'
  exit 0
fi

python3 -m http.server 8092 --directory "$project_dir/site" >/tmp/ckcss-browser-smoke.log 2>&1 &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null || true' EXIT
sleep 1

for viewport in 390,844 768,1024 1440,1200; do
  width=${viewport%,*}
  height=${viewport#*,}
  for route in / /download.html /guide.html /docs.html /components.html /tokens.html /patterns.html /pricing.html /contact.html /app-shell.html /data-management.html /auth.html /product-patterns.html /marketing-patterns.html /states.html /variants.html /interactions.html /mobile-navigation.html /themes.html /sources.html /modular.html /enhance.html /navigation-enhance.html /css-lab.html; do
    output=$(timeout 20s "$browser" --headless --no-sandbox --disable-gpu --disable-dev-shm-usage --no-first-run --no-default-browser-check --user-data-dir="$browser_profile-$width-$height" --hide-scrollbars --window-size="$width,$height" --dump-dom "http://127.0.0.1:8092$route" 2>/dev/null)
    printf '%s %sx%s %s\n' "$route" "$width" "$height" "$(printf '%s' "$output" | sed -n 's:.*<title>\(.*\)</title>.*:\1:p' | head -1)"
    test -n "$output"
    printf '%s' "$output" | grep -q '<html'
  done
done

printf '%s\n' 'Local browser smoke passed.'
