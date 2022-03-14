import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"


export default class extends Controller {
  static targets = ["results", "form", "input"]

  connect() {
    console.log(this.formTarget.action)
    // console.log(this.element)
    // console.log(this.resultsTarget)
    // console.log(this.formTarget)
    // console.log('Olar :)')
  }

  search(event) {
    event.preventDefault()
    console.log(this.inputTarget.value)

    fetch(this.formTarget.action, {
      method: "get",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        data.forEach( (med) => {
          this.resultsTarget.insertAdjacentHTML('beforeend', med)
        })
        // this.resultsTarget.innerHTML = data.inserted_item
      })
  }

  // search(event) {
  //   event.preventDefault()
  //   fetch(this.buttonTarget.action, {
  //     method: "get",
  //     headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
  //     body: new FormData(this.buttonTarget) //como capturo os results da minha busca? Sei que não é usando new FormData, mas não sei o que usar
  //   })
  //     .then(response => response.json())
  //     .then((data) => {
  //       console.log(data)
  //     })
  // }
}
