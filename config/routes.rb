Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end

  root to: 'homes#top'
  get 'homes/about' => "homes#about"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
