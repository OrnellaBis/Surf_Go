import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = []

  connect() {
    console.log('spots')
  }

  async favorite(evt) {
    evt.preventDefault();
    evt.stopPropagation();
    const clickedElement = evt.currentTarget;
    const spotId = evt.currentTarget.dataset.spotId
    const formData = new FormData()
    formData.append('spot_id', spotId)

    const options = {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: formData
    }

    const response = await fetch(`/spots/${spotId}/favorite_spots`, options)
    const data = await response.json()
    if (data.liked){
      clickedElement.innerHTML = `<i class= "fas fa-heart active" id="yellow-heart"></i>`;
    } else {
      clickedElement.innerHTML = `<i class= "far fa-heart" id="empty-heart"></i>`;
    }

  }
}
