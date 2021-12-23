# frozen_string_literal: true

module Cookbook
  # Cookbook::RecipeIngredient
  class RecipeIngredient < ApplicationRecord
    belongs_to :recipe, class_name: 'Cookbook::Recipe', foreign_key: :recipe_id
    belongs_to :ingredient, class_name: 'Cookbook::Ingredient', foreign_key: :ingredient_id, inverse_of: :recipe_ingredients
    belongs_to :unit, polymorphic: true

    validates :amount, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: BigDecimal(10, 3) }
    validate :unit_type_must_be_implemented_in_code

    accepts_nested_attributes_for :ingredient, allow_destroy: false

    scope :from_recipe, -> { includes(:ingredient, :unit) }

    private

    def permitted_unit_type?
      [
        Inventory::Unit::Amount.name,
        Inventory::Unit::Volumetric.name,
        Inventory::Unit::Weight.name
      ].include?(unit_type)
    end

    def unit_type_must_be_implemented_in_code
      return unless unit_type.present?
      return if permitted_unit_type?

      errors.add(:unit, :invalid)
    end
  end
end
