class Customer::CategoriesController < ApplicationController

  def index
    @categories = Category.preload(:sub_categories).all
    # preloadで事前にサブカテゴリーを取得しておく。
    
    # @sub_category = SubCategory.find(params[:id])
    # @category1 = Category.where(sub_category_id: @sub_category.id, category: 'スキンケア')
    # @category2 = Category.where(sub_category_id: @sub_category.id, category: 'ヘアケア')
    # @category3 = Category.where(sub_category_id: @sub_category.id, category: 'ボディケア')
    # @category4 = Category.where(sub_category_id: @sub_category.id, category: 'メイク')
  end

   private

 def sub_category_params
   params.require(:sub_category).permit(:name, :category)
 end
end
