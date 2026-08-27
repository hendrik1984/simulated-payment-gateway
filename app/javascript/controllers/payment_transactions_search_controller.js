import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="payment-transactions-search"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.timeout = null

    requestAnimationFrame(() => {
      this.inputTarget.focus()

      const length = this.inputTarget.value.length

      this.inputTarget.setSelectionRange(length, length)
    })    
  }

  search() {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 600)

    document.getElementById("search")
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}
