class AddIsDeletedToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_deleted, :datetime
  end
end
