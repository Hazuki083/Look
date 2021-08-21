class Category < ApplicationRecord
  
  has_many :sub_categories, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  # uniquenessで同じ名前を作らないようにする
end
