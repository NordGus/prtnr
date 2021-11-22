# frozen_string_literal: true

module Form
  module Input
    module Date
      # Form::Input::Date::Component
      class Component < ::ViewComponent::Base
        def initialize(form_builder, attr:, has_errors: false, options: {})
          @options = defaults.deep_merge(options)
          @form = form_builder
          @attr = attr

          @options = ignite_options(options, has_errors)

          super
        end

        private

        def defaults
          {
            data: {},
            class: ''
          }
        end

        def ignite_options(options, has_errors)
          merged_options = defaults.deep_merge(options)

          merged_options[:class] = "input #{has_errors ? 'is-danger' : ''}"

          merged_options
        end
      end
    end
  end
end
