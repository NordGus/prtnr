import {Controller} from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class MainUXController extends Controller {
    static targets = ['navigation', 'applet', 'modal', 'modalFrame']

    connect() {
    }

    toggleNavigation(_event) {
        const navigation = this.navigationTarget
        const applet = this.appletTarget

        navigation.classList.toggle('is-hidden')
        applet.classList.toggle('is-hidden')
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

    closeModal(event) {
        event.preventDefault()

        const modal = this.modalTarget
        const frame = this.modalFrameTarget

        modal.classList.toggle('is-hidden', true)
        frame.innerHTML = ''
    }
}