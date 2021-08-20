class Customer::LikesController < ApplicationController
  
  def create
    @like = Like.new(customer_id: current_customer.id, item_id: params[:item_id])
    @like.save
    # redirect_back(fallback_location: root_path)非同期通信のため使わない
  end
  
  def destroy
    @like = Like.find_by(customer_id: current_customer.id, item_id: params[:item_id])
    @like.destroy
    # redirect_back(fallback_location: root_path)非同期通信のため使わない
  end

end
