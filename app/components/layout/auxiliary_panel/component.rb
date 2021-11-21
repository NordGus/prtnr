# frozen_string_literal: true

module Layout
  module AuxiliaryPanel
    # Layout::AuxiliaryPanel::Component
    class Component < ::ViewComponent::Base
      def initialize(expanded: false)
        @expanded = expanded

        super
      end
    end
  end
end
