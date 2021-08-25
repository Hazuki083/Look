class AddNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :age, :integer
    add_column :customers, :skin, :string
    add_column :customers, :image_id, :string
    add_column :customers, :is_deleted, :boolean, default: false, null: false
    
  end
end
