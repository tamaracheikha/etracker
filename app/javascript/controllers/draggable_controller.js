import { Controller } from 'stimulus'
import { Sortable } from '@shopify/draggable'

export default class extends Controller {
  static targets = ['column', 'item']
  initialize() {}
  connect() {
    if (this.hasItemTarget) {
      this.itemTargets.forEach(item => {
        item.setAttribute('style', 'z-index: 1000;')
      })
      console.log(this.columnTargets)
      const sortable = new Sortable(this.columnTargets, {
        draggable: 'li'
        })
      sortable.on('sortable:stop', function(event) {
        let url = event.dragEvent.source.getAttribute('data-url')
        let column = event.newContainer.getAttribute('data-status')
        let data = { application: { application_status: column } }
        let token = document.head.querySelector('meta[name="csrf-token"]').getAttribute('content')
        fetch(url, {
          method: 'PUT',
          credentials: 'same-origin',
          headers: {
            "X-CSRF-Token": token,
            "Accept": "application/json",
            "Content-type": "application/json"
          },
          body: JSON.stringify(data)
        })
      })
      }
    }
    disconnect() {}
  }
