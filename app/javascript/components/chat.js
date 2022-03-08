
function openForm() {
  const element = document.querySelector(".open-button");

  element.addEventListener("click", function () {
    console.log('opening form')
    document.getElementById("myForm").style.display = "block";
  });
};

function closeForm() {
  const cancel = document.querySelector("#btn-cancel");

  cancel.addEventListener("click", function () {
    console.log('closing form')
    document.getElementById("myForm").style.display = "none";
  });
};

export {openForm, closeForm};
