# frozen_string_literal: true

module Form
  module Input
    class TextareaComponent < ViewComponent::Base
      def initialize(form:, attr:, model:, fixed: false)
        @form = form
        @attr = attr
        @errors = model.errors&.full_messages_for(attr)

        @input_classes = ['textarea']
        @input_classes << 'has-fixed-size' if fixed
        @input_classes << 'is-danger' if @errors.present?

        super
      end
    end
  end
end
