import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form","mainCheck"]

  connect(){
    let num = 0;
    this.formTarget.querySelectorAll("input.form-check-input").forEach((input) => {
      if (input.checked === true){
        console.log(num)
        num += 1;
      }
    });
    if (num === 11){
      this.mainCheckTarget.checked = true
    }
    else {
      this.mainCheckTarget.checked = false
    }
  }

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