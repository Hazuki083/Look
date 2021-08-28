class AddCtegoryIdToSubCetegories < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_categories, :category_id, :string
  end
end
