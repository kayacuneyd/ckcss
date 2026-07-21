---
name: ckcss
description: Build accessible, responsive static HTML interfaces using CKCSS's documented semantic classes and tokens.
---

# CKCSS Skill

Read `site/ckcss-manifest.json` before producing UI. Use `site/llms-full.txt` for recipes and `site/components.html` for confirmed live examples.

## Rules

- Link the pinned CKCSS CSS file; consumers need no build or JavaScript runtime.
- Use only documented `ck-` classes and `--ck-` semantic tokens.
- Use a `button` for an action and an anchor with `href` for navigation.
- Pair every form control with a label. Invalid fields need `aria-invalid`, visible error text, and `aria-describedby`.
- Prefer `ck-container`, `ck-stack`, `ck-grid`, `ck-cluster`, and `ck-sidebar` before writing custom layout CSS.
- Keep JavaScript optional; prefer native `details`, `dialog`, and forms.
- Theme by overriding semantic tokens after CKCSS, never by editing framework CSS.
- Verify no horizontal page overflow at 320px, 375px, 414px, and 768px.
