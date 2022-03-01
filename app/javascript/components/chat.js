const element = document.querySelector(".open-button");
const cancel = document.querySelector("#btn-cancel");

function openForm() {
  element.addEventListener("click", function() {
    document.getElementById("myForm").style.display = "block";
  })
}

function closeForm() {
  cancel.addEventListener("click", function () {
    document.getElementById("myForm").style.display = "none";
  })
}

export {openForm, closeForm};
