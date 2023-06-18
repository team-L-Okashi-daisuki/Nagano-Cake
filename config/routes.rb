Rails.application.routes.draw do
  
  
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/log'
  get 'orders/thanks'
  devise_for :users
  
  resources :orders, only: []
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
