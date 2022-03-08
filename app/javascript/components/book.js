const cover = document.querySelector(".cover-image");

function coverFade() {
  if (document.body.contains(cover)) {
    jQuery(cover).fadeOut(3000);
  }
}

export {coverFade};
