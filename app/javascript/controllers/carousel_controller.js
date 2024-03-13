// carousel_controller.js
import { Controller } from "stimulus";
import Swiper from 'swiper';

export default class extends Controller {
  init() {
    // Configuration de Swiper avec l'option autoplay
    new Swiper(this.element, {
      autoplay: {
        delay: 5000, // Définir la durée de défilement automatique en millisecondes (par exemple, 5 secondes)
        disableOnInteraction: false, // Continuer le défilement automatique même lorsqu'un utilisateur interagit avec le carrousel
      },
      // Autres options de configuration Swiper
    });
  }
}
