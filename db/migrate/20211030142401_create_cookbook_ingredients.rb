# frozen_string_literal: true

# CreateCookbookIngredients
class CreateCookbookIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :cookbook_ingredients do |t|
      t.string :name, null: false

      t.timestamps

      t.index :name, name: :cookbook_ingredients_name_index, unique: true
    end
  end
end
