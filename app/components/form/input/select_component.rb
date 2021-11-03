# frozen_string_literal: true

module Form
  module Input
    # Form::Input::SelectComponent
    class SelectComponent < ViewComponent::Base
      def initialize(form:, attr:, model:, collection_class:)
        @form = form
        @attr = attr
        @model = model
        @errors = model.errors&.full_messages_for(attr)
        @collection_class = collection_class

        @input_classes = 'select is-fullwidth '
        @input_classes += 'is-danger' if @errors.present?

        super
      end
    end
  end
end
