class Customer::ItemsController < ApplicationController
 before_action :authenticate_customer!

 def top
 end

 def index
  @items = Item.all.page(params[:page]).reverse_order.per(8)
  # reverse_orderで降順
 end

 def show
  @item = Item.find(params[:id])
  @post = Post.new
 end
 
 private
 
 def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :category, :sub_category)
 end 

end
