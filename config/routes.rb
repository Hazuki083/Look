Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    registrations: "admins/registrations",
    passwords: "admins/passwords",
    sessions: "admins/sessions"
  }
  
  # namespace URL:指定のパスにしたい　ファイル構成：指定のパスにしたい
   namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    get 'sub/categories'
  end

  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    passwords: "customers/passwords",
    registrations: "customers/registrations"
  }
  
# scope URL:指定のパスにしたい　ファイル構成：変えたくない
# module URL:変えたくない　ファイル構成：指定のパスにしたい
 scope module: :customer do
   root "items#top"
   
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
