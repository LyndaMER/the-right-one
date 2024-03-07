import { Controller } from "stimulus";
import 'slick-carousel';

export default class extends Controller {
  connect() {
    this.element.slick({
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 1
    });
  }
}
