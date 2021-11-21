# frozen_string_literal: true

module Form
  module Field
    # Form::Field::Component
    class Component < ::ViewComponent::Base
      renders_one :label, LabelComponent
      renders_many :controls
      renders_many :helps
      renders_many :errors, ErrorComponent

      def initialize(options: {})
        @options = defaults.deep_merge(options)
        @class = 'field'
        @class += ' is-grouped' if @options[:grouped]

        super
      end

      def defaults
        {
          data: {},
          grouped: false
        }
      end
    end
  end
end
