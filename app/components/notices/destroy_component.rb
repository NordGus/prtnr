# frozen_string_literal: true

module Notices
  # Notices::SuccessComponent
  class DestroyComponent < ::ViewComponent::Base
    def initialize(url:, data: {})
      raise ArgumentError, 'url' unless url.present?

      @data = { destroyable_target: 'button', action: '' }.merge!(data)
      @data[:action] += ' click->layout#requestFromButton click->destroyable#destroy'
      @url = url

      super
    end
  end
end
