
// const text = document.querySelector(".daily-text");


function unlight() {
  const text = document.querySelector(".daily-text");
  if (text.classList.contains(".highlighted-text")) {
    text.addEventListener("mouseup", function() {
      let selection = document.getSelection();
      let range = selection.getRangeAt(0);
      let newNode = document.createElement("span");
      newNode.classList.remove("highlighted-text");
      newNode.classList.add("no-highlight");
      range.surroundContents(newNode);
    })
  }
}

export {unlight};
