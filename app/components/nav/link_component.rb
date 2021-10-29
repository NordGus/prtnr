# frozen_string_literal: true

module Nav
  class LinkComponent < ViewComponent::Base
    def initialize(url:, text:, icon_class: [], active: false)
      @url = url
      @text = text
      @html_class = %w[nav-link p-1]
      @icon_class = %w[fa-4x]

      @html_class << 'is-active' if active
      @icon_class += icon_class

      super
    end
  end
end
