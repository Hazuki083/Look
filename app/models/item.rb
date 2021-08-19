class Item < ApplicationRecord
  attachment :image

  belongs_to :category
  belongs_to :sub_category
  belongs_to :customer

  has_many :posts,  dependent: :destroy
  has_many :customer, dependent: :destroy

  validates :name, :introduction, :price,  presence: true
  
end
