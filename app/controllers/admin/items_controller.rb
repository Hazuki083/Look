class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @categories = Category.all
    @sub_categories = SubCategory.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
    @sub_categories = SubCategory.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     flash[:notice] = "新商品を登録しました"
     redirect_to admin_item_path(@item.id)
    else
      @categories = Category.all
      @sub_categories = SubCategory.all
      render :new
    end
  end

  def update
   @item = Item.find(params[:id])
   if @item.update(item_params)
      flash[:notice] = "商品内容をを変更しました"
      redirect_to admin_item_path(@item.id)
   else
     @categories = Category.all
     @sub_categories = SubCategory.all
     render :edit
   end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image_id, :price, :category_id, :sub_category_id)
  end


end