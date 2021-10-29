# frozen_string_literal: true

module Layout
  # Layout::CloseModalComponent
  class CloseModalComponent < ViewComponent::Base
    def initialize(text: 'Cancel', color: nil)
      raise ArgumentError, 'color' if color.present? && !color_class(color).present?

      @text = text
      @color = color_class(color)

      super
    end

    def color_class(color)
      supported_colors[color]
    end

    def supported_colors
      {
        primary: 'is-primary',
        link: 'is-link',
        info: 'is-info',
        success: 'is-success',
        warning: 'is-warning',
        danger: 'is-danger'
      }
    end
  end
end
