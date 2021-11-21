# frozen_string_literal: true

module Form
  module Field
    # Form::Field::LabelComponent
    class LabelComponent < ::ViewComponent::Base
      def initialize(form_builder, attr:)
        @form = form_builder
        @attr = attr

        super
      end
    end
  end
end
