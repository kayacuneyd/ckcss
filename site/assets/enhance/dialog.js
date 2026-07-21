/* CKCSS Enhance · independent dialog behavior */
const dialogTriggers = document.querySelectorAll("[data-ck-dialog-open]");

dialogTriggers.forEach((trigger) => {
  const id = trigger.getAttribute("data-ck-dialog-open");
  const dialog = id ? document.getElementById(id) : null;
  if (!dialog) return;

  let returnTarget = null;
  trigger.addEventListener("click", (event) => {
    if (typeof dialog.showModal !== "function") return;
    event.preventDefault();
    returnTarget = trigger;
    dialog.showModal();
  });

  dialog.addEventListener("close", () => {
    if (returnTarget) returnTarget.focus();
  });
});
