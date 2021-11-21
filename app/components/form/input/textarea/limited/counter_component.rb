# frozen_string_literal: true

module Form
  module Input
    module Textarea
      module Limited
        # Form::Input::Textarea::Limited::CounterComponent
        class CounterComponent < ::ViewComponent::Base
          def initialize(limit:, length:)
            @limit = limit
            @length = length || 0

            super
          end
        end
      end
    end
  end
end
