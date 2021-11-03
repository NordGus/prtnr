import { Controller } from "@hotwired/stimulus";

export default class NumericController extends Controller {
    static targets = ['input']

    connect() {
        this.fractionDigits = 0

        if (this.inputTarget.step.includes('.')) {
            const result = this.inputTarget.step.split('.')
            this.fractionDigits = result[result.length - 1].length
        }
    }

    add(event) {
        const step = Number(event.currentTarget.dataset['step'])

        this._updateValue(step, this._value)
    }

    remove(event) {
        const step = -Number(event.currentTarget.dataset['step'])

        this._updateValue(step, this._value)
    }

    validate(_event) {
        this.inputTarget.value = this._value.toFixed(this.fractionDigits)
    }

    get _value() {
        return Number(this.inputTarget.value)
    }

    _updateValue(step, value) {
        try {
            this.inputTarget.value = (step + value).toFixed(this.fractionDigits)
        } catch (e) {
            console.error(e)
            this.inputTarget.value = value.toFixed(this.fractionDigits)
        }
    }
}