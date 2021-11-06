import { Controller } from "@hotwired/stimulus";
import {FetchRequest} from "@rails/request.js";

export default class SearchableController extends Controller {
    static values = { endpoint: String }

    async search(event) {
        const trigger = event.currentTarget
        const url = this.endpointValue

        if (trigger.value.length < 2) return

        const request = new FetchRequest('post', url, {
            body: { search: { q: { name_cont: trigger.value } } },
            contentType: 'application/json',
            responseKind: 'turbo-stream'
        })

        const _ = request.perform()
    }
}