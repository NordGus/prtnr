# frozen_string_literal: true

module Layout
  module AuxiliaryPanel
    module Buttons
      # Layout::AuxiliaryPanel::ButtonsCloseComponent
      class CloseComponent < ::ViewComponent::Base
        include Bulma::ButtonHelper

        def initialize(text: 'Cancel', color: :default)
          @text = text
          @class = "button #{button_colors[color]}"

          super
        end
      end
    end
  end
end
