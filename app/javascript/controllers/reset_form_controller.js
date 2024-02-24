import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reset-form"
export default class extends Controller {
  static targets = ["input"];
  connect() {}

  clearInput() { // resets message input field
    console.log("resetting");
    this.inputTarget.value = "";
  }
}
