/* CKCSS Enhance · independent tabs behavior */
document.querySelectorAll("[data-ck-tabs]").forEach((tablist) => {
  const tabs = [...tablist.querySelectorAll("[data-ck-tab]")];
  const group = tablist.getAttribute("data-ck-tabs");
  const panels = group ? [...document.querySelectorAll(`[data-ck-tab-panel="${group}"]`)] : [];
  if (!tabs.length || !panels.length) return;

  const activate = (tab, moveFocus = false) => {
    const target = tab.getAttribute("aria-controls");
    tabs.forEach((item) => item.setAttribute("aria-selected", String(item === tab)));
    panels.forEach((panel) => { panel.hidden = panel.id !== target; });
    if (moveFocus) tab.focus();
  };

  tabs.forEach((tab, index) => {
    tab.addEventListener("click", () => activate(tab));
    tab.addEventListener("keydown", (event) => {
      if (!["ArrowLeft", "ArrowRight", "Home", "End"].includes(event.key)) return;
      event.preventDefault();
      const next = event.key === "Home" ? 0 : event.key === "End" ? tabs.length - 1 : (index + (event.key === "ArrowRight" ? 1 : -1) + tabs.length) % tabs.length;
      activate(tabs[next], true);
    });
  });

  activate(tabs.find((tab) => tab.getAttribute("aria-selected") === "true") || tabs[0]);
});
