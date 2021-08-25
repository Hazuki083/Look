class Customer::ItemsController < ApplicationController

 def top
  @items = Item.includes(:posts).find(Post.group(:rate).order('avg(rate) desc').pluck(:item_id))#.limit(10)
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
  if params[:category] != nil
   @items = Item.where(category_id: params[:category])
  elsif params[:sub_category] != nil
   @items = Item.where(sub_category_id: params[:sub_category])
  elsif params[:customer_id].present?
    @customer = Customer.find(params[:customer_id]) #カスタマーを呼び出す
    @items = @customer.items #カスタマーがいいねした商品の紐付け
  else
   @items = Item.all
  end
  @items = @items.page(params[:page]).reverse_order.per(10)
  # reverse_orderで降順
  #平均の算出
  @rate_avg = {}
  @items.each do |item|
   rate_sum = 0 #基準をゼロに戻すため
   item.posts.each do |post|
    rate_sum += post.rate
   end
   @rate_avg[item.id] = item.posts.count == 0 ? 0 : rate_sum / item.posts.count #条件演算子を使っている
  end
 end

 def show
  @item = Item.find(params[:id])
  @post = Post.new
  @posts = Post.includes(:customer).page(params[:page]).reverse_order.per(10)
  # includesで関連付けられているモデルをあらかじめ取得しておく。 N +1問題を解決するメソッド
 end

 def destroy
  @post = Post.find(params[:id])
 end


 def search
#  @item = Item.find(params[:item_id])
  if params['search'] == nil
   params['search'] = {'content' => "", 'how' => "match"}
  end
  @content = params['search']['content']
  @how = params['search']['how']
  @items = Item.search_for(@content, @how).page(params[:page]).reverse_order.per(10)
  # reverse_orderで降順
  #平均の算出
  @rate_avg = {}
  @items.each do |item|
   rate_sum = 0 #基準をゼロに戻すため
   item.posts.each do |post|
    rate_sum += post.rate
  end
   @rate_avg[item.id] = item.posts.count == 0 ? 0 : rate_sum / item.posts.count #条件演算子を使っている
  end
  render :index
 end

 private

 def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :category, :sub_category)
 end

end
