# frozen_string_literal: true

module Layout
  class ModalComponent < ViewComponent::Base
    def initialize(expanded: false)
      @expanded = expanded

      super
    end
  end
end
