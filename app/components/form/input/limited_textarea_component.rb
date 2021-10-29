# frozen_string_literal: true

module Form
  module Input
    class LimitedTextareaComponent < TextareaComponent
      def initialize(form:, attr:, model:, limit:, fixed: false)
        raise ArgumentError, 'limit must greater than 0' unless limit.positive?

        @limit = limit
        @length = model.send(attr)&.length || 0

        super form: form, attr: attr, model: model, fixed: fixed
      end
    end
  end
end
