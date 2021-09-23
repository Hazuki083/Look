class Post < ApplicationRecord

  attachment :image

  belongs_to :customer
  belongs_to :item

  validates :review, presence: true
  validates :rate,  presence: true

end
