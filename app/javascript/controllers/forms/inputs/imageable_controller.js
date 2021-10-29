import { Controller } from "@hotwired/stimulus";

export default class ImageableController extends Controller {
    static targets = ['input', 'name', 'preview', 'previewOutput']

    connect() {
        if (this.previewOutputTarget.src) this.previewTarget.classList.toggle('is-hidden', false)
    }


    readFiles(_event) {
        const input = this.inputTarget
        const output = this.nameTarget
        const preview = this.previewTarget
        const previewOutput = this.previewOutputTarget

        if (input.files.length > 0) {
            const fileNames = new Array(input.files.length)

            for (let i = 0; i < this.inputTarget.files.length; i++) {
                fileNames[i] = this.inputTarget.files[i].name
            }

            const reader = new FileReader()

            reader.onload = () => previewOutput.src = reader.result

            output.innerText = fileNames.join(', ')
            reader.readAsDataURL(input.files[0])
            preview.classList.toggle('is-hidden', false)
        }
    }
}