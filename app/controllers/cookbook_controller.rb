# frozen_string_literal: true

class CookbookController < ActionController::Base
  layout 'application'

  before_action :set_applet_controller

  def applet; end

  private

  def set_applet_controller
    @applet_controller = 'cookbook'
  end
end
