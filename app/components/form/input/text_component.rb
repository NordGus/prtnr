# frozen_string_literal: true

module Form
  module Input
    class TextComponent < ViewComponent::Base
      def initialize(form:, attr:, model:)
        @form = form
        @attr = attr
        @errors = model.errors&.full_messages_for(attr)

        @input_classes = ['input']
        @input_classes << 'is-danger' if @errors.present?

        super
      end
    end
  end
end
