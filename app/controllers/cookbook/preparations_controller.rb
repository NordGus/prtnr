# frozen_string_literal: true

module Cookbook
  # PreparationsController is responsible for actions over a recipe's preparation
  class PreparationsController < CookbookController
    before_action :set_recipe

    def edit; end

    def update
      render :edit unless @recipe.update(recipe_params)
    end

    private

    def set_recipe
      @recipe = Cookbook::Recipe.find(params[:recipe_id])
    end

    def recipe_params
      params.require(:recipe).permit(:preparation)
    end
  end
end
