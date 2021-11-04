import { Controller } from "@hotwired/stimulus";

export default class CalendarGridController extends Controller {
    static targets = [ 'first' ]

    connect() {
        let { weekday } = this.firstTarget.dataset

        weekday = Number(weekday)

        this.firstTarget.style["grid-column-start"] = weekday === 7 ? 1 : weekday + 1
    }
}