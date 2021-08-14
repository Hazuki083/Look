class Customer::CustomersController < ApplicationController
   before_action :authenticate_customer!

  def index
  end

  def show
    @customer = Customer.find(current_customer.id)
  end

  def quit
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
       flash[:notice] = "You have updated user successfully."
       redirect_to customers_path(@customer.id)
    else
       render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :age, :skin, :email, :image_id)
  end
end