class Admin::SubCategoriesController < ApplicationController
  
   def index
    @sub_categories = SubCategory.all
    @sub_category = SubCategory.new
  end
  
  def create
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      redirect_to admin_sub_categories_path
    end
  end
  
  def edit
     @sub_category = SubCategory.find(params[:id])
  end
  
  def update
    @sub_category = SubCategory.find(params[:id])
    if @sub_category.update(sub_category_params)
      redirect_to admin_sub_categories_path
    end
  end
  
  private
  
  def sub_category_params
    params.require(:sub_category).permit(:name)
  end
  
end

