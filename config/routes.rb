Rails.application.routes.draw do

  namespace :admin do
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
    
    get 'orders/show'
  end

  root to: 'homes#top'
  get 'homes/about' => "homes#about"

  devise_for :customers, skip: [:passwords],  controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: 'public' do
    resources :items, only: [:index, :show]
    get 'customers/show'
    get 'customers/information/edit' => "customers#edit"
    get 'customers/unsubscribe'
    patch 'customers/withdraw' => "customers#withdraw"
    resources :customers, only: [:update]
    resources :items, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
