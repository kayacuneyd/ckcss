#!/usr/bin/env sh
# Single source of truth for CKCSS breakpoints, consumed by build-foundation.sh
# and build-modules.sh. Source files reference these as $ck-bp-* placeholders;
# consumers only ever see the expanded plain @media values below.

CK_BP_SM=40rem
CK_BP_MD=48rem
CK_BP_LG=64rem

# Expands $ck-bp-* placeholders in place, in the given file(s).
ck_expand_breakpoints() {
  for target in "$@"; do
    sed -i \
      -e "s/\$ck-bp-sm/$CK_BP_SM/g" \
      -e "s/\$ck-bp-md/$CK_BP_MD/g" \
      -e "s/\$ck-bp-lg/$CK_BP_LG/g" \
      "$target"
  done
}
