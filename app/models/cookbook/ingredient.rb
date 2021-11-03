# frozen_string_literal: true

module Cookbook
  # Cookbook::Ingredient
  class Ingredient < ApplicationRecord
    has_one_attached :cover_image

    before_validation :downcase_name, if: :name_present?
    after_initialize :titleize_name

    validates :name, presence: true, uniqueness: true, allow_blank: false

    has_many :recipe_ingredients, class_name: 'Cookbook::RecipeIngredient', dependent: :destroy, inverse_of: :ingredient

    private

    def name_present?
      name.present?
    end

    def downcase_name
      self.name = name.underscore.strip
    end

    def titleize_name
      self.name = name.titleize if name.present?
    end
  end
end
