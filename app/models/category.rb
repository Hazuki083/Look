class Category < ApplicationRecord
  has_many :items
  
  validates :name, presence: true, uniqueness: true
  # uniquenessで同じ名前を作らないようにする
end
