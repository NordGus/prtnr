class CreateCookbookRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :cookbook_recipes do |t|
      t.string :name, null: false
      t.string :description
      t.integer :servings, default: 0, null: false

      t.timestamps

      t.index :name, name: :cookbook_recipes_name_index, unique: true
    end
  end
end
