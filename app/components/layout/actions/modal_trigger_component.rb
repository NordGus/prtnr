# frozen_string_literal: true

module Layout
  module Actions
    # Layout::Actions::ButtonComponent
    class ModalTriggerComponent < ::ViewComponent::Base
      include Bulma::ButtonHelper

      def initialize(action_url, icon: nil, options: {})
        @action_url = action_url
        @icon = icon
        @options = ignition(options)

        super
      end

      private

      def defaults
        {
          color: :default,
          method: :get,
          id: :action_button,
          fullwidth: false,
          show_content: false
        }
      end

      def ignition(options)
        options = defaults.deep_merge(options)

        options[:class] = ignite_class(options[:class], options)
        options[:form_class] = ignite_form_class(options[:form_class], options)


        options
      end

      def ignite_class(class_value, options)
        "#{class_value || ''} button m-0 #{button_colors[options[:color]] || ''} #{options[:fullwidth] ? 'is-fullwidth' : ''}"
      end

      def ignite_form_class(class_value, options)
        "my-0 mr-0 p-0 #{class_value || ''} #{options[:fullwidth] ? 'is-block' : 'is-inline-block'}"
      end
    end
  end
end
