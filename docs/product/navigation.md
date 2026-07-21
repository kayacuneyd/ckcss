# CKCSS navigation contract

CKCSS provides two intentional navigation recipes:

1. Native: `<details>` plus semantic `<nav>`, with no JavaScript.
2. Enhanced: `navigation.js` plus `data-ck-menu-toggle`, `data-ck-menu`,
   `aria-controls`, and `aria-expanded`.

The enhanced recipe is optional. Without its module, navigation content remains
visible and links remain usable. The module owns only toggle state, Escape, and
focus return; layout and visual states remain CSS-owned.
