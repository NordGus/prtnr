import { Controller } from "@hotwired/stimulus";

export default class CalendarController extends Controller {
    static targets = [ ]
    static values = { today: String }

    connect() {
        let [year, month, day] = this.todayValue.split('_')
        year = Number(year)
        month = Number(month) - 1
        day = Number(day)

        this.today = new Date(year, month, day)
    }
}