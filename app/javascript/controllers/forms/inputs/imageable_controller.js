import { Controller } from "@hotwired/stimulus";

export default class ImageableController extends Controller {
    static targets = ['input', 'name', 'preview']

    readFiles(_event) {
        const input = this.inputTarget
        const output = this.nameTarget
        const preview = this.previewTarget

        if (input.files.length > 0) {
            const fileNames = new Array(input.files.length)

            for (let i = 0; i < this.inputTarget.files.length; i++) {
                fileNames[i] = this.inputTarget.files[i].name
            }

            const reader = new FileReader()

            reader.onload = () => preview.src = reader.result

            output.innerText = fileNames.join(', ')
            reader.readAsDataURL(input.files[0])
            preview.classList.toggle('is-hidden', false)
        }
    }
}