class Customer::LikesController < ApplicationController
  
  def create
    @like = Like.new(customer_id: current_customer.id, item_id: params[:item_id])
    # likes = current_customer.like.new(item_id: item.id)
    @like.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @like = Like.find_by(customer_id: current_customer.id, item_id: params[:item_id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
