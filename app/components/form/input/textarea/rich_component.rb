# frozen_string_literal: true

module Form
  module Input
    module Textarea
      # Form::Input::Textarea::RichComponent
      class RichComponent < ViewComponent::Base
        def initialize(form, attr:)
          @form = form
          @attr = attr

          super
        end
      end
    end
  end
end
