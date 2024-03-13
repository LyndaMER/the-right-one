import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="slide"
export default class extends Controller {
  static targets = ["slide"];
  connect() {
    console.log("hello");
    let counter = 1;
    setInterval(() => {
      const widthValue = this.slideTarget.style.width.split("px")[0];
      console.log(widthValue * counter);
      this.element.style.transition = "transform 0.4s ease-in-out";
      this.element.style.transform = `translate3d(-${
        counter * widthValue
      }px, 0, 0)`;
      counter++;
    }, 5000);
  }
}
