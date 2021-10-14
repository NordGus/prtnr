class ApplicationController < ActionController::Base
  def applet
    @navigating = @in_root = true
  end
end
