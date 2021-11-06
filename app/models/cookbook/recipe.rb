# frozen_string_literal: true

module Cookbook
  # Cookbook::Recipe
  class Recipe < ::ApplicationRecord
    has_rich_text :preparation
    has_one_attached :cover_image

    validates :name, presence: true, uniqueness: true, allow_blank: false
    validates :description, length: { maximum: 200 }
    validates :portions, numericality: { greater_than_or_equal_to: 1 }

    has_many :recipe_ingredients, class_name: 'Cookbook::RecipeIngredient', dependent: :destroy
    has_many :menu_items, class_name: 'Diet::Menu::Item', dependent: :destroy, inverse_of: :recipe
  end
end
