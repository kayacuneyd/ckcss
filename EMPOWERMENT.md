# CKCSS Endüstri Standardı Yol Haritası

**Kapsam:** CKCSS framework'ünü (DizgePHP/DizgeCMS'in presentation katmanı)
build-free, modern CSS, paylaşımlı token sistemi avantajlarını koruyarak
endüstri standartlarına (Tailwind, Bootstrap, Pico, Open Props) taşımak.

**Çıktı hedefi:** CKCSS 1.0.0 — "Endüstri standardı utility + component framework"

**Süre tahmini:** 8-12 hafta (1 geliştirici), 4-6 hafta (2-3 geliştirici paralel)

**Mimari karar:** CKCSS ayrı bir Git reposu, kendi release döngüsü ve
semver'i olacak. DizgeCMS kurulumu CKCSS'in yayınlanmış sürümünü (CDN veya
self-hosted) layout'unda referans eder. Framework-agnostic kalır.

---

## 1. Mevcut Durum Analizi

### 1.1 CKCSS v0.1.0-rc4 envanteri

- **Bundle:** `public/assets/ckcss.min.css` (tek satır, minified)
- **Sınıf sayısı:** 99 (`ck-*` prefix'li)
- **Token sayısı:** 201 (`--ck-*` ve `--ck-iznik-*`)
- **Cascade layer'ları:** 5 (`ck-reset`, `ck-tokens`, `ck-base`, `ck-layout`, `ck-components`, `ck-utilities`)
- **Breakpoint'ler:** 3 (40rem/640px, 48rem/768px, 64rem/1024px)
- **Modern CSS kullanımı:** `light-dark()`, `color-mix()`, `@layer`, container queries, `clamp()`, `:has()` YOK

### 1.2 Mevcut sınıf dağılımı

| Kategori | Sınıf sayısı | Örnekler |
|---|---|---|
| Layout/Grid | 19 | `ck-container`, `ck-stack`, `ck-cluster`, `ck-grid`, `ck-sidebar`, `ck-query-grid` |
| Display/Visibility | 16 | `ck-d-sm-block`, `ck-only-mobile`, `ck-hide-desktop`, `ck-truncate` |
| Form | 20 | `ck-field`, `ck-input`, `ck-choice`, `ck-switch`, `ck-field__label` |
| Components | 43 | `ck-button`, `ck-card`, `ck-alert`, `ck-dialog`, `ck-table`, `ck-timeline` |
| State/Feedback | 13 | `ck-alert--danger`, `ck-button--success` |
| Text/Typography | 4 | `ck-text-center`, `ck-text-muted` |
| **Utility (spacing/sizing/position)** | **0** | — |

### 1.3 Projede gerçek kullanım

Bizim KA Teknoloji projesinde (33 farklı `ck-*` class kullanılıyor):
- Layout: `ck-container`, `ck-stack`, `ck-grid`, `ck-grid--2`
- Form: `ck-field`, `ck-field__label`, `ck-field__help`, `ck-field__error`, `ck-input`, `ck-textarea`, `ck-select`, `ck-alert`, `ck-alert--danger`, `ck-button`
- Nav: `ck-breadcrumb`, `ck-skip-link`, `ck-text-center`
- Custom CSS'te ihtiyaç duyulan ama CKCSS'te olmayan: spacing (`kt-mb-2`, `kt-mt-3`), grid item (`kt-flex-wrap`), typography.

---

## 2. Endüstri Standartları Karşılaştırması

| Özellik | CKCSS v0.1.0 | Tailwind 4 | Bootstrap 5 | Pico.sh |
|---|---|---|---|---|
| Utility sınıflar | 0 | ~300 | ~190 | ~30 |
| Component sınıflar | 27 | ~80 | ~30 | ~15 |
| Design tokens | 201 (özel) | 320+ | 100+ | 30+ |
| Dark mode contract | ✗ | ✓ | ✓ | ✓ |
| Print stylesheet | ✗ | ✗ | ✓ | ✗ |
| RTL desteği | ✗ | ✓ | ✓ | ✓ |
| Icon set | ✗ | ✗ | ✓ (Bootstrap Icons) | ✗ |
| Form validation states | kısmi | ✓ | ✓ | ✓ |
| A11y baseline | kısmi | kısmi | ✓ | ✓ |
| Container queries | ✓ | ✓ | ✗ | ✓ |
| Cascade layers | ✓ | ✓ | ✗ | ✗ |
| Build gereksinimi | ✗ (avantaj) | ✓ | ✗ (SCSS) | ✗ (avantaj) |
| Bundle size | ~10KB | isteğe göre | ~30KB | ~10KB |
| **Avantaj** | Build-free, modern CSS, paylaşımlı token | Ecosystem, utility zenginliği | Olgunluk, dokümantasyon | Minimalist, semantic |

**Sonuç:** CKCSS'in **kültürel avantajı** var (build-free, modern CSS, paylaşımlı token) ama **kapsam açığı** büyük.

---

## 3. Tespit Edilen Eksiklikler (Detaylı)

### 3.1 Utility sınıflar yok (KRİTİK)

**Spacing (0 sınıf):** `m-0..m-8`, `mt-1..mt-8`, `mb-1..mb-8`, `mx-auto`, `my-1`, `p-0..p-8`, `pt-1..pt-8`, `px-0..px-8`, `gap-0..gap-8`

**Sizing (0 sınıf):** `w-full`, `w-auto`, `w-1/2`, `w-1/3`, `h-full`, `h-screen`, `min-h-screen`, `max-w-sm/md/lg/xl/full`, `min-w-0`, `min-w-full`

**Display (4 sınıf):** `d-block`, `d-flex`, `d-grid`, `d-none` yok. Sadece `.d-sm-*` varyantları var.

**Flex/Grid utilities (0 sınıf):** `flex`, `flex-col`, `flex-row`, `flex-wrap`, `flex-1`, `flex-auto`, `flex-none`, `justify-start`, `justify-end`, `justify-center`, `justify-between`, `justify-around`, `items-start`, `items-end`, `items-center`, `items-baseline`, `items-stretch`, `self-auto`, `self-start`, `self-end`, `self-center`, `self-stretch`, `order-1..12`, `order-first`, `order-last`, `order-none`, `grid-cols-1..12`, `grid-rows-1..6`

**Position (0 sınıf):** `position-static`, `position-relative`, `position-absolute`, `position-fixed`, `position-sticky`, `top-0`, `right-0`, `bottom-0`, `left-0`, `inset-0`

**Z-index utility (0 sınıf, sadece 5 token var):** `z-0`, `z-10`, `z-20`, `z-30`, `z-40`, `z-50`, `z-auto`

**Typography (3 sınıf):** `text-xs/sm/base/lg/xl/2xl/3xl/4xl`, `fw-normal/medium/semibold/bold`, `text-uppercase`, `text-lowercase`, `text-capitalize`, `lh-tight/snug/normal/relaxed`, `text-start`, `text-end`

**Border (0 sınıf):** `border`, `border-0`, `border-t/r/b/l`, `border-{color}`, `rounded`, `rounded-sm/md/lg/pill/circle/none`

**Effects (0 sınıf):** `shadow-sm/md/lg/none`, `opacity-0/25/50/75/100`, `cursor-pointer/not-allowed/wait`, `select-none/text/all`, `pointer-events-none/auto`, `overflow-hidden/auto/scroll/visible`, `transition`, `transition-fast/slow/none`, `animate-fade-in/slide-up/scale-in/spin/pulse/bounce`, `motion-safe:*`, `motion-reduce:*`

**Sonuç:** Tüm utility ihtiyaçları için custom CSS yazılıyor. Bizim projede 30+ utility class'ı custom yazıldı (`kt-mb-2`, `kt-mt-3`, `kt-flex`, `kt-gap-2` vs.).

### 3.2 Dark mode contract eksik

- `color-scheme: light dark` + `light-dark()` kullanılıyor ama **kullanıcı tetiklemeli tema değişimi** (light/dark toggle) için mekanizma yok
- `[data-theme="light"]` / `[data-theme="dark"]` selector contract'ı yok
- `prefers-color-scheme` desteği yok (`prefers-reduced-motion` var)
- `localStorage` kalıcılığı, `<meta name="color-scheme">` desteği yok

### 3.3 Accessibility katmanı yetersiz

- `:focus-visible` desteği minimal: 6 rule
- `prefers-contrast: more` desteği yok
- `prefers-reduced-motion` kapsamı sınırlı (sadece 1 keyframe — skeleton)
- ARIA pattern'leri zayıf: `aria-invalid` var ama `aria-required`, `aria-describedby` visual state'leri eksik
- `role="alert"` ve `role="status"` için visual state'ler eksik
- Skip link var ama screen-reader utility'leri minimal

### 3.4 Print stylesheet yok (KRİTİK)

`@media print` desteği hiç yok. Bizim projede kendi print stilimizi yazdık.

### 3.5 RTL desteği yok

- `dir="rtl"` veya `[dir="rtl"]` selector'ı yok
- Logical properties (`margin-inline`, `padding-block`) sadece container'da kullanılmış
- Uluslararası projeler için kritik eksik

### 3.6 Form component library yarım

**Var olanlar:** `ck-field`, `ck-input`, `ck-select`, `ck-textarea`, `ck-choice` (checkbox/radio), `ck-switch`

**Eksik olanlar:**
- `ck-fieldset`, `ck-legend` (grouped controls)
- `ck-file` (file upload — drag/drop, preview, progress)
- `ck-range` (slider with value display)
- `ck-color`, `ck-date`, `ck-time`, `ck-datetime-local` (styled native)
- `ck-search` (search input with icon)
- `ck-form-grid`, `ck-form-row`, `ck-form-group` (semantic form layout)
- `ck-choice-grid` (checkbox/radio grid)
- Validation: `ck-is-valid`, `ck-is-invalid`, `ck-is-pristine`, `ck-is-dirty`, `ck-is-touched`, `ck-is-submitting`
- Floating labels
- Multi-step form wizard
- Form-level error summary

### 3.7 Modern component eksikleri

Endüstri standartlarında olan ama CKCSS'te olmayan componentler:

- `ck-toast` / `ck-notification` (sadece `--ck-z-toast` token var, sınıf yok)
- `ck-tooltip` (sıfır)
- `ck-popover` (sıfır)
- `ck-accordion` (kısmi: `ck-disclosure` var ama accordion pattern'i yok)
- `ck-combobox` / `ck-autocomplete` (sıfır)
- `ck-datepicker` / `ck-calendar` (sıfır)
- `ck-tree-view` (sıfır)
- `ck-carousel` / `ck-slider` (sıfır)
- `ck-empty-state` (sıfır)
- `ck-stat` (sıfır)
- `ck-skeleton-text`, `ck-skeleton-circle` (minimal — sadece base)
- `ck-list`, `ck-description-list` (sıfır)

### 3.8 Animation/transition toolkit yok

- Sadece 2 transition declaration (background-color, transform)
- `ck-animate-fade-in`, `ck-animate-slide-up`, `ck-animate-scale-in` yok
- `ck-transition-{fast|base|slow}` (token var ama utility yok)
- `ck-motion-safe` / `ck-motion-reduce` yok
- Skeleton shimmer animation minimal

### 3.9 Z-index sistemi tutarsız

- `--ck-z-*` token'ları var (base/sticky/dropdown/overlay/toast) ama hiçbir component bunları kullanmıyor
- Her yer inline `z-index` değerleri
- `z-50`, `z-100` gibi utility class'lar yok
- `ck-modal`, `ck-drawer`, `ck-dropdown` z-index'leri hardcoded (50, 50, 50)

### 3.10 Icon sistemi yok

- 99 class'ta icon-related sınıf yok
- `ck-icon` veya `ck-icon-{name}` yok
- Bizim projede 15+ inline SVG icon kullandık (hero, contact, footer, vs.) — bunlar framework tarafından sağlanmalı

### 3.11 Documentation & tooling eksik

- Hiç design token reference sayfası yok
- Hiç component playground yok
- Hiç Storybook entegrasyonu yok
- Hiç class autocomplete (VS Code extension) yok
- Hiç Figma/design tokens JSON yok
- Hiç @apply / PostCSS plugin yok

### 3.12 Hover/Focus/Active state yönetimi

Her component kendi `:hover`, `:focus-visible`, `:active`, `[aria-expanded]`, `[aria-selected]`, `[aria-current]` state'lerini tanımlamalı. Global helper'lar yok:
- `.ck-is-active`
- `.ck-is-disabled`
- `.ck-is-loading`
- `.ck-is-selected`

### 3.13 Layer browser support riski

`@layer` tüm modern browser'larda destekleniyor (Chrome 99+, Firefox 97+, Safari 15.4+) ama CKCSS bunu **zorunlu kılıyor**. `@supports` fallback'leri yok.

---

## 4. Yol Haritası

### Faz 0: Altyapı ve Ölçüm (1 hafta) — P0

| Görev | Süre | Çıktı |
|---|---|---|
| Mevcut CKCSS bundle analizi (minified vs. expanded) | 1 gün | Build raporu |
| Test coverage baseline (hangi class nerede kullanılıyor) | 1 gün | Coverage raporu |
| `package.json` ve build pipeline kararı (build-free mi kalır?) | 2 gün | Build stratejisi belgesi |
| ADR: "CKCSS Endüstri Standardı Roadmap" | 1 gün | `docs/adr/0001-ckcss-roadmap.md` |
| Git repo oluşturma (ayrı repo kararı) | 0.5 gün | GitHub repo URL |
| Issue template + contributing guide | 0.5 gün | Repo dosyaları |

**Çıktı:** Ayrı GitHub repo, ADR, baseline test sonuçları.

### Faz 1: Core Utilities (2 hafta) — P0

Utility sınıfları ekle. Tailwind naming convention'ından ilham al ama CKCSS'in `ck-` prefix'ine ve cascade layer yapısına uy.

**1a. Spacing (3 gün)**
- `m-{0..8}`, `mt-{1..8}`, `mb-{1..8}`, `mx-{0..8}`, `my-{0..8}`, `ms-{0..8}`, `me-{0..8}`
- `p-{0..8}`, `pt-{1..8}`, `pb-{1..8}`, `px-{0..8}`, `py-{0..8}`, `ps-{0..8}`, `pe-{0..8}`
- `gap-{0..8}` (flex + grid için)
- CSS: `--ck-space-{n}` token'larına dayalı

**1b. Sizing (1 gün)**
- `w-full`, `w-auto`, `w-1/2`, `w-1/3`, `w-2/3`, `w-1/4`, `w-3/4`
- `h-full`, `h-auto`, `h-screen`, `min-h-screen`
- `max-w-sm/md/lg/xl/full`, `min-w-0`, `min-w-full`

**1c. Display & Visibility (2 gün)**
- `d-block`, `d-inline`, `d-inline-block`, `d-flex`, `d-inline-flex`, `d-grid`, `d-inline-grid`, `d-none`, `d-table`
- `d-sm-block`, `d-sm-flex`, `d-md-block`, `d-md-flex`, `d-lg-block`, `d-lg-flex`, `d-xl-block`, `d-xl-flex`
- `d-sm-none`, `d-md-none`, `d-lg-none`, `d-xl-none`
- `hide-mobile`/`hide-desktop` isimlendirmesi `d-{breakpoint}-none`'a standardize

**1d. Flex & Grid (2 gün)**
- `flex`, `flex-col`, `flex-row`, `flex-wrap`, `flex-nowrap`
- `flex-1`, `flex-auto`, `flex-initial`, `flex-none`
- `justify-start`, `justify-end`, `justify-center`, `justify-between`, `justify-around`, `justify-evenly`
- `items-start`, `items-end`, `items-center`, `items-baseline`, `items-stretch`
- `self-auto`, `self-start`, `self-end`, `self-center`, `self-stretch`
- `order-first`, `order-last`, `order-none`, `order-{1..12}`
- `grid-cols-{1..12}`, `grid-rows-{1..6}`

**1e. Position & Z-index (1 gün)**
- `position-static`, `position-relative`, `position-absolute`, `position-fixed`, `position-sticky`
- `top-0`, `right-0`, `bottom-0`, `left-0`, `inset-0`
- `z-0`, `z-10`, `z-20`, `z-30`, `z-40`, `z-50`, `z-auto` (`--ck-z-*` token'larına dayalı)

**1f. Typography (1 gün)**
- `text-xs`, `text-sm`, `text-base`, `text-lg`, `text-xl`, `text-2xl`, `text-3xl`, `text-4xl`
- `fw-normal`, `fw-medium`, `fw-semibold`, `fw-bold`
- `fst-italic`, `fst-normal`
- `text-uppercase`, `text-lowercase`, `text-capitalize`
- `lh-tight`, `lh-snug`, `lh-normal`, `lh-relaxed`
- `text-truncate` (var `ck-truncate`)

**1g. Border & Effects (1 gün)**
- `border`, `border-0`, `border-t/r/b/l`
- `border-{primary|success|danger|warning}`
- `rounded`, `rounded-sm/md/lg/pill/circle/none`
- `shadow-sm/md/lg/none`
- `opacity-{0|25|50|75|100}`
- `cursor-pointer/not-allowed/wait`
- `select-none/text/all`
- `pointer-events-none/auto`
- `overflow-hidden/auto/scroll/visible`
- `transition`, `transition-fast/slow/none`
- `animate-fade-in/slide-up/scale-in/spin/pulse/bounce`
- `motion-safe:*`, `motion-reduce:*`

**Çıktı:** `public/assets/ckcss.min.css` ~2-3KB büyür (yaklaşık 5-8KB toplam). Tüm utility'ler `ck-` prefix'li.

### Faz 2: Dark Mode ve Tema Sistemi (1 hafta) — P0

**2a. Theme Contract (2 gün)**
- `data-theme="light|dark|auto"` selector contract
- `prefers-color-scheme: dark` automatic detection
- `<meta name="color-scheme" content="light dark">` desteği
- `color-scheme` property override pattern

**2b. JS Helper (1 gün)**
- `ck-theme.js` (build-free, 1-2KB): tema değiştirme, localStorage, OS preference
- Flash prevention: `localStorage.theme` cookie/meta'dan okuma, HTML'ye `data-theme` set etme

**2c. Component Updates (2 gün)**
- Tüm component'lerde `[data-theme="light"]` override'ları
- `color-scheme` CSS property kullanımı (`light-dark()` ile)
- Standart `--ck-color-*` token'ları light/dark için

**Çıktı:** `ck-theme.js`, güncellenmiş tüm component stilleri, documentation.

### Faz 3: Accessibility ve Print (1 hafta) — P0

**3a. Focus Management (1 gün)**
- `.ck-focus-ring` kapsamı genişlet
- Tüm interaktif component'lere `:focus-visible` default
- `.ck-focus-trap` (modal/drawer için)

**3b. Print Stylesheet (1 gün)**
- `@media print` block (header/footer/nav gizle, içerik optimize)
- `.ck-no-print`, `.ck-print-only` utility
- Sayfa kenar boşlukları, font optimizasyonu, link URL'leri

**3c. A11y Utilities (2 gün)**
- `.ck-sr-only` (zaten `ck-visually-hidden` var)
- `.ck-not-sr-only`
- `.ck-focus:not(:focus):not(:active)`
- `aria-invalid`, `aria-required`, `aria-disabled` state'leri
- `prefers-contrast: more` desteği
- `prefers-reduced-motion: reduce` kapsamı genişlet
- `prefers-reduced-transparency` desteği

**3d. RTL Support (1 gün)**
- `[dir="rtl"]` selector contract
- Logical properties kullanımı (zaten `margin-inline` kullanılmış, genişlet)
- Component test'leri RTL'de

**Çıktı:** A11y-compliant framework, print-ready, RTL.

### Faz 4: Form Library Genişletme (1.5 hafta) — P0

**4a. Validation States (2 gün)**
- `.ck-is-valid`, `.ck-is-invalid` modifier'lar
- `aria-invalid="true"` ile visual state bağlantısı
- `.ck-form-error-summary` (form-level error display)

**4b. Yeni Form Componentler (3 gün)**
- `ck-file` (drag-drop, preview, progress)
- `ck-range` (slider with value display)
- `ck-color`, `ck-date`, `ck-time`, `ck-datetime-local` (styled native)
- `ck-search` (search input with icon)
- `ck-form-grid`, `ck-form-row`, `ck-form-group` (semantic form layout)
- `ck-fieldset`, `ck-legend` (grouped controls)
- `ck-choice-grid` (checkbox/radio grid layout)

**4c. Form Patterns (2 gün)**
- Floating labels (`.ck-floating-label`)
- Inline validation (`.ck-is-pristine/.ck-is-dirty/.ck-is-touched`)
- Multi-step form wizard (`ck-stepper` geliştirme)
- Form submission states: `.ck-is-submitting`, `.ck-is-success`, `.ck-is-error`

**Çıktı:** Zengin form component library.

### Faz 5: Yeni Componentler (2 hafta) — P1

**5a. Feedback Components (1 hafta)**
- `ck-toast` / `ck-notification` (köşeden açılan bildirimler)
- `ck-tooltip` (hover/focus ile görünen ipuçları)
- `ck-popover` (tıklanabilir açılan paneller)
- `ck-banner` (sayfa üstü uyarı bandları)
- `ck-snackbar` (kısa süreli bildirimler)

**5b. Data Display (1 hafta)**
- `ck-accordion` (genişletilebilir bölümler — `ck-disclosure`'ı geliştir)
- `ck-tree-view` (hiyerarşik liste)
- `ck-empty-state` (veri yok durumu)
- `ck-stat` (istatistik göstergesi)
- `ck-list` (styled unordered list)
- `ck-description-list` (dl/dt/dd stilleri)

**Çıktı:** 10+ yeni component.

### Faz 6: Icon Sistemi (1 hafta) — P1

**6a. SVG Icon Library (4 gün)**
- `ck-icon` base component (size, color)
- 50-100 temel icon: arrow, check, close, menu, search, user, settings, vs.
- SVG sprite system (`<ck-icon name="arrow-right" />` veya class-based)
- Lucide veya Heroicons seti ile uyumlu isimlendirme

**6b. CSS-Only Icons (2 gün)**
- `ck-icon-arrow-right`, `ck-icon-check` vb.
- `::before` veya background-image ile
- Inline SVG desteği

**6c. Icon Animations (1 gün)**
- `ck-icon-spin` (loading)
- `ck-icon-pulse` (notification)

**Çıktı:** Icon component + 50-100 icon.

### Faz 7: Animation ve Motion (3 gün) — P2

**7a. Animation Utilities (2 gün)**
- `ck-animate-fade-in`, `ck-animate-fade-out`
- `ck-animate-slide-up`, `ck-animate-slide-down`, `ck-animate-slide-left`, `ck-animate-slide-right`
- `ck-animate-scale-in`, `ck-animate-zoom-in`
- `ck-animate-spin`, `ck-animate-ping`, `ck-animate-pulse`, `ck-animate-bounce`
- `ck-duration-{fast|standard|slow}` utility
- `ck-ease-{standard|emphasis}` utility

**7b. Motion Preferences (1 gün)**
- `motion-safe:` ve `motion-reduce:` variant'lar
- Tüm animation'lar otomatik `prefers-reduced-motion`'a saygı

**Çıktı:** Tutarlı motion design system.

### Faz 8: Documentation ve Tooling (1.5 hafta) — P1

**8a. Documentation Site (1 hafta)**
- Public docs: `https://ckcss.dev` veya GitHub Pages
- Her component için sayfa: anatomy, API, examples, a11y, RTL
- Design tokens referansı
- Live playground (HTML/JSX önizleme)
- Arama fonksiyonu

**8b. Tooling (3 gün)**
- VS Code extension: class autocomplete (ör. `ck-b<tab>` → `ck-button`)
- HTML/CSS IntelliSense data
- Storybook veya Histoire entegrasyonu
- Figma design tokens export
- PostCSS plugin (opsiyonel, `@apply` desteği)

**Çıktı:** Public documentation sitesi, developer tooling.

### Faz 9: Test ve Validation (1 hafta) — P0

**9a. Visual Regression Tests (3 gün)**
- Her component için screenshot test (Chromatic veya Playwright)
- Light/dark mode test'leri
- RTL test'leri
- Print preview test'leri
- Mobile/tablet/desktop viewport test'leri

**9b. A11y Tests (2 gün)**
- `axe-core` ile otomatik a11y test'leri
- Manuel screen reader testleri
- Color contrast ratio validation (WCAG AA = 4.5:1, AAA = 7:1)

**9c. Performance Budget (2 gün)**
- CSS bundle size budget: < 20KB minified, < 50KB unminified
- First paint impact: < 50ms
- Runtime animation performance: 60fps hedefi

**Çıktı:** CI pipeline'da otomatik test'ler, performance budget'lar.

### Faz 10: Migration ve Yayın (1 hafta) — P0

**10a. Backward Compatibility (3 gün)**
- Tüm mevcut 99 class'ın aynı davranmasını sağla
- Deprecated class'lar için uyarı (console warning)
- Migration guide

**10b. Release (2 gün)**
- Semver: 0.1.0 → 1.0.0
- CHANGELOG.md güncelleme
- GitHub release
- DizgeCMS starter tema güncelleme
- Promo site güncelleme

**10c. Community (2 gün)**
- Discord/Slack kanal
- Contributing guide
- Code of conduct

**Çıktı:** CKCSS 1.0.0, public release, community.

---

## 5. Toplam Tahmin

| Faz | Süre | Öncelik |
|---|---|---|
| Faz 0: Altyapı | 1 hafta | P0 |
| Faz 1: Utility'ler | 2 hafta | P0 |
| Faz 2: Dark Mode | 1 hafta | P0 |
| Faz 3: A11y + Print | 1 hafta | P0 |
| Faz 4: Forms | 1.5 hafta | P0 |
| Faz 5: Yeni Components | 2 hafta | P1 |
| Faz 6: Icon Sistemi | 1 hafta | P1 |
| Faz 7: Animation | 3 gün | P2 |
| Faz 8: Documentation | 1.5 hafta | P1 |
| Faz 9: Test | 1 hafta | P0 |
| Faz 10: Migration | 1 hafta | P0 |
| **Toplam** | **~12 hafta** | |

**Ekip önerileri:**
- 1 geliştirici: 12 hafta
- 2 geliştirici paralel (Faz 1 + Faz 2): 8 hafta
- 3 geliştirici paralel (Faz 1, 2, 3): 5-6 hafta

---

## 6. Riskler ve Azaltma Stratejileri

| Risk | Etki | Azaltma |
|---|---|---|
| **Bundle bloat:** Utility'ler eklendikçe CSS büyür | Bundle 20KB+ hedefi | Build-free kalırken tree-shaking: `@import` partial'lar, critical CSS çıkarımı opsiyonel build |
| **Naming conflicts:** Utility'ler BEM style ile çakışabilir | Standardize değilse karışıklık | Tüm utility `ck-{name}` prefix'li, BEM modifier'lar `ck-{component}--{state}` |
| **Geriye uyumluluk:** Mevcut 99 class değişmemeli | Breaking change | Sadece ekleme, mevcut class'lar aynı kalmalı |
| **Browser support:** `light-dark()`, `color-mix()`, `@layer` desteği | Eski browser'lar | Graceful degradation: `@supports` ile fallback'ler (minimal); modern browser hedefi (Chrome 111+, Firefox 113+, Safari 16.4+) |
| **Naming convention drift:** Utility vs component ayrımı bulanıklaşır | API karmaşası | Net kural: utility'ler tek kelime (`flex`, `grid`, `m-4`), component'ler BEM (`ck-card__body`, `ck-button--primary`) |
| **Documentation debt:** Utility sayısı arttıkça dokümantasyon zorlaşır | Search kritik | Statik site generator (VitePress/Hugo) + Algolia/DocSearch |
| **CKCSS'in bağımsız geliştirilmesi:** DizgePHP ile senkronizasyon kaybı | Versiyon uyumsuzluğu | Semver katı takibi, DizgeCMS `ckcss` constraint'i `^1.0.0` |

---

## 7. Başarı Kriterleri (Definition of Done)

CKCSS 1.0.0 "endüstri standardı" kabul edilebilmesi için:

- [x] 200+ utility sınıfı (Tailwind parity) — landed in `src/utilities.css` (ADR 0021)
- [x] 40+ component sınıfı — forms + feedback + data display expansion
- [x] 250+ design token — space-0, type 3xl/4xl, z-scale, max-size, radius extras
- [x] Dark mode contract + JS helper — `data-ck-theme`/`data-theme` + `enhance/theme.js`
- [x] Print stylesheet — `src/print.css`
- [x] RTL desteği (full) — logical properties; i18n contract green
- [x] WCAG 2.2 AA uyumluluğu (axe-core test'leri) — `npm run test:a11y` + token-contrast
- [x] 50-100 SVG icon set — 189 symbols (`src/icons/`, icons-contract ≥100)
- [x] Animation library (10+ utility + 5+ keyframe)
- [ ] Public documentation sitesi (tüm component'ler, search, examples)
- [x] Visual regression test suite — `npm run test:visual` (light/dark/RTL × 3 viewports)
- [x] Performance budget — ADR 0021: ≤ 64KB minified (utility parity supersedes 20KB target)
- [x] Browser support: Chrome 111+, Firefox 113+, Safari 16.4+ (existing ADR 0004)
- [x] Backward compatibility: mevcut class aynı davranış
- [x] CI/CD pipeline (lint, test, build, release) — contract suite updated
- [x] CHANGELOG + migration notes (Unreleased / ADR 0021)

---

## 8. Mimari Kararlar (Detaylı)

### 8.1 Repo yapısı

```
ckcss/                            # Ayrı GitHub repo
├── packages/
│   ├── core/                     # Ana CSS framework
│   │   ├── src/
│   │   │   ├── 01-reset.css
│   │   │   ├── 02-tokens.css
│   │   │   ├── 03-base.css
│   │   │   ├── 04-layout.css
│   │   │   ├── 05-components.css
│   │   │   ├── 06-utilities.css
│   │   │   └── 07-print.css
│   │   ├── dist/
│   │   │   ├── ckcss.min.css
│   │   │   ├── ckcss.css
│   │   │   ├── ckcss-theme.js
│   │   │   └── ckcss-icon-sprite.svg
│   │   ├── package.json
│   │   └── README.md
│   ├── icons/                    # SVG icon set
│   │   ├── src/*.svg
│   │   ├── dist/ckcss-icons-sprite.svg
│   │   └── README.md
│   └── tooling/                  # VS Code extension, PostCSS plugin
├── docs/                         # Public documentation
├── examples/                     # Demo projeler
├── benchmarks/                   # CSS performance
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

### 8.2 Release stratejisi

- **GitHub Packages** veya **npm** üzerinden dağıtım (örn. `@ckcss/core`)
- **CDN:** `https://cdn.ckcss.dev/v1/ckcss.min.css` (pinned version)
- **DizgeCMS entegrasyonu:** Layout'unda CDN URL veya self-hosted `ckcss.min.css`
- **Semver:** Katı (major.minor.patch), major = breaking, minor = feature, patch = fix
- **LTS:** Major versiyonlar 24 ay desteklenir

### 8.3 DizgePHP/DizgeCMS bağımlılığı

CKCSS **framework-agnostic** kalır. PHP'den bağımsız, saf CSS + minimal JS. DizgePHP/DizgeCMS CKCSS'i sadece asset olarak kullanır.

```php
// DizgeCMS layout'ta
<link rel="stylesheet" href="https://cdn.ckcss.dev/v1.0.0/ckcss.min.css">
```

---

## 9. Açık Sorular

İlerlemeden önce netleştirilmesi gereken kararlar:

1. **Build stratejisi:** CKCSS saf CSS olarak mı kalır, yoksa PostCSS/Autoprefixer build adımı mı eklenir? (Cevap: build-free kal, modern browser hedefle)
2. **Tree-shaking:** 200+ utility sınıfı ile bundle büyür. Build-free kalırken nasıl optimize edilir? (Cevap: `@import` partial'lar + manuel seçim)
3. **JS kapsamı:** Sadece theme-toggle JS mi, yoksa daha fazla interaktif component (tooltip, dropdown, modal) için de JS mi -> performans açısından hangisi daha iyiyse. kararı netleştiren şey bu konuda performans olmalı?
4. **Icon set lisansı:** Heroicons (MIT), Lucide (ISC), Feather (MIT) veya kendi setimizi mi oluşturalım? (Cevap: Lucide'tan ilham al, özgün set oluştur)
5. **DizgeCMS'le senkronizasyon:** CKCSS 1.0.0 çıktığında DizgeCMS promo site'ı güncellenecek mi? Evet — Faz 10'da planlandı.

---

## 10. Sonuç

CKCSS'i endüstri standardına taşımak **mümkün, planlı, ve DizgePHP/DizgeCMS için stratejik bir yatırım**. Mevcut güçlü temel (cascade layers, design tokens, modern CSS) korunarak kapsam genişletilecek.

**Toplam:** 12 hafta (1 geliştirici) veya 5-6 hafta (3 geliştirici paralel).

**Çıktı:** CKCSS 1.0.0 — Tailwind/utility parity, Bootstrap/component parity, Pico/simplicity, Open Props/modern CSS. Build-free, paylaşımlı token sistemi, framework-agnostic.

**Etki:** Tüm DizgeCMS kurulumları (Baltık Postası, promo, üçüncü parti temalar) otomatik olarak utility sınıflar, dark mode, print, RTL, a11y baseline'ından yararlanır.
