import { Controller } from "@hotwired/stimulus";

export default class DietController extends Controller {
    static targets = [ 'panel', 'content', 'toggle', 'toggleIcon' ]

    toggle(_event) {
        this.panelTarget.classList.toggle('is-expanded')

        this.contentTarget.classList.toggle('is-hidden')

        this.toggleTarget.classList.toggle('is-focused')

        for (let i = 0; i < this.toggleIconTargets.length; i++) {
            this.toggleIconTargets[i].classList.toggle('is-hidden')
        }
    }
}