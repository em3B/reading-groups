
function highlight() {
  const text = document.querySelector(".daily-text");
  if (text.classList.contains(".highlighted-text") === false) {
      text.addEventListener("mouseup", function() {
        let selection = document.getSelection();
        let range = selection.getRangeAt(0);
        let newNode = document.createElement("span");
        newNode.classList.remove("no-highlight");
        newNode.classList.add("highlighted-text");
        range.surroundContents(newNode);
      });
    }
  }


export { highlight };
