# frozen_string_literal: true

module Form
  module Input
    class NumericComponent < ViewComponent::Base
      def initialize(form:, attr:, model:, steps: [1])
        @positive_steps = Array.new(steps.size)
        @negative_steps = Array.new(steps.size)
        @min_step = 0

        steps.sort.each_with_index do |step, idx|
          @positive_steps[idx] = step
          @negative_steps[-(idx + 1)] = step

          @min_step = step if step < @min_step
        end

        @form = form
        @attr = attr
        @errors = model.errors&.full_messages_for(attr)

        @input_classes = ['input']
        @input_classes << 'is-danger' if @errors.present?

        super
      end
    end
  end
end
