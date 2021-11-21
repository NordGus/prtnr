# frozen_string_literal: true

module Form
  module Field
    # Form::Field::ErrorComponent
    class ErrorComponent < ::ViewComponent::Base
      with_collection_parameter :message

      def initialize(message:)
        @message = message

        super
      end
    end
  end
end
