class Post < ApplicationRecord
  
  attachment :image
  
  belongs_to :customer
  belongs_to :item
end
