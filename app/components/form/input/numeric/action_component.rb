# frozen_string_literal: true

module Form
  module Input
    module Numeric
      # Form::Input::Numeric::ActionComponent
      class ActionComponent < ::ViewComponent::Base
        def initialize(text:, options: {})
          @text = text
          @options = ignite_options(options)

          super
        end

        private

        def defaults
          {
            data: {
              step: 1
            },
            class: ''
          }
        end

        def ignite_options(options)
          merged_options = defaults.deep_merge(options)

          merged_options[:class] = "button #{merged_options[:class]}"

          merged_options
        end
      end
    end
  end
end
