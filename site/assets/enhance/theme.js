/* CKCSS Enhance · independent optional theme preference */
const themeToggle = document.querySelector("[data-ck-theme-toggle]");
const storageKey = "ckcss-theme";
const root = document.documentElement;

if (themeToggle) {
  const saved = window.localStorage.getItem(storageKey);
  if (saved === "light" || saved === "dark") root.setAttribute("data-ck-theme", saved);

  themeToggle.addEventListener("click", () => {
    const next = root.getAttribute("data-ck-theme") === "dark" ? "light" : "dark";
    root.setAttribute("data-ck-theme", next);
    window.localStorage.setItem(storageKey, next);
    themeToggle.setAttribute("aria-pressed", String(next === "dark"));
  });
}
