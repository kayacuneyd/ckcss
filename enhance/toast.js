/* CKCSS Enhance · independent toast behavior */
document.querySelectorAll("[data-ck-toast-trigger]").forEach((trigger) => {
  const id = trigger.getAttribute("data-ck-toast-trigger");
  const toast = id ? document.getElementById(id) : null;
  if (!toast) return;
  let timer = null;
  trigger.addEventListener("click", () => {
    toast.hidden = false;
    toast.setAttribute("role", "status");
    clearTimeout(timer);
    timer = setTimeout(() => { toast.hidden = true; }, Number(toast.dataset.ckToastDuration || 4000));
  });
});
