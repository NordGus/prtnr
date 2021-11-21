# frozen_string_literal: true

module Form
  module Input
    # Form::Input::ImageComponent
    class ImageComponent < ::ViewComponent::Base
      def initialize(form_builder, attr:, has_errors: false, filename: '', options: {})
        @form = form_builder
        @attr = attr
        @filename = filename
        @options = ignite_options(options, has_errors)

        super
      end

      private

      def defaults
        {
          filename: {
            data: {
              input_imageable_target: 'name',
              cookbook_ingredient_target: 'fileName'
            },
            class: 'file-name'
          },
          input: {
            data: {
              input_imageable_target: 'input'
            },
            class: ''
          }
        }
      end

      def ignite_options(options, has_errors)
        merged_options = defaults.deep_merge(options)

        merged_options[:input][:data][:action] = "#{merged_options[:input][:data][:action]} change->input-imageable#readFiles"
        merged_options[:input][:class] = "#{merged_options[:input][:class]} file-input #{has_errors ? 'is-danger' : ''}"

        merged_options
      end
    end
  end
end
