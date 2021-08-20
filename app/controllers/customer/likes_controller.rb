class Customer::LikesController < ApplicationController
  
  def create
    item = Item.find(prams[:item.id])
    likes = current_customer.like.new(item_id: item.id)
    likes.save
    redirect_to item_path(item)
  end
  
  def destroy
    item = Item.find(prams[:item.id])
    
  end

end
