# frozen_string_literal: true

module Previews
  class RecipeComponent < ViewComponent::Base
    with_collection_parameter :recipe

    def initialize(recipe:, style: :link)
      raise ArgumentError, 'style' unless %i[link].include? style

      @recipe = recipe
      @style = style

      super
    end
  end
end
