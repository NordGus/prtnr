import {Controller} from "@hotwired/stimulus";
import {get} from "@rails/request.js";

export class KtchnDate {
    static parse(date) {
        let [ year, month, day ] = date.split('_')
        year = Number(year)
        month = Number(month) - 1
        day = Number(day)

        return new Date(year, month, day)
    }
}

export default class CalendarController extends Controller {
    static targets = [ 'day', 'month', 'year' ]
    static values = { selected: String, baseUrl: String }

    connect() {
        this.dayIndex = -1
    }

    async refresh(_event) {
        const _ = await get(this._calendarUrl(), { responseKind: 'turbo-stream' })
    }

    async nextYear(_event) {
        this.yearTarget.value = (Number(this.yearTarget.value) + 1).toFixed(0)

        const _ = await get(this._calendarUrl(), { responseKind: 'turbo-stream' })
    }

    async prevYear(_event) {
        this.yearTarget.value = (Number(this.yearTarget.value) - 1).toFixed(0)

        const _ = await get(this._calendarUrl(), { responseKind: 'turbo-stream' })
    }

    async nextMonth(_event) {
        const { selectedIndex } = this.monthTarget.options

        this.monthTarget.options.selectedIndex = (selectedIndex + 1) % this.monthTarget.options.length

        const _ = await get(this._calendarUrl(), { responseKind: 'turbo-stream' })
    }

    async prevMonth(_event) {
        const { selectedIndex } = this.monthTarget.options

        this.monthTarget.options.selectedIndex = selectedIndex === 0 ? this.monthTarget.options.length - 1 : selectedIndex - 1

        const _ = await get(this._calendarUrl(), { responseKind: 'turbo-stream' })
    }

    select(event) {
        event.preventDefault()

        const { currentTarget } = event

        currentTarget.classList.toggle('is-active', true)

        if (this.dayIndex < 0) this.dayIndex = this._findDay(0, this.dayTargets.length - 1, this.selectedValue)
        if (this.dayIndex >= 0) this.dayTargets[this.dayIndex].classList.toggle('is-active', false)

        this.selectedValue = currentTarget.id
        this.dayIndex = this._findDay(0, this.dayTargets.length - 1, currentTarget.id)
    }

    async display(event) {
        event.preventDefault()

        const { currentTarget } = event

        const _ = await get(currentTarget.href, { responseKind: 'turbo-stream' })
    }

    _calendarUrl() {
        return `${this.baseUrlValue}/${this.yearTarget.value}_${this.monthTarget.value}/calendar.turbo_stream?selected_id=${this.selectedValue}`
    }

    _findDay(left, right, date, parsed = null) {
        if (!parsed) parsed = KtchnDate.parse(date)

        if (right >= left) {
            const mid = left + Math.floor((right - left) / 2)
            const middle = this.dayTargets[mid].id

            if (middle === date) return mid
            if (KtchnDate.parse(middle) > parsed) return this._findDay(left, mid - 1, date, parsed)
            return this._findDay(mid + 1, right, date, parsed)
        }

        return -1
    }
}