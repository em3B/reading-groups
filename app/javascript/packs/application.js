// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .


import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import {openForm, closeForm} from '../components/chat';
import {initChatroomCable} from '../channels/chatroom_channel';
import {highlight} from '../components/highlight';
import {unlight} from '../components/unlight';
import {scrollToEnd} from '../components/chatscroll';
import {editGroup} from '../components/editgroup';
import {addText} from '../components/addtext';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  const element = document.querySelector(".open-button");
  const cancel = document.querySelector("#btn-cancel");

  if (element && cancel) {
    openForm();
    closeForm();
  }
  editGroup();
  addText();
  scrollToEnd();
  unlight();
  initChatroomCable();
  highlight();
});
