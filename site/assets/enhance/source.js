/* CKCSS Enhance · optional source reveal and copy controls for documentation */
const examples = document.querySelectorAll(".ckcss-example");
const labels = document.body?.dataset;

if (examples.length && labels) {
  document.documentElement.classList.add("ckcss-source-ready");

  examples.forEach((example, index) => {
    const source = example.querySelector(".ckcss-example-code");
    const code = source?.querySelector("code");
    if (!source || !code) return;

    const sourceId = `ckcss-source-${index + 1}`;
    source.id = sourceId;

    const controls = document.createElement("div");
    controls.className = "ckcss-source-controls";
    const actions = document.createElement("div");
    actions.className = "ck-cluster";

    const toggle = document.createElement("button");
    toggle.className = "ck-button ck-button--secondary";
    toggle.type = "button";
    toggle.setAttribute("aria-controls", sourceId);
    toggle.setAttribute("aria-expanded", "false");
    toggle.textContent = labels.ckSourceLabelShow;

    const copy = document.createElement("button");
    copy.className = "ck-button ck-button--quiet";
    copy.type = "button";
    copy.textContent = labels.ckSourceLabelCopy;

    const status = document.createElement("span");
    status.className = "ckcss-source-status";
    status.setAttribute("aria-live", "polite");

    toggle.addEventListener("click", () => {
      const open = example.dataset.ckSourceOpen === "true";
      example.dataset.ckSourceOpen = String(!open);
      toggle.setAttribute("aria-expanded", String(!open));
      toggle.textContent = open ? labels.ckSourceLabelShow : labels.ckSourceLabelHide;
    });

    copy.addEventListener("click", async () => {
      try {
        await navigator.clipboard.writeText(code.textContent.trim());
        status.textContent = labels.ckSourceLabelCopied;
      } catch {
        status.textContent = labels.ckSourceLabelCopyFailed;
      }
    });

    actions.append(toggle, copy);
    controls.append(actions, status);
    source.prepend(controls);
  });
}
