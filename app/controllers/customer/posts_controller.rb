class Customer::PostsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @item = Item.find(params[:item_id])
    @post = Post.new
    # binding.pry
  end

  def create
    @item = Item.find(params[:item_id])
    @post = current_customer.posts.new(post_params)
    @post.item_id = @item.id
    @customers = @item.customers
    if @post.save
      flash[:notice]="レビューを投稿しました"
      redirect_to controller: :items, action: :top
    else
     render :new 
    end
  end

   def destroy
     @post = Post.find_by(id: params[:id], item_id: params[:item_id]).destroy
     @item = Item.find(params[:item_id])
      flash[:notice]="レビューを削除しました"
      redirect_to controller: :items, action: :top
   end


  private

  def post_params
  params.require(:post).permit(:review, :image, :rate)
  end

end
