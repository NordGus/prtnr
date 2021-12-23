# frozen_string_literal: true

module Cookbook
  # RecipesController main recipes controller
  class RecipesController < CookbookController
    before_action :set_recipe, only: %i[show edit update delete destroy edit_preparation update_preparation]

    def index
      respond_to do |format|
        format.turbo_stream { @recipes = Cookbook::Recipe.order(id: :asc).all }
        format.html { render layout: 'application' }
      end
    end

    def show
      render layout: 'application'
    end

    def new
      @recipe = Cookbook::Recipe.new
    end

    def edit; end

    def create
      @recipe = Cookbook::Recipe.new(recipe_params)

      render :new unless @recipe.save
    end

    def update
      render :edit unless @recipe.update(recipe_params)
    end

    def delete; end

    def destroy
      @recipe.destroy

      redirect_to cookbook_recipes_url, method: :get
    end

    # Preparation actions

    def edit_preparation; end

    def update_preparation
      render :edit_prepatation unless @recipe.update(preparation_params)
    end

    # Preparation actions

    private

    def set_recipe
      @recipe = Cookbook::Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :description, :servings, :cover_image)
    end

    def preparation_params
      params.require(:recipe).permit(:preparation)
    end
  end
end
