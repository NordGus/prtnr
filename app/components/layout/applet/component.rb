# frozen_string_literal: true

module Layout
  module Applet
    # Layout::Applet::Component
    class Component < ViewComponent::Base
      renders_one :applet
      renders_one :controls

      def initialize(data_controller:, visible: false, in_root: false)
        @class = "applet #{visible ? '' : 'is-hidden'}"
        @in_root = in_root
        @data_controller = data_controller

        super
      end

      def render?
        !@in_root
      end
    end
  end
end
