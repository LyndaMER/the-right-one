import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["tagfields"];

  addField() {
    const newField = this.tagFieldsTarget.lastElementChild.cloneNode(true);
    newField.querySelectorAll("input").forEach((input) => (input.value = ""));
    this.tagFieldsTarget.appendChild(newField);
  }

  removeField(event) {
    const field = event.target.closest(".tag_fields");
    field.parentNode.removeChild(field);
  }
}
