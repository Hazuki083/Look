class Item < ApplicationRecord
  attachment :image

  belongs_to :category
  belongs_to :sub_category

  validates :name, :introduction, :price,  presence: true
end
