# frozen_string_literal: true

module Form
  module Input
    class ImageComponent < ViewComponent::Base
      def initialize(form:, attr:, model:)
        @form = form
        @attr = attr
        @errors = model.errors&.full_messages_for(attr)
        @image = model.send(attr)

        @input_classes = ['file-input']
        @input_classes << 'is-danger' if @errors.present?
        super
      end
    end
  end
end
