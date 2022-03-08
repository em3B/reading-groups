const bar = document.querySelector(".objective-bar");
const title = document.querySelector(".objective-title");
const content = document.querySelector(".objective-content");

function displayObjective() {
  if (document.body.contains(content)) {
    title.addEventListener("click", function() {
      console.log("hi");
      jQuery(content).fadeOut("fast");
    })
  }
}

export { displayObjective };
