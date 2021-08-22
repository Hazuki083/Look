class Customer::CustomersController < ApplicationController
   before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
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
       render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :age, :skin, :email, :image)
  end
end