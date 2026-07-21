/* CKCSS Enhance · independent client-side table filter */
/* Case folding follows the document language (ADR 0015), so locale-sensitive
   matching such as Turkish İ/i stays correct regardless of the browser UI. */
const ckTableLocale = document.documentElement.lang || undefined;

document.querySelectorAll("[data-ck-table-filter]").forEach((filter) => {
  const id = filter.getAttribute("data-ck-table-filter");
  const table = id ? document.getElementById(id) : null;
  if (!table) return;
  const rows = [...table.querySelectorAll("[data-ck-table-row]")];
  const empty = table.querySelector("[data-ck-table-empty]");
  const update = () => {
    const query = filter.value.trim().toLocaleLowerCase(ckTableLocale);
    let visible = 0;
    rows.forEach((row) => {
      const matches = !query || row.textContent.toLocaleLowerCase(ckTableLocale).includes(query);
      row.hidden = !matches;
      if (matches) visible += 1;
    });
    if (empty) empty.hidden = visible !== 0;
  };
  filter.addEventListener("input", update);
  update();
});
