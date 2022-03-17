import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"


export default class extends Controller {
  static targets = ["results", "form", "input", "medications", "units"]

  connect() {
  }

  search(event) {
    event.preventDefault()
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&units=${this.unitsTarget.value}`

    fetch(url, {
      method: "get",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      data.forEach( (med) => {
        this.resultsTarget.classList.remove("d-none")
        this.resultsTarget.insertAdjacentHTML('beforeend', med)
        })
      })
  }

}
