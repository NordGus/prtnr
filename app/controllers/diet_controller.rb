# frozen_string_literal: true

# DietController
class DietController < ActionController::Base
  layout false

  before_action :set_applet_controller

  private

  def set_applet_controller
    @applet_controller = 'diet'
  end
end
