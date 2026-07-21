# CKCSS product architecture

CKCSS is distributed as three intentionally separate layers:

```text
CKCSS Core     reset, tokens, typography, layout and semantic components
CKCSS UI Kit   copyable HTML/CSS page and section patterns
CKCSS Enhance  optional, independent JavaScript behavior modules
```

The default entry point remains `dist/ckcss.min.css`. Modular CSS entry points
are available under `dist/modules/` and always include the dependencies required
for that entry point. Consumers never need a build step.

## Module rules

- Core components use semantic tokens, never primitive palette values.
- CSS modules are additive; loading one module must not require JavaScript.
- Enhance modules are independent ES modules with no shared runtime.
- A missing Enhance module may remove enhanced behavior, but never the content or
  basic link/form path.
- All state communication uses native attributes such as `aria-expanded`,
  `aria-current`, and documented `data-ck-*` hooks.
- Every module has a contract test and a copyable HTML example.
