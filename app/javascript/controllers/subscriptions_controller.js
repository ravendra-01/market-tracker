import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('connected')
  }

  initialize() {
    this.element.setAttribute("data-action", "change->subscriptions#updateDetails")
  }

  updateDetails(event) {
    const subscriptionId = event.target.value

    fetch(`/subscriptions/${subscriptionId}`, {
      headers: {
        Accept: "text/vnd.turbo-stream.html",
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
