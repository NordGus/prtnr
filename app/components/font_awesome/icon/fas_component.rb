# frozen_string_literal: true

module FontAwesome
  module Icon
    # FontAwesome::Icon::FasComponent
    class FasComponent < ViewComponent::Base
      include Icon

      def initialize(icon_name, size: :default)
        @class = "fas fa-#{icon_name} #{size_class[size]}"

        super
      end
    end
  end
end
