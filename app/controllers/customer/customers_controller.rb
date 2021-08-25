class Customer::CustomersController < ApplicationController
   before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
    @items = @customer.items
    likes = Like.where(customer_id: @customer.id).pluck(:item_id) #pluckはDBからデータを取り出すメソッド
    @like_items = Item.find(likes)
  end

  def edit
    @customer = Customer.find(current_customer.id)
    if @customer != current_customer
       redirect_to customers_path(current_customer.id)
    end
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
       flash[:notice] = "マイページが更新されました"
       redirect_to customer_path
    else
       render :show
    end
  end
  
  def out
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true) #defaultはfalse
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  
  private

  def customer_params
    params.require(:customer).permit(:name, :age, :skin, :email, :image)
  end
end