# frozen_string_literal: true

module Form
  module Input
    class TextComponent < ViewComponent::Base
      def initialize(form:, attr:, model:, options: {})
        defaults = { data: {} }

        @options = defaults.deep_merge(options)
        @form = form
        @attr = attr
        @errors = model&.errors&.full_messages_for(attr)

        @input_classes = ['input']
        @input_classes << 'is-danger' if @errors.present?

        super
      end
    end
  end
end
