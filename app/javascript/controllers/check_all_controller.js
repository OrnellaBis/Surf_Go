import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form","mainCheck"]

  checkUncheck() {
    if (this.mainCheckTarget.checked === true) {
        this.formTarget.querySelectorAll("input.form-check-input").forEach((input) => {
            input.checked = true
        });
    }
      
    if (this.mainCheckTarget.checked === false) {
        this.formTarget.querySelectorAll("input.form-check-input").forEach((input) => {
            input.checked = false
        });
    }
  }
}