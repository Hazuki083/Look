class SubCategory < ApplicationRecord
  
  belongs_to :category
  
  has_many :items, dependent: :destroy
  has_many :posts, dependent: :destroy
  
   validates :name, presence: true, uniqueness: true
  # uniquenessで同じ名前を作らないようにする
end

