class Item < ApplicationRecord
  attachment :image

  belongs_to :category
  belongs_to :sub_category

  has_many :posts,  dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :likes, dependent: :destroy


  validates :name, :introduction, :price,  presence: true

  # いいね機能
   def liked_by?(current_customer)
    # self.likes.where(customer_id: customer.id).exists?
    likes.where(customer_id: current_customer.id).exists?
    # liked_byで自分が含まれているかどうか判断
    # exists 該当の値があればtrue、なければfalseを返す
   end

   #検索機能
   def Item.search_for(content, how)
     if how == "partical"
       Item.where("name LIKE ?", "%#{content}%")
     elsif how == "forward"
       Item.where("name LIKE ?", "#{content}%")
     elsif how == "backward"
       Item.where("name LIKE?", "%#{content}")
     elsif how == "match"
       Item.where("name LIKE?", "#{content}")
     end
   end
end
