# frozen_string_literal: true

module Form
  module Input
    module Numeric
      # Form::Input::Numeric::DecrementComponent
      class DecrementComponent < ActionComponent
        def initialize(step: 1)
          options = {
            data: {
              step: step,
              action: 'click->input-numeric#remove'
            },
            class: 'is-danger'
          }

          super text: "-#{step.to_s.gsub('0.', '.')}", options: options
        end
      end
    end
  end
end
