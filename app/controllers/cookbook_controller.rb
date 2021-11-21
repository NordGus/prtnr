# frozen_string_literal: true

# CookbookController
class CookbookController < ActionController::Base
  include FormsHelper

  layout false

  before_action :set_applet_controller

  private

  def set_applet_controller
    @applet_controller = 'cookbook'
  end
end
