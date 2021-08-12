class Admin::HomesController < ApplicationController
  # topページ　商品一覧　管理者ログイン遷移先

  def top
    @items = Item.all.page(params[:page]).per(10)
  end
end