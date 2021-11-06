# frozen_string_literal: true

# CreateCookbookRecipeIngredients
class CreateCookbookRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :cookbook_recipe_ingredients do |t|
      t.belongs_to :recipe,
                   null: false,
                   foreign_key: { to_table: :cookbook_recipes },
                   index: { name: :cookbook_recipe_ingredients_cookbook_recipe_reference }
      t.belongs_to :ingredient,
                   null: false,
                   foreign_key: { to_table: :cookbook_ingredients },
                   index: { name: :cookbook_recipe_ingredients_cookbook_ingredient_reference }
      t.belongs_to :unit,
                   null: false,
                   polymorphic: true,
                   index: { name: :cookbook_recipe_ingredients_inventory_unit_reference }
      t.decimal    :amount,
                   null: false,
                   default: 0,
                   precision: 10,
                   scale: 3
      t.timestamps
    end
  end
end
