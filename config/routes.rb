Rails.application.routes.draw do

  devise_for :admins, controllers: {
    registrations: "admin/admins/registrations",
    passwords: "admin/admins/passwords",
    sessions: "admin/admins/sessions"
  }

  # namespace URL:指定のパスにしたい　ファイル構成：指定のパスにしたい
   namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :categories, only: [:index, :create, :edit, :update]
    resources :sub_categories, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :show, :edit, :create, :update]
  end

  devise_for :customers, controllers: {
    sessions: "customer/customers/sessions",
    passwords: "customer/customers/passwords",
    registrations: "customer/customers/registrations"
  }

# scope URL:指定のパスにしたい　ファイル構成：変えたくない
# module URL:変えたくない　ファイル構成：指定のパスにしたい
 scope module: :customer do
  root "items#top"
  resources :customers, only: [:show, :edit, :update]
  resources :items, only: [:index, :show]do
  resources :posts, only: [:new, :create, :destroy]
  end
  resources :categories, only: [:index]
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
