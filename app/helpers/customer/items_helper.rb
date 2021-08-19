module Customer::ItemsHelper
  
  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
    # liked_byで自分が含まれているかどうか判断
    # exists 該当の値があればtrue、なければfalseを返す
  end
end
