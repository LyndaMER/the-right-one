import { Controller } from "@hotwired/stimulus";
// import TomSelect from "tom-select";

export default class extends Controller {
  static values = { id: String };

  connect() {
    new TomSelect(`#${this.idValue}`,
    {
    });
  }
}
