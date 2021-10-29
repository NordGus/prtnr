import { Controller } from "@hotwired/stimulus";

export default class LimitableController extends Controller {
    static targets = ['input', 'counter']

    connect() {
        this.limit = this.inputTarget.dataset['limit']
    }

    updateCounter(_event) {
        const length = this.inputTarget.value.length
        const input = this.inputTarget
        const counter = this.counterTarget

        input.classList.toggle('is-danger', length > this.limit)
        counter.classList.toggle('is-danger', length > this.limit)

        this._ticker.innerText = length
    }

    get _ticker() {
        return this.counterTarget.getElementsByClassName('ticker')[0]
    }
}