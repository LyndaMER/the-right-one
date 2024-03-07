import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tagTemplate", "tagfields"];

  connect() {
    console.log("Tag controller connected");
    this.addField();
  }

  addField() {
    const tagTemplate = this.tagTemplateTarget.cloneNode(true);
    tagTemplate.classList.remove("hidden");

    this.tagfieldsTarget.appendChild(tagTemplate);
  }

  removeField(event) {
    const tagField = event.target.closest(".tagfields");
    if (this.tagfieldsTarget.children.length > 1) {
      console.log("test i'm here");

      this.tagfieldsTarget.lastElementChild.remove();
    }
  }

}
