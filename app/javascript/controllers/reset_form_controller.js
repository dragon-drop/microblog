import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="reset-form"
export default class extends Controller {
  connect() {
    console.log("Reset form controller connected");
  }
  reset() {
    console.log("submit fired");
    this.element.reset();
  }
}
