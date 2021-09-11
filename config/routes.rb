Rails.application.routes.draw do
  
  
  devise_for :customers
  devise_for :admins, path: 'admin'
  
  scope module: :public do
    root :to => 'homes#top'
    get "/homes/about" =>"homes#about"
    # resources :homes, only:[:about]
    resources :items, only:[:show, :index]
    resources :registrations, only:[:new, :create]
    resources :sessions, only:[:new, :create, :destroy]
    resources :customers, only:[:show, :edit, :update, :confirm, :renew]
    resources :cart_items, only:[:index, :update, :remove, :destroy_all, :create]
    resources :orders, only:[:new, :confirm, :thanks, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end
  
  # /admin/~のURLができる
  namespace :admin do
    root :to => 'homes#top'
    # resources :homes, only:[:top]
    resources :items, only:[:new, :create, :index, :show, :edit, :update]
    resources :genres, only:[:create, :index, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:edit, :update]
    resources :order_items, only:[:update]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
