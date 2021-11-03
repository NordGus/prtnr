# frozen_string_literal: true

module Form
  module Input
    class ImageComponent < ViewComponent::Base
      def initialize(form:, attr:, model:, options: {})
        defaults = { preview_data: {}, field_data: {} }

        options = defaults.merge!(options)
        @preview_data = { input_imageable_target: 'preview' }.merge!(options[:preview_data])
        @field_data = field_data(options[:field_data])
        @form = form
        @attr = attr
        @errors = model.errors&.full_messages_for(attr)
        @image = model.send(attr)

        @input_classes = ['file-input']
        @input_classes << 'is-danger' if @errors.present?
        super
      end

      def field_data(filed_data = {})
        base_action = ' change->input-imageable#readFiles'
        data = { input_imageable_target: 'input' }.merge!(filed_data)

        data[:action] = data[:action].present? ? data[:action] + base_action : base_action

        data
      end
    end
  end
end
