# frozen_string_literal: true

# DietController
class DietController < ActionController::Base
  layout 'application'

  before_action :set_applet_controller

  def applet
    @today = Date.today
  end

  private

  def set_applet_controller
    @applet_controller = 'diet'
  end
end
