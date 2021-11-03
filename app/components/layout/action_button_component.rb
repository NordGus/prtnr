# frozen_string_literal: true

module Layout
  # Layout::ActionButtonComponent
  class ActionButtonComponent < ViewComponent::Base
    include Bulma::ButtonHelper

    def initialize(url, icon_class: nil, id: :action_button, options: {})
      @options = { color: :default, method: :get, fullwidth: false, spaced: true }.merge!(options)

      @url = url
      @button_class = button_class(@options)
      @form_class = form_class(@options)
      @icon_class = icon_class
      @id = id

      super
    end

    def form_class(options = {})
      form_class = 'my-0 mr-0 p-0 '

      form_class += options[:fullwidth] ? 'is-block ' : 'is-inline-block '
      form_class += 'ml-3 ' if options[:spaced] && !options[:fullwidth]

      form_class
    end

    def button_class(options = {})
      button_class = 'button m-0 '
      color = button_colors[options[:color]]

      button_class += 'is-fullwidth ' if options[:fullwidth]
      button_class += color if color.present?

      button_class
    end
  end
end
