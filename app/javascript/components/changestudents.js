function changeStudents() {

  const heading = document.querySelector(".instructions");
  const buttons = document.querySelector(".main-edit-buttons");
  const studentsBtn = document.querySelector("#change-students");
  const studentsForm = document.querySelector(".reading-group-form");

  studentsBtn.addEventListener("click", function() {
    $(".active").fadeOut();
    heading.innerHTML = "";
    studentsForm.classList.remove("invisible");
    console.log(studentsForm.classList);
  })

};

export {changeStudents};
