function addTick() {
  const ans = document.querySelector("input#student-answer.form-control");
  const button = document.querySelector(".subscription-btn");
  if (ans.clientHeight > 0) {
    button.classList.add("check");
  }
}

export { addTick };
