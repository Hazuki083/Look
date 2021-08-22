class Customer::ItemsController < ApplicationController

 def top
  @items = Item.find(Post.group(:rate).order('avg(rate) desc').pluck(:item_id)).limit(10)
  @rate_avg = {}
  @items.each do |item|
   rate_sum = 0
   item.posts.each do |post|
    rate_sum += post.rate
   end
   @rate_avg[item.id] = item.posts.count == 0 ? 0 : rate_sum / item.posts.count #条件演算子を使って平均値を算出
  end
 end

 def index
  @items = Item.all.page(params[:page]).reverse_order.per(8)
  # reverse_orderで降順
  @rate_avg = {}
  @items.each do |item|
   rate_sum = 0
   item.posts.each do |post|
    rate_sum += post.rate
   end
   @rate_avg[item.id] = item.posts.count == 0 ? 0 : rate_sum / item.posts.count #条件演算子を使って平均値を算出
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
