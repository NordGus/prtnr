# frozen_string_literal: true

# FormsHelper
module FormsHelper
  def errors_for?(model, attr)
    model.errors[attr].any?
  end

  def formatted_errors(model, attr)
    model.errors&.full_messages_for(attr)&.map { |msg| { message: msg } }
  end
end
