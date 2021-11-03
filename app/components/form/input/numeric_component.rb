# frozen_string_literal: true

module Form
  module Input
    # Form::Input::NumericComponent
    class NumericComponent < ViewComponent::Base
      def initialize(form:, attr:, model:, step: 1)
        @step = step
        @form = form
        @attr = attr
        @errors = model.errors&.full_messages_for(attr)

        @input_classes = 'input '
        @input_classes += 'is-danger' if @errors.present?

        super
      end
    end
  end
end
