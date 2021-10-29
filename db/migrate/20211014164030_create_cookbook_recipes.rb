class CreateCookbookRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :cookbook_recipes do |t|
      t.string :name, null: false
      t.string :description
      t.integer :portions, default: 0, null: false

      t.timestamps
    end

    add_index :cookbook_recipes, :name, unique: true
  end
end
