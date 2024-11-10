import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "list"]
  
  connect() {
    console.log("Search controller connected!")
  }

  search() {
    const query = this.inputTarget.value
    if (query.length < 1) {
      return
    }

    fetch(`/users?query=${encodeURIComponent(query)}`, {
      headers: { 
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => {
      this.listTarget.innerHTML = html
    })
  }
}
