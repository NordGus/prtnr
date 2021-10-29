class ApplicationController < ActionController::Base
  before_action :layout_state

  def applet; end

  private

  def layout_state
    @navigating = @in_root = true
  end
end
