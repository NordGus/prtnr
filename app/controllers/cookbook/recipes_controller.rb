# frozen_string_literal: true

module Cookbook
  # RecipesController main recipes controller
  class RecipesController < CookbookController
    layout false

    before_action :set_recipe, only: %i[show edit update delete destroy]

    def index
      @recipes = Cookbook::Recipe.order(id: :asc).all
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

      redirect_to cookbook_url, method: :get
    end

    private

    def set_recipe
      @recipe = Cookbook::Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :description, :portions, :preparation, :cover_image)
    end
  end
end
