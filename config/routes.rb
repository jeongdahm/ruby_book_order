Rails.application.routes.draw do
  get 'orders/index'

  get 'orders/show'

  devise_for :users
  devise_for :admin_users
  ActiveAdmin.routes(self)
  resources :products, only: [:index, :show]
 # resources :books
  resources :providers , only: [:index, :show]
  resources :homes
  resources :cart
  resources :orders
 
 root 'products#index'
end
