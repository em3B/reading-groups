
function highlight() {
  const text = document.querySelector(".daily-text");

    text.addEventListener("mouseup", function() {
      let selection = document.getSelection();
      let range = selection.getRangeAt(0);
      let newNode = document.createElement("span");
      newNode.classList.toggle("highlighted-text");
      range.surroundContents(newNode);
      });

  }


export { highlight };
