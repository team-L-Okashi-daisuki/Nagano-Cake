Rails.application.routes.draw do


  devise_for :users

  resources :orders, only: [:new, :create, :index, :show] do

      post "confirm" => "orders#confirm"
      get "thanks" => "orders#thanks"

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
