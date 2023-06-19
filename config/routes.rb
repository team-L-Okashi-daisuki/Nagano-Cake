Rails.application.routes.draw do
  
  
  namespace :public do
   
    get 'orders/log'
    get 'orders/thanks'
  end
  devise_for :users
  
  resources :orders, only: [:new, :create, :index, :show] do
    post "log" => "orders#log"
    get "thanks" => "orders#thanks"
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
