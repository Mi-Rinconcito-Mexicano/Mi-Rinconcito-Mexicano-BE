class CreateMenuCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_categories do |t|
      t.string :name
      t.string :description, null: true

      t.timestamps
    end
  end
end
