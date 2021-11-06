# frozen_string_literal: true

module Diet
  # Diet::MenuController
  class MenuController < DietController
    before_action :set_today
    before_action :set_selected
    before_action :set_month, only: :calendar

    def index
      respond_to do |format|
        format.turbo_stream
        format.html { render layout: 'application' }
      end
    end

    def calendar
      @days = (@month.beginning_of_month..@month.end_of_month)
    end

    private

    def set_today
      @today = Date.today
    end

    def set_selected
      @selected = params[:selected_id].present? ? Date.strptime(params[:selected_id].to_s, '%Y_%m_%d') : @today
    end

    def set_month
      @month = Date.strptime(params[:id].to_s, '%Y_%m')
    end
  end
end
