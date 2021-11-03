# frozen_string_literal: true

module Previews
  # Previews::RecipeIngredientComponent
  class RecipeIngredientComponent < ViewComponent::Base
    with_collection_parameter :recipe_ingredient

    def initialize(recipe_ingredient:, recipe:, style: :link)
      raise ArgumentError, 'style' unless %i[link].include? style

      @recipe_ingredient = recipe_ingredient
      @recipe = recipe
      @style = style

      super
    end
  end
end
