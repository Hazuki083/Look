class AddSubCategoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sub_category_id, :string
    
  end
end
