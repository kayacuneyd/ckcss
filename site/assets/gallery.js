/* CKCSS site gallery: progressive filtering and restrained reveal motion. */
const catalog = document.querySelector("[data-ckcss-catalog], main > .ckcss-section .ck-grid.ck-grid--3");

if (catalog) {
  const cards = [...catalog.querySelectorAll(".ckcss-pattern-link")];
  const categoryFor = (href) => {
    const match = href.match(/^\/patterns\/([^/]+)\//);
    return match ? match[1] : "foundation";
  };

  cards.forEach((card) => {
    card.dataset.category = categoryFor(card.getAttribute("href") || "");
    card.classList.add("ckcss-reveal");
    const preview = document.createElement("div");
    preview.className = "ckcss-card-preview";
    preview.setAttribute("aria-hidden", "true");
    card.prepend(preview);
  });

  const controls = document.createElement("div");
  controls.className = "ckcss-catalog-controls";
  controls.innerHTML = `
    <div class="ckcss-catalog-controls__filters" aria-label="Pattern kategorileri" role="group">
      <button class="ckcss-filter" type="button" data-category="all" aria-pressed="true">Tümü</button>
      <button class="ckcss-filter" type="button" data-category="marketing" aria-pressed="false">Marketing</button>
      <button class="ckcss-filter" type="button" data-category="auth" aria-pressed="false">Auth</button>
      <button class="ckcss-filter" type="button" data-category="ecommerce" aria-pressed="false">E-commerce</button>
      <button class="ckcss-filter" type="button" data-category="application" aria-pressed="false">Application</button>
      <button class="ckcss-filter" type="button" data-category="publisher" aria-pressed="false">Publisher</button>
    </div>
    <label class="ckcss-catalog-search"><span class="ck-visually-hidden">Pattern ara</span><input class="ck-input" type="search" placeholder="Pattern ara" autocomplete="off"></label>`;
  catalog.before(controls);

  const search = controls.querySelector("input");
  const filters = [...controls.querySelectorAll("[data-category]")];
  const state = new URLSearchParams(window.location.search);
  let activeCategory = state.get("category") || "all";
  search.value = state.get("q") || "";

  const apply = () => {
    const query = search.value.trim().toLocaleLowerCase("tr");
    cards.forEach((card) => {
      const matchesCategory = activeCategory === "all" || card.dataset.category === activeCategory;
      const matchesQuery = !query || card.textContent.toLocaleLowerCase("tr").includes(query);
      card.hidden = !(matchesCategory && matchesQuery);
    });
    filters.forEach((filter) => filter.setAttribute("aria-pressed", String(filter.dataset.category === activeCategory)));
    const next = new URLSearchParams();
    if (activeCategory !== "all") next.set("category", activeCategory);
    if (search.value.trim()) next.set("q", search.value.trim());
    const suffix = next.size ? `?${next}` : window.location.pathname;
    history.replaceState(null, "", suffix);
  };

  filters.forEach((filter) => filter.addEventListener("click", () => {
    activeCategory = filter.dataset.category || "all";
    apply();
  }));
  search.addEventListener("input", apply);
  apply();

  if (!matchMedia("(prefers-reduced-motion: reduce)").matches && "IntersectionObserver" in window) {
    const observer = new IntersectionObserver((entries) => entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("is-visible");
        observer.unobserve(entry.target);
      }
    }), { threshold: 0.12 });
    cards.forEach((card) => observer.observe(card));
  } else cards.forEach((card) => card.classList.add("is-visible"));
}
