function addText() {
  const pasteBtn = document.querySelector(".file-radio-btn-paste");
  const attachBtn = document.querySelector(".file-radio-btn-attach");
  const pasteText = document.querySelector(".paste-text");
  const attachHeading = document.querySelector(".attach-question-heading");
  const attachFile = document.querySelector(".attach-file");


  pasteBtn.addEventListener("click", function() {
    $(".file-radio-btn-paste").fadeOut();
    $(".file-radio-btn-attach").fadeOut();
    attachHeading.innerHTML = "Paste text here:";
    pasteText.classList.remove("invisible");

  })

  attachBtn.addEventListener("click", function() {
    $(".file-radio-btn-paste").fadeOut();
    $(".file-radio-btn-attach").fadeOut();
    attachHeading.innerHTML = "Attach text here:";
    attachFile.classList.remove("invisible");
  })
}

export {addText};
