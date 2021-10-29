import {Controller} from "@hotwired/stimulus";
import { destroy } from "@rails/request.js";

export default class DestroyableController extends Controller {
    static targets = ['button']

    async destroy(event) {
        event.preventDefault()

        const button = this.buttonTarget
        const href = button.href
        const success = button.dataset['success']

        button.classList.toggle('is-loading', true)

        const _ = await destroy(href)

        window.location.href = success
    }
}