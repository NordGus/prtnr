import { Controller } from "@hotwired/stimulus";

export default class NumericController extends Controller {
    static targets = ['input']

    add(event) {
        const step = Number(event.currentTarget.dataset['step'])

        this._updateValue(step, this._value)
    }

    remove(event) {
        const step = Number(event.currentTarget.dataset['step'])

        this._updateValue(-step, this._value)
    }

    get _value() {
        return Number(this.inputTarget.value)
    }

    _updateValue(a, value) {
        try {
            this.inputTarget.value = a + value
        } catch (e) {
            console.error(e)
            this.inputTarget.value = value
        }
    }
}