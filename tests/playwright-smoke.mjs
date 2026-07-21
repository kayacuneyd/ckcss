import { chromium, firefox, webkit } from 'playwright';
import { mkdir } from 'node:fs/promises';

const baseUrl = process.env.CKCSS_SMOKE_BASE_URL || 'http://127.0.0.1:8092';
const routes = ['/', '/guide.html', '/docs.html', '/components.html', '/tokens.html', '/patterns.html'];
const viewports = [
  { width: 390, height: 844 },
  { width: 768, height: 1024 },
  { width: 1440, height: 1200 }
];
// ADR 0015: every engine must render RTL and non-Latin documents without
// horizontal overflow, with logical-property ordering intact.
const i18nCases = [
  {
    name: 'rtl-ar',
    sidebar: true,
    html: '<!doctype html><html dir="rtl" lang="ar"><head><meta charset="utf-8"><link rel="stylesheet" href="/assets/ckcss.min.css"><title>RTL smoke</title></head><body><div class="ck-container ck-stack"><nav class="ck-breadcrumb" aria-label="breadcrumb"><ol><li><a href="#">الرئيسية</a></li><li><a href="#">المكتبة</a></li><li>البيانات</li></ol></nav><div class="ck-sidebar"><aside data-test-aside>الشريط الجانبي مع نص عربي طويل نسبياً للاختبار</aside><div data-test-main>المحتوى الرئيسي للصفحة مع فقرات ونصوص عربية</div></div></div></body></html>'
  },
  {
    name: 'cjk-long',
    sidebar: false,
    html: '<!doctype html><html lang="ja"><head><meta charset="utf-8"><link rel="stylesheet" href="/assets/ckcss.min.css"><title>CJK smoke</title></head><body><div class="ck-container ck-stack"><h1>見出しテキスト</h1><p>日本語の文章は空白なしで長く続きます。日本語の文章は空白なしで長く続きます。日本語の文章は空白なしで長く続きます。日本語の文章は空白なしで長く続きます。日本語の文章は空白なしで長く続きます。</p><div class="ck-cluster"><button class="ck-button">保存</button><button class="ck-button ck-button--secondary">取消</button></div></div></body></html>'
  }
];
const engines = { chromium, firefox, webkit };

await mkdir('test-results/browser', { recursive: true });

for (const [name, engine] of Object.entries(engines)) {
  const browser = await engine.launch();
  try {
    for (const viewport of viewports) {
      const page = await browser.newPage({ viewport });
      for (const route of routes) {
        const response = await page.goto(`${baseUrl}${route}`, { waitUntil: 'networkidle' });
        if (!response?.ok()) throw new Error(`${name} ${route}: HTTP ${response?.status()}`);
        const result = await page.evaluate(() => ({
          title: document.title,
          canonical: document.querySelector('link[rel="canonical"]')?.getAttribute('href'),
          scrollWidth: document.documentElement.scrollWidth,
          clientWidth: document.documentElement.clientWidth
        }));
        if (!result.title || !result.canonical) throw new Error(`${name} ${route}: missing title or canonical`);
        if (result.scrollWidth > result.clientWidth) {
          throw new Error(`${name} ${route} ${viewport.width}px: horizontal overflow ${result.scrollWidth}/${result.clientWidth}`);
        }
      }
      for (const testCase of i18nCases) {
        await page.setContent(testCase.html, { baseURL: baseUrl, waitUntil: 'networkidle' });
        const widths = await page.evaluate(() => ({
          scroll: document.documentElement.scrollWidth,
          client: document.documentElement.clientWidth
        }));
        if (widths.scroll > widths.client) {
          throw new Error(`${name} i18n ${testCase.name} ${viewport.width}px: horizontal overflow ${widths.scroll}/${widths.client}`);
        }
        if (testCase.sidebar && viewport.width >= 768) {
          const order = await page.evaluate(() => ({
            asideX: Math.round(document.querySelector('[data-test-aside]').getBoundingClientRect().x),
            mainX: Math.round(document.querySelector('[data-test-main]').getBoundingClientRect().x)
          }));
          if (order.asideX <= order.mainX) {
            throw new Error(`${name} i18n rtl-sidebar ${viewport.width}px: aside must sit at inline-start (right in RTL), got aside.x=${order.asideX} main.x=${order.mainX}`);
          }
        }
      }
      await page.goto(`${baseUrl}/components.html`, { waitUntil: 'networkidle' });
      await page.screenshot({ path: `test-results/browser/components-${name}-${viewport.width}.png`, fullPage: true });
      console.log(`${name} ${viewport.width}x${viewport.height}: ${routes.length} routes + ${i18nCases.length} i18n cases passed`);
      await page.close();
    }
  } finally {
    await browser.close();
  }
}
