# frozen_string_literal: true

module Notices
  # Notices::SuccessComponent
  class DestroyComponent < ::ViewComponent::Base
    def initialize(url:, success_url:)
      raise ArgumentError, 'url' unless url.present?
      raise ArgumentError, 'success_url' unless success_url.present?

      @url = url
      @success_url = success_url

      super
    end
  end
end
