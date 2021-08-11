class Admin::HomesController < ApplicationController
  
  def top
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     flash[:notice] = "新商品を登録しました"
     redirect_to admin_item_path(@item.id)
    else
      @categories = Category.all
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
     render :edit
   end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id, :is_active)
  end


end

end
