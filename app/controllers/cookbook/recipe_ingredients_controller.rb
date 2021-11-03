# frozen_string_literal: true

module Cookbook
  # RecipeIngredientsController main recipes controller
  class RecipeIngredientsController < CookbookController
    layout false

    before_action :set_recipe
    before_action :set_recipe_ingredient, only: %i[edit update delete destroy]

    def index
      @recipe_ingredients = @recipe.recipe_ingredients.order(id: :asc).all
    end

    def new
      @recipe_ingredient = Cookbook::RecipeIngredient.new recipe: @recipe, ingredient: Cookbook::Ingredient.new
    end

    def edit; end

    def create
      @recipe_ingredient = @recipe.recipe_ingredients.build(create_params)

      render :new unless @recipe_ingredient.save
    end

    def update
      render :edit unless @recipe_ingredient.update(update_params)
    end

    def delete; end

    def destroy
      @recipe_ingredient.destroy
    end

    private

    def set_recipe
      @recipe = Cookbook::Recipe.find(params[:recipe_id])
    end

    def set_recipe_ingredient
      @recipe_ingredient = @recipe.recipe_ingredients.from_recipe.find(params[:id])
    end

    def update_params
      params.require(:recipe_ingredient).tap do |p|
        p[:unit_type], p[:unit_id] = p[:unit].split('#id=')

        if p[:ingredient_attributes][:id].present? && @recipe_ingredient.ingredient_id.to_s != p[:ingredient_attributes][:id].to_s
          p[:ingredient_id] = p[:ingredient_attributes][:id]

          p.delete(:ingredient_attributes)
        end

      end.permit(:amount, :unit_type, :unit_id, :ingredient_id, ingredient_attributes: %i[id name cover_image])
    end

    def create_params
      params.require(:recipe_ingredient).tap do |p|
        p[:unit_type], p[:unit_id] = p[:unit].split('#id=')

        if p[:ingredient_attributes][:id].present?
          p[:ingredient_id] = p[:ingredient_attributes][:id]

          p.delete(:ingredient_attributes)
        end

      end.permit(:amount, :unit_type, :unit_id, :ingredient_id, ingredient_attributes: %i[name cover_image])
    end
  end
end
