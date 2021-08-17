class Item < ApplicationRecord
  attachment :image

  belongs_to :category
  belongs_to :sub_category
  
  has_many :posts,  dependent: :destroy

  validates :name, :introduction, :price,  presence: true
end
