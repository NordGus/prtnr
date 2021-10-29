import {Controller} from "@hotwired/stimulus";

export default class TabsController extends Controller {
    static targets = ['link', 'tab']

    showTab(event) {

        event.preventDefault()
        const target = event.currentTarget.dataset['targetTab']

        for (let i = 0; i < this.linkTargets.length; i++) {
            if (this.linkTargets[i].dataset['targetTab'] === target)
                this.linkTargets[i].classList.toggle('is-active', true)
            else
                this.linkTargets[i].classList.toggle('is-active', false)

            if (this.tabTargets[i].dataset['tabName'] === target)
                this.tabTargets[i].classList.toggle('is-hidden', false)
            else
                this.tabTargets[i].classList.toggle('is-hidden', true)
        }
    }
}