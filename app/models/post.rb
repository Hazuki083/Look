class Post < ApplicationRecord

  attachment :image

  belongs_to :customer
  belongs_to :item

  validates :review, presence: true

  validates :rate,  presence: true


end
# numericality　数値のみ許可
# less_than指定された値よりも小さいか  equal_to指定された値と等しいか　greater_than指定された値よりも大きいか
