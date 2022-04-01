function scrollToEnd() {
  const form = document.querySelector("#myForm");
  const chatList = document.getElementById("messages");
  const message = document.querySelector(".message-container");
  const messageHeight = message.scrollHeight;
  let x = chatList.scrollHeight;

  form.addEventListener("submit", function() {
    x += messageHeight;
    chatList.scrollTop = x;
  });
}

export { scrollToEnd };
