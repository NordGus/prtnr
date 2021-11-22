# frozen_string_literal: true

module Form
  module Field
    # Form::Field::LabelComponent
    class LabelComponent < ::ViewComponent::Base
      def initialize(form_builder, attr:, text: nil)
        @form = form_builder
        @attr = attr
        @text = text

        super
      end
    end
  end
end
