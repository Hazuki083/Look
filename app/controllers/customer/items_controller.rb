class Customer::ItemsController < ApplicationController


 def top
 end

 def index
  @items = Item.all.page(params[:page]).reverse_order.per(8)
  # reverse_orderで降順
  @rate_avg = {}
  rate_sum = 0
  @items.each do |item|
   item.posts.each do |post|
    rate_sum += post.rate
   end
   @rate_avg[item.id] = item.posts.count == 0 ? 0 : rate_sum / item.posts.count
  end
 end

 def show
  @item = Item.find(params[:id])
  @post = Post.new
  @posts = Post.includes(:customer)
  # includesで関連付けられているモデルをあらかじめ取得しておく。 N +1問題を解決するメソッド
 end

 def destroy
  @post = Post.find(params[:id])
 end

 private

 def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :category, :sub_category)
 end

end
