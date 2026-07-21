/* CKCSS Enhance · independent form helpers */
/* Labels belong to the page (ADR 0015): text is only swapped when both
   data-ck-label-* hooks are present; aria-pressed always updates. */
document.querySelectorAll("[data-ck-password-toggle]").forEach((toggle) => {
  const id = toggle.getAttribute("data-ck-password-toggle");
  const input = id ? document.getElementById(id) : null;
  if (!input) return;
  toggle.addEventListener("click", () => {
    const visible = input.type === "text";
    input.type = visible ? "password" : "text";
    toggle.setAttribute("aria-pressed", String(!visible));
    const showLabel = toggle.getAttribute("data-ck-label-show");
    const hideLabel = toggle.getAttribute("data-ck-label-hide");
    if (showLabel && hideLabel) {
      toggle.textContent = visible ? showLabel : hideLabel;
    }
  });
});

document.querySelectorAll("form[data-ck-enhance-form]").forEach((form) => {
  form.addEventListener("submit", () => {
    const submit = form.querySelector("button[type=submit]");
    if (!submit || !form.checkValidity()) return;
    submit.setAttribute("aria-busy", "true");
  });
});
