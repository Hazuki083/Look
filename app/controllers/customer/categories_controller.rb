class Customer::CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
    @sub_categories = SubCategory.all
  end
end
