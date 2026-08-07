import { chromium } from "playwright";
import { mkdir, readFile, writeFile, access } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { PNG } from "pngjs";
import pixelmatch from "pixelmatch";
import { createStaticServer, listen } from "./lib/static-server.mjs";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const baselineDir = path.join(root, "tests/visual/baselines");
const outputDir = path.join(root, "test-results/visual");
const update = process.env.UPDATE_VISUAL_BASELINES === "1";
// Allow tiny AA/subpixel noise across OS font stacks.
const maxDiffRatio = Number(process.env.CKCSS_VISUAL_MAX_DIFF || "0.012");

const viewports = [
  { name: "390", width: 390, height: 844 },
  { name: "768", width: 768, height: 1024 },
  { name: "1440", width: 1440, height: 900 },
];

const scenarios = [
  { name: "light", path: "/tests/fixtures/quality-kit.html", theme: "light", dir: "ltr", lang: "en" },
  { name: "dark", path: "/tests/fixtures/quality-kit.html", theme: "dark", dir: "ltr", lang: "en" },
  { name: "rtl", path: "/tests/fixtures/quality-kit.html", theme: "light", dir: "rtl", lang: "ar" },
];

async function exists(p) {
  try {
    await access(p);
    return true;
  } catch {
    return false;
  }
}

function readPng(buf) {
  return PNG.sync.read(buf);
}

function diffRatio(aBuf, bBuf) {
  const imgA = readPng(aBuf);
  const imgB = readPng(bBuf);
  if (imgA.width !== imgB.width || imgA.height !== imgB.height) {
    return {
      ratio: 1,
      detail: `size ${imgA.width}x${imgA.height} vs ${imgB.width}x${imgB.height}`,
      diffBuf: null,
    };
  }
  const diff = new PNG({ width: imgA.width, height: imgA.height });
  const mismatched = pixelmatch(imgA.data, imgB.data, diff.data, imgA.width, imgA.height, {
    threshold: 0.12,
    includeAA: true,
  });
  const total = imgA.width * imgA.height;
  return {
    ratio: mismatched / total,
    detail: `${mismatched}/${total} px`,
    diffBuf: PNG.sync.write(diff),
  };
}

await mkdir(baselineDir, { recursive: true });
await mkdir(outputDir, { recursive: true });

const server = createStaticServer();
const baseUrl = await listen(server);
const failures = [];

try {
  const browser = await chromium.launch();
  try {
    for (const viewport of viewports) {
      for (const scenario of scenarios) {
        const page = await browser.newPage({
          viewport: { width: viewport.width, height: viewport.height },
          colorScheme: scenario.theme === "dark" ? "dark" : "light",
        });
        const response = await page.goto(`${baseUrl}${scenario.path}`, {
          waitUntil: "networkidle",
        });
        if (!response?.ok()) {
          failures.push(`${scenario.name}@${viewport.name}: HTTP ${response?.status()}`);
          await page.close();
          continue;
        }
        await page.evaluate(
          ({ theme, dir, lang }) => {
            document.documentElement.setAttribute("data-ck-theme", theme);
            document.documentElement.setAttribute("data-theme", theme);
            document.documentElement.setAttribute("dir", dir);
            document.documentElement.setAttribute("lang", lang);
            document.documentElement.style.colorScheme = theme;
          },
          scenario,
        );
        // Stabilize fonts/layout before capture.
        await page.waitForTimeout(120);
        const shotName = `quality-${scenario.name}-${viewport.name}.png`;
        const actualPath = path.join(outputDir, shotName);
        const baselinePath = path.join(baselineDir, shotName);
        const buffer = await page.screenshot({ fullPage: true, animations: "disabled" });
        await writeFile(actualPath, buffer);

        if (update || !(await exists(baselinePath))) {
          await writeFile(baselinePath, buffer);
          console.log(`${update ? "updated" : "created"} baseline ${shotName}`);
        } else {
          const baseline = await readFile(baselinePath);
          const { ratio, detail, diffBuf } = diffRatio(baseline, buffer);
          if (ratio > maxDiffRatio) {
            const diffPath = path.join(outputDir, shotName.replace(".png", ".diff.png"));
            if (diffBuf) await writeFile(diffPath, diffBuf);
            failures.push(
              `${shotName}: diff ${detail} ratio=${ratio.toFixed(4)} > ${maxDiffRatio}`,
            );
          } else {
            console.log(`ok ${shotName} (${detail}, ratio=${ratio.toFixed(4)})`);
          }
        }

        // RTL structural check at mid/desktop widths.
        if (scenario.dir === "rtl" && viewport.width >= 768) {
          const overflow = await page.evaluate(() => ({
            scroll: document.documentElement.scrollWidth,
            client: document.documentElement.clientWidth,
          }));
          if (overflow.scroll > overflow.client) {
            failures.push(
              `rtl@${viewport.name}: horizontal overflow ${overflow.scroll}/${overflow.client}`,
            );
          }
        }
        await page.close();
      }
    }
  } finally {
    await browser.close();
  }
} finally {
  server.close();
}

if (failures.length) {
  console.error("\nVisual regression failures:");
  for (const line of failures) console.error(`- ${line}`);
  console.error("Rebaseline with: UPDATE_VISUAL_BASELINES=1 npm run test:visual");
  process.exit(1);
}

console.log("Visual regression contract passed.");
