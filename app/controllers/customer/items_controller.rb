class Customer::ItemsController < ApplicationController

 def top
  @items = Item.includes(:posts).find(Post.group(:rate).order('avg(rate) desc').pluck(:item_id))#.limit(10)
  @rate_avg = get_rate_avg(Item.where(id:@items))
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
  @items = @items.includes(:posts).page(params[:page]).reverse_order.per(10)
  # reverse_orderで降順
  #平均の算出
  @rate_avg = @rate_avg = get_rate_avg(@items)
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
  # reverse_orderで降順
  @items = Item.search_for(@content, @how).page(params[:page]).reverse_order.per(10)
  #平均の算出
  @rate_avg = get_rate_avg(@items)


  # @items.each do |item|
  #   rate_sum = 0 #基準をゼロに戻すため
  #   item.posts.each do |post|
  #     rate_sum += post.rate
  #   end
  #   @rate_avg[item.id] = item.posts.count == 0 ? 0 : rate_sum / item.posts.count #条件演算子を使っている
  # end
  render :index
 end

 private
 def get_rate_avg(items)
   rate_avg = {}
   items.left_joins(:posts).group(:id).sum("posts.rate").each do |key,value|
     rate_avg[key] = value == 0 ? 0 : value / Post.where(item_id:key).count
   end
   return rate_avg
 end

 def item_params
   params.require(:item).permit(:name, :image, :introduction, :price, :category, :sub_category, :rate)
 end

 def likes_params
  params.require(:like).permit(:item_id, :cutomer_id)
 end

end