import {Controller} from "@hotwired/stimulus";
import { destroy } from "@rails/request.js";

export default class DestroyableController extends Controller {
    static targets = ['button']

    async destroy(event) {
        event.preventDefault()

        const response = await destroy(this.buttonTarget.href)

        window.location.href = response.response.url
    }
}