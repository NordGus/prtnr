# frozen_string_literal: true

module Form
  module Input
    module Textarea
      # Form::Input::Textarea::Component
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
            data: {},
            class: '',
            fixed: false
          }
        end

        def ignite_options(options, has_errors)
          merged_options = defaults.deep_merge(options)

          merged_options[:class] = "#{merged_options[:class]} textarea #{merged_options[:fixed] ? 'has-fixed-size' : ''} #{has_errors ? 'is-danger' : ''}"

          merged_options
        end
      end
    end
  end
end
