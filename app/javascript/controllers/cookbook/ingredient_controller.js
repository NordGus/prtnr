import { Controller } from "@hotwired/stimulus";

export default class IngredientController extends Controller {
    static targets = [ 'id', 'preview', 'file', 'name', 'result', 'fileName' ]

    select(event) {
        const target = event.currentTarget
        const { id, preview, filename, name } = target.dataset

        this.fileTarget.files = null

        this.idTarget.value = Number(id) || ''
        this.nameTarget.value = name || ''
        // this.fileTarget.files = file || ''
        this.previewTarget.src = preview || ''
        this.fileNameTarget.innerText = filename || ''

        this._focusSelected(Number(id))
    }

    clear(_event) {
        this.idTarget.value = ''
        this.nameTarget.value = ''
        this.fileTarget.files = null
        this.previewTarget.src = ''
        this.fileNameTarget.innerText = ''
    }

    _focusSelected(id) {
        for (const resultTarget of this.resultTargets) {
            const resultId = Number(resultTarget.dataset['id'])

            resultTarget.classList.toggle('is-focused', id === resultId)
        }
    }
}