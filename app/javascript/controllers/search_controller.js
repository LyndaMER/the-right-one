import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "cards"];
  connect() {
    console.log("seaaaaaarch");
  }

  search(event) {
    const url = `${this.formTarget.action}?query=${event.currentTarget.value}`;
    console.log(url);
    fetch(url)
      .then((res) => res.json())
      .then((data) => {
        this.cardsTarget.innerHTML = data.text;
      });
  }
}
