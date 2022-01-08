import { Controller } from "@hotwired/stimulus";

export default class IngredientController extends Controller {
    static targets = [ 'id', 'preview', 'file', 'name', 'result', 'fileName' ]

    select(event) {
        const { id, preview, filename, name } = event.currentTarget.dataset

        this.fileTarget.files = null
        this._togglePreview(true)

        this.idTarget.value           = Number(id) || ''
        this.nameTarget.value         = name       || ''
        this.previewTarget.src        = preview    || ''
        this.fileNameTarget.innerText = filename   || ''

        this._togglePreview(this.previewTarget.src === '')

        this._focusSelected(Number(id))
    }

    clear(_event) {
        this.idTarget.value           = ''
        this.nameTarget.value         = ''
        this.fileTarget.files         = null
        this.previewTarget.src        = ''
        this.fileNameTarget.innerText = ''
    }

    _focusSelected(id) {
        for (const resultTarget of this.resultTargets) {
            const resultId = Number(resultTarget.dataset['id'])

            resultTarget.classList.toggle('is-focused', id === resultId)
        }
    }

    _togglePreview(hide) {
        this.previewTarget.classList.toggle('is-hidden', hide)
    }
}
