import { Controller } from "@hotwired/stimulus";
// import TomSelect from "tom-select";
staticvalue: {artist: Array}

export default class extends Controller {

  connect() {
    new TomSelect(this.element)
  }
}
