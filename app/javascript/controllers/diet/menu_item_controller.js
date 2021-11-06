import { Controller } from "@hotwired/stimulus";

export default class MenuItemController extends Controller {
    static targets = [ 'id', 'preview', 'name', 'result' ]

    select(event) {
        const { id, preview, name } = event.currentTarget.dataset

        this.idTarget.value = Number(id) || ''
        this.nameTarget.value = name || ''

        if (preview) {
            this.previewTarget.src = preview || ''
            this.previewTarget.classList.toggle('is-hidden', false)
        } else
            this.previewTarget.classList.toggle('is-hidden', true)

        this._focusSelected(Number(id))
    }

    _focusSelected(id) {
        for (const resultTarget of this.resultTargets)
            resultTarget.classList.toggle('is-focused', id === Number(resultTarget.dataset['id']))
    }
}