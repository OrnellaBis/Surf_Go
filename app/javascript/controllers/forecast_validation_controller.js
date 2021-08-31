import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {

    static targets = ["iconContainer"]
  connect() {
  }

  validate(event) {
    event.preventDefault()
    console.log(`/${event.target.attributes.href.value}`)
    window.lol = event
    Rails.ajax({
        url: event.target.attributes.href.value,
        type: "post",
        success: function(){
            this.iconContainerTarget.innerHTML = '<i class="fas fa-check-circle"></i>'
        }.bind(this)
    
    })
  }
}