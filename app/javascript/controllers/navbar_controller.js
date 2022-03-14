import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("hello from navbar_controller!")
  }
  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      this.element.classList.add("navbar-lewagon-white")
    } else {
      this.element.classList.remove("navbar-lewagon-white")
    }
  };
}
