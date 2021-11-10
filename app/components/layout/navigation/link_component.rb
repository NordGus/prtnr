# frozen_string_literal: true

module Layout
  module Navigation
    # Layout::Navigation::LinkComponent
    class LinkComponent < ::ViewComponent::Base
      def initialize(url:, text:, icon_name: 'globe', active: false)
        @url = url
        @text = text
        @icon = FontAwesome::Icon::FasComponent.new(icon_name, size: :'4x')
        @class = "nav-link p-1 #{active ? ' is-active' : ''}"

        super
      end
    end
  end
end
