function editGroup() {
  // main teacher home
  const button = document.querySelector(".edit-group");
  const heading = document.querySelector(".top-heading");
  const allGroups = document.querySelector(".my-groups");

  button.addEventListener("click", function() {
    $(".active").fadeOut();
    heading.innerHTML = "Select a Group";
    $(".top-heading").fadeIn("slow");
    allGroups.classList.remove("invisible");
  })
}

export {editGroup};
