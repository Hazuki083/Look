class Like < ApplicationRecord
  
  validates :customer_id, presence: true, uniqueness: {scope: :item_id}
  validates :item_id, presence: true

  belongs_to :customer
  belongs_to :item
  
end

