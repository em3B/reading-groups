const bar = document.querySelector(".objective-bar");
const title = document.querySelector(".objective-title");
const content = document.querySelector(".objective-content");

function fadeObjective() {
  if (document.body.contains(content) === false) {
    title.addEventListener("click", function() {
      jQuery(content).fadeIn(3000);
    })
  }
}

export { fadeObjective };
