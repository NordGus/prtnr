# frozen_string_literal: true

module Form
  module Input
    # Form::Input::TextComponent
    class TextComponent < ::ViewComponent::Base
      def initialize(form_builder, attr:, has_errors: false, options: {})
        @options = defaults.deep_merge(options)
        @form = form_builder
        @attr = attr

        @class = ['input']
        @class << 'is-danger' if has_errors

        super
      end

      private

      def defaults
        { data: {} }
      end
    end
  end
end
