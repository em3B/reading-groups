const text = document.querySelector(".daily-text");

function highlight() {
  if (text.classList.contains(".highlighted-text") === false) {

      text.addEventListener("mouseup", function() {
        let selection = document.getSelection();
        let range = selection.getRangeAt(0);
        let newNode = document.createElement("span");
        newNode.classList.remove("no-highlight");
        newNode.classList.add("highlighted-text");
        range.surroundContents(newNode);
      });
    } else {
      text.addEventListener("mouseup", function() {
        let selection = document.getSelection();
        let range = selection.getRangeAt(0);
        let newNode = document.createElement("span");
        newNode.classList.remove("highlighted-text");
        newNode.classList.add("no-highlight");
        range.surroundContents(newNode);
      })
    };
  }

export { highlight };
