# frozen_string_literal: true

module Form
  module Input
    class RichTextareaComponent < ViewComponent::Base
      def initialize(form:, attr:, model:)
        @form = form
        @attr = attr
        @model = model

        super
      end
    end
  end
end
