class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.string :description, null: true
      t.float :price, null: false
      t.references :menu_category, null: false, foreign_key: true
      t.text :extra
      t.text :tags

      t.timestamps
    end
  end
end
