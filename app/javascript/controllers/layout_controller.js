import {Controller} from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class LayoutController extends Controller {
    static targets = ['navigation', 'applet', 'modal', 'modalContent']

    toggleNavigation(_event) {
        const navigation = this.navigationTarget
        const applet = this.appletTarget

        navigation.classList.toggle('is-hidden')
        applet.classList.toggle('is-hidden')
    }

    openModal(_event) {
        const modal = this.modalTarget

        modal.classList.toggle('is-hidden', false)
    }

    closeModal(event) {
        event.preventDefault()

        const modal = this.modalTarget
        const content = this.modalContentTarget

        modal.classList.toggle('is-hidden', true)
        content.innerHTML = ''
    }

    async deployModal(event) {
        event.preventDefault()

        const modal = this.modalTarget
        const href = event.currentTarget.href

        modal.classList.toggle('is-hidden', false)
        const response = await get(href, { responseKind: 'turbo-stream' })

        if (!response.ok) {
            modal.classList.toggle('is-hidden', true)
        }
    }

    requestFromButton(event) {
        event.currentTarget.classList.toggle('is-loading', true)
    }
}