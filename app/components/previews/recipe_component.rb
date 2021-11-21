# frozen_string_literal: true

module Previews
  # Previews::RecipeComponent
  class RecipeComponent < ::ViewComponent::Base
    with_collection_parameter :recipe

    def initialize(recipe:, style: :link, options: {})
      raise NotImplementedError, "style #{style}" unless %i[link search].include? style

      @recipe = recipe
      @style = style
      @options = options

      super
    end
  end
end
