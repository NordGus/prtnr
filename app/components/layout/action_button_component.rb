# frozen_string_literal: true

module Layout
  # Layout::ActionButtonComponent
  class ActionButtonComponent < ViewComponent::Base
    include Bulma::ButtonHelper

    def initialize(url:, icon_class:, color: :default, method: :get, id: :action_button)
      @url = url
      @button_class = %w[button m-0]
      @form_class = %w[ml-3 my-0 mr-0 p-0 is-inline-block]
      @method = method
      @icon_class = icon_class
      @id = id

      @button_class << button_colors[color] if button_colors[color].present?

      super
    end
  end
end
