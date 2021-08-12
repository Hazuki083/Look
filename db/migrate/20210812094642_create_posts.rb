class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :customer_id
      t.integer :item_id
      t.integer :image_id
      t.text :review
      t.string :value

      t.timestamps
    end
  end
end
