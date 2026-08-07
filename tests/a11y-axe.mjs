import { chromium, firefox, webkit } from "playwright";
import AxeBuilder from "@axe-core/playwright";
import { createStaticServer, listen } from "./lib/static-server.mjs";

const engines = { chromium, firefox, webkit };
const routes = [
  "/tests/fixtures/quality-kit.html",
  "/examples/components.html",
  "/examples/utilities.html",
  "/examples/foundation.html",
  "/examples/layout.html",
];

// WCAG 2.2 AA tags; color-contrast covered separately by token-contrast.mjs
// but still included here for rendered component states.
const tags = ["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "wcag22aa"];

const server = createStaticServer();
const baseUrl = await listen(server);
const failures = [];

try {
  for (const [name, engine] of Object.entries(engines)) {
    const browser = await engine.launch();
    try {
      const context = await browser.newContext({ viewport: { width: 1280, height: 900 } });
      const page = await context.newPage();
      for (const route of routes) {
        const response = await page.goto(`${baseUrl}${route}`, { waitUntil: "networkidle" });
        if (!response?.ok()) {
          failures.push(`${name} ${route}: HTTP ${response?.status()}`);
          continue;
        }
        const results = await new AxeBuilder({ page }).withTags(tags).analyze();
        for (const v of results.violations) {
          const nodes = v.nodes
            .slice(0, 3)
            .map((n) => n.target.join(" "))
            .join("; ");
          failures.push(
            `${name} ${route}: [${v.impact}] ${v.id} — ${v.help} (${v.nodes.length}) @ ${nodes}`,
          );
        }
        console.log(
          `${name} ${route}: ${results.violations.length} violations, ${results.passes.length} passes`,
        );
      }
      await context.close();
    } finally {
      await browser.close();
    }
  }
} finally {
  server.close();
}

if (failures.length) {
  console.error("\nA11y failures:");
  for (const line of failures) console.error(`- ${line}`);
  process.exit(1);
}

console.log("A11y axe contract passed.");
