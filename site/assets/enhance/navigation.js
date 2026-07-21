/* CKCSS Enhance · independent progressive mobile navigation */
const toggles = document.querySelectorAll("[data-ck-menu-toggle]");

toggles.forEach((toggle) => {
  const id = toggle.getAttribute("data-ck-menu-toggle") || toggle.getAttribute("aria-controls");
  const menu = id ? document.getElementById(id) : null;
  if (!menu) return;

  const setOpen = (open) => {
    toggle.setAttribute("aria-expanded", String(open));
    menu.hidden = !open;
  };

  toggle.addEventListener("click", () => setOpen(menu.hidden));
  toggle.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      setOpen(false);
      toggle.focus();
    }
  });
  menu.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      setOpen(false);
      toggle.focus();
    }
  });
  setOpen(false);
});
