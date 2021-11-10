# frozen_string_literal: true

module Layout
  module Navigation
    class Component < ::ViewComponent::Base
      renders_many :links, LinkComponent

      def initialize(visible: false, in_root: false)
        @in_root = in_root
        @class = 'navigation has-background-primary is-flex is-flex-direction-column is-justify-content-space-evenly is-align-items-center is-relative'
        @class += ' is-hidden' unless visible

        super
      end

      def in_root?
        @in_root
      end
    end
  end
end
