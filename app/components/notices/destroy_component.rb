# frozen_string_literal: true

module Notices
  # Notices::SuccessComponent
  class DestroyComponent < ::ViewComponent::Base
    def initialize(url:)
      raise ArgumentError, 'url' unless url.present?

      @url = url

      super
    end
  end
end
