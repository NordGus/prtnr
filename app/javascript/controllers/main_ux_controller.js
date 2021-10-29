import {Controller} from "@hotwired/stimulus";
import {get, destroy} from "@rails/request.js";

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

    async destroyRecord(event) {
        event.preventDefault()

        const currentTarget = event.currentTarget
        const href = currentTarget.href
        const target = currentTarget.dataset['root']

        currentTarget.classList.toggle('is-loading', true)

        const _ = await destroy(href)

        window.location.href = target
    }

    postSubmit(event) {
        console.log('post', event)
        console.log(event.target, event.currentTarget)
        // console.log(event.detail.formSubmission)
        // console.log(event.detail)
        // const modal = this.modalTarget
        // const frame = this.modalFrameTarget
        //
        // if (frame.innerHTML.trim() === '') {
        //     modal.classList.toggle('is-hidden', true)
        // }
    }
}