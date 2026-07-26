/* CKCSS Enhance · optional theme preference (light | dark | auto) */
(() => {
  const storageKey = "ckcss-theme";
  const root = document.documentElement;
  const toggle = document.querySelector("[data-ck-theme-toggle]");
  const saved = window.localStorage.getItem(storageKey);
  const systemDark = () =>
    window.matchMedia("(prefers-color-scheme: dark)").matches;

  const resolved = (pref) => {
    if (pref === "light" || pref === "dark") return pref;
    return systemDark() ? "dark" : "light";
  };

  const apply = (pref) => {
    const mode = pref === "light" || pref === "dark" || pref === "auto" ? pref : "auto";
    root.setAttribute("data-ck-theme", mode);
    root.setAttribute("data-theme", mode);
    root.style.colorScheme = mode === "auto" ? "light dark" : mode;
    if (toggle) {
      toggle.setAttribute("aria-pressed", String(resolved(mode) === "dark"));
      toggle.setAttribute("data-ck-theme-value", mode);
    }
  };

  apply(saved === "light" || saved === "dark" || saved === "auto" ? saved : "auto");

  window
    .matchMedia("(prefers-color-scheme: dark)")
    .addEventListener("change", () => {
      if ((window.localStorage.getItem(storageKey) || "auto") === "auto") apply("auto");
    });

  if (!toggle) return;

  toggle.addEventListener("click", () => {
    const current = root.getAttribute("data-ck-theme") || "auto";
    const next = current === "light" ? "dark" : current === "dark" ? "auto" : "light";
    window.localStorage.setItem(storageKey, next);
    apply(next);
  });
})();
