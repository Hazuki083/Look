class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :introduction
      t.integer :category_id
      t.string :name
      t.string :image_id
      t.integer :price

      t.timestamps
    end
  end
end
