# frozen_string_literal: true

# CreateCookbookIngredients
class CreateCookbookIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :cookbook_ingredients do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :cookbook_ingredients, :name, unique: true
  end
end
