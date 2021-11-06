# frozen_string_literal: true

module Diet
  # Cookbook::IngredientsController main recipes controller
  class RecipesController < DietController
    before_action :filter_searches, only: :search

    def search
      @recipes = Cookbook::Recipe.ransack(search_params[:q]).result(distinct: true).limit(6)
    end

    private

    def filter_searches
      search_term = search_params[:q][:name_cont]

      head(:no_content) unless search_term.present?
    end

    def search_params
      params.require(:search).permit(q: [:name_cont])
    end
  end
end
