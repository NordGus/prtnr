# frozen_string_literal: true

module Form
  module Field
    # Form::Field::ImageComponent
    class ImageComponent < ::ViewComponent::Base
      renders_many :helps
      renders_many :errors, ErrorComponent

      def initialize(form_builder, attr:, image: nil, has_errors: false, options: {})
        @form = form_builder
        @image = image
        @attr = attr
        @options = ignite_options(options)
        @has_errors = has_errors

        super
      end

      private

      def defaults
        {
          data: { controller: 'input-imageable' },
          class: 'field',
          grouped: false,
          preview: {
            data: {
              input_imageable_target: 'preview'
            }
          },
          filename: {},
          input: {}
        }
      end

      def ignite_options(options)
        defaults.deep_merge(options)
      end
    end
  end
end
