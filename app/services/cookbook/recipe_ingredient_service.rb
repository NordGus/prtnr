# frozen_string_literal: true

module Cookbook
  # Cookbook::RecipeIngredientService
  class RecipeIngredientService
    def initialize(recipe:, recipe_ingredient: nil)
      @recipe = recipe
      @recipe_ingredient = recipe_ingredient
    end

    def create_build(params)
      @recipe.recipe_ingredients.build create_params(params)
    end

    def update(params)
      @recipe_ingredient.update update_params(params)
    end

    private

    def ingredient_id_present?(params)
      params[:ingredient_attributes][:id].present?
    end

    def create_params(params)
      return params.tap { |par| par.delete(:ingredient_id) } unless ingredient_id_present?(params)

      params.tap { |par| par[:ingredient_id] = par[:ingredient_attributes][:id] }
    end

    def update_params(params)
      return params.tap { |par| par.delete(:ingredient_id) } unless ingredient_id_present?(params)
      return params unless @recipe_ingredient.ingredient_id.to_s != params[:ingredient_attributes][:id].to_s

      params.tap { |par| par[:ingredient_id] = par[:ingredient_attributes][:id] }
    end
  end
end
