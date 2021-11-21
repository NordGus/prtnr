# frozen_string_literal: true

module Form
  module Input
    # Form::Input::SelectComponent
    class SelectComponent < ::ViewComponent::Base
      def initialize(form, attr:, collection_class:, has_errors: false, options: {})
        @form = form
        @attr = attr
        @collection_class = collection_class
        @options = ignite_options(options, has_errors)

        super
      end

      private

      def defaults
        {
          selected: nil,
          class: ''
        }
      end

      def ignite_options(options, has_errors)
        merged_options = defaults.deep_merge(options)

        merged_options[:class] = "select is-fullwidth #{merged_options[:class]} #{has_errors ? 'is-danger' : ''}"

        merged_options
      end
    end
  end
end
