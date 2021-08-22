class Customer::CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
    @sub_categories = SubCategory.all
    # @category = Category.where(category.id).page(params[:page]).per(10)
    
  end
end
