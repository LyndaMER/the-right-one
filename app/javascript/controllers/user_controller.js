import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    this.element.querySelectorAll(".user-link").forEach((link) => {
      link.addEventListener("click", (event) => {
        event.preventDefault();
        const url = link.getAttribute("href");
        window.location.href = url;
      });
    });
  }
}
