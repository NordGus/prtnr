import { Controller } from "@hotwired/stimulus";

export default class BaseController extends Controller {
    static targets = [ 'panel', 'panelContent', 'panelToggle' ]

    togglePanel(_event) {
        const panel = this.panelTarget
        const content = this.panelContentTarget
        const toggle = this.panelToggleTarget

        panel.classList.toggle('is-expanded')
        content.classList.toggle('is-hidden')
        toggle.classList.toggle('is-focused')
    }
}