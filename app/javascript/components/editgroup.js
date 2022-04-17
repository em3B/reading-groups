function editGroup() {
  const button = document.querySelector(".edit-group");
  const heading = document.querySelector(".top-heading");
  const allGroups = document.querySelector(".my-groups");

  button.addEventListener("click", function() {
    $(".active").fadeOut();
    heading.innerHTML = "My Groups";
    $(".top-heading").fadeIn("slow");
    allGroups.classList.remove("invisible");
  })
}

export {editGroup};
