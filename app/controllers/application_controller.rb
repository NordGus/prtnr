# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include FormsHelper

  before_action :layout_state

  def applet; end

  private

  def layout_state
    @navigating = @in_root = true
  end
end
