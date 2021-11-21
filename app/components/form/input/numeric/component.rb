# frozen_string_literal: true

module Form
  module Input
    module Numeric
      # Form::Input::Numeric::Component
      class Component < ::ViewComponent::Base
        def initialize(form_builder, attr:, has_errors: false, options: {})
          @form = form_builder
          @attr = attr
          @options = ignite_options(options, has_errors)

          super
        end

        private

        def defaults
          {
            data: {
              input_numeric_target: 'input',
              action: ''
            },
            class: '',
            step: 1
          }
        end

        def ignite_options(options, has_errors)
          merged_options = defaults.deep_merge(options)

          merged_options[:class] = "#{merged_options[:class]} input #{has_errors ? 'is-danger' : ''}"
          merged_options[:data][:action] = "#{merged_options[:data][:action]} change->input-numeric#validate"

          merged_options
        end
      end
    end
  end
end
