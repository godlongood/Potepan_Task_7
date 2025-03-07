// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// import Turbolinks from "turbolinks"; // コメントアウト
import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "script.js"; /* メニュー追加 */

Rails.start();
// Turbolinks.start(); // コメントアウト
ActiveStorage.start();

