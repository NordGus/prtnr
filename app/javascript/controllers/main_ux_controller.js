import {Controller} from "@hotwired/stimulus";

export default class MainUXController extends Controller {
    static targets = ['navigation', 'applet', 'auxiliaryPanel']

    toggleNavigation(_event) {
        this.navigationTarget.classList.toggle('is-hidden')
        this.appletTarget.classList.toggle('is-hidden')
    }

    toggleAuxiliaryPanel(_event) {
        this.auxiliaryPanelTarget.classList.toggle('is-hidden')
    }
}