// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"

import { Application } from "@hotwired/stimulus";
import LayoutController from "../controllers/layout_controller";
import TabsController from "../controllers/tabs_controller";
import BaseController from "../controllers/cookbook/base_controller";
import NumericController from "../controllers/forms/inputs/numeric_controller";
import LimitableController from "../controllers/forms/inputs/limitable_controller";
import ImageableController from "../controllers/forms/inputs/imageable_controller";
import DestroyableController from "../controllers/destroyable_controller";
import SearchableController from "../controllers/searchable_controller";
import IngredientController from "../controllers/cookbook/ingredient_controller";
import CalendarController from "../controllers/calendar_controller";
import CalendarGridController from "../controllers/calendar_grid_controller";
import DietController from "../controllers/diet_controller";

import 'trix'
import '@rails/actiontext'
import "channels"
import '@hotwired/turbo-rails'

Rails.start()
ActiveStorage.start()

window.Stimulus = Application.start()
Stimulus.register('layout', LayoutController)
Stimulus.register('cookbook', BaseController)
Stimulus.register('diet', DietController)
Stimulus.register('calendar', CalendarController)
Stimulus.register('calendar-grid', CalendarGridController)


Stimulus.register('cookbook-ingredient', IngredientController)

Stimulus.register('tabs', TabsController)
Stimulus.register('destroyable', DestroyableController)
Stimulus.register('searchable', SearchableController)

Stimulus.register('input-numeric', NumericController)
Stimulus.register('input-limitable', LimitableController)
Stimulus.register('input-imageable', ImageableController)