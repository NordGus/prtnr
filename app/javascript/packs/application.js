// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import { Application } from "@hotwired/stimulus";

import "channels"
import MainUXController from "../controllers/main_ux_controller";


Rails.start()
ActiveStorage.start()

window.Stimulus = Application.start()
Stimulus.register("main-ux", MainUXController)

Stimulus.handleError = (error, message, detail) => {
    console.warn(message, detail)
    ErrorTrackingSystem.captureException(error)
}