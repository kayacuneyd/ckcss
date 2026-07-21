#!/usr/bin/env sh

set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

# 1. Core CSS must use logical properties only; physical directional
#    properties break RTL documents (ADR 0015).
if grep -rnE '(margin|padding|border)-(left|right)|text-align:[[:space:]]*(left|right)|float:[[:space:]]*(left|right)|(^|[;{[:space:]])(left|right)[[:space:]]*:' "$project_dir/src"; then
  printf '%s\n' 'i18n contract failed: physical directional property in src/' >&2
  exit 1
fi

# 2. Enhance modules never inject user-facing strings. The only permitted
#    textContent write is the guarded data-ck-label-* swap in forms.js.
if grep -rnE '(innerHTML|innerText)[[:space:]]*=' "$project_dir/enhance"; then
  printf '%s\n' 'i18n contract failed: string injection in enhance/' >&2
  exit 1
fi
if grep -rnE 'textContent[[:space:]]*=' "$project_dir/enhance" | grep -vF 'textContent = visible ? showLabel : hideLabel'; then
  printf '%s\n' 'i18n contract failed: unguarded textContent write in enhance/' >&2
  exit 1
fi

# 3. Positive checks: label hooks, document-locale case folding, and the
#    localizable breadcrumb separator wired through source, demo, and catalog.
grep -q 'data-ck-label-show' "$project_dir/enhance/forms.js"
grep -q 'data-ck-label-hide' "$project_dir/enhance/forms.js"
grep -q -- 'document.documentElement.lang' "$project_dir/enhance/table.js"
grep -q 'data-ck-label-show' "$project_dir/site/enhance.html"
grep -q -- '--ck-breadcrumb-separator' "$project_dir/src/tokens.css"
grep -q 'content: var(--ck-breadcrumb-separator)' "$project_dir/src/components.css"
grep -q -- '--ck-breadcrumb-separator' "$project_dir/site/tokens.html"
test -f "$project_dir/docs/decisions/0015-i18n-and-rtl-policy.md"

printf '%s\n' 'i18n contract passed.'
