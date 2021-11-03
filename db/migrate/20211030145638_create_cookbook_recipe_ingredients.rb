# frozen_string_literal: true

# CreateCookbookRecipeIngredients
class CreateCookbookRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :cookbook_recipe_ingredients do |t|
      t.belongs_to :recipe,     null: false, foreign_key: { to_table: :cookbook_recipes },     index: { name: :recipe_ingredient_recipe_reference }
      t.belongs_to :ingredient, null: false, foreign_key: { to_table: :cookbook_ingredients }, index: { name: :recipe_ingredient_ingredient_reference }
      t.belongs_to :unit,       null: false, polymorphic: true,                                index: { name: :recipe_ingredient_unit_reference }

      t.decimal    :amount,     null: false, default: 0, precision: 10, scale: 3

      t.timestamps
    end

    add_index :cookbook_recipe_ingredients, %i[unit_id unit_type]
  end
end
