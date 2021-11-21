class CreateDietMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :diet_menu_items do |t|
      t.belongs_to :recipe,
                   null: false,
                   foreign_key: { to_table: :cookbook_recipes },
                   index: { name: :diet_menu_items_cookbook_recipe_reference }
      t.date       :date, null: false
      t.integer    :servings, null: false, default: 1

      t.timestamps

      t.index :date, name: :diet_menu_items_date_index
    end
  end
end
