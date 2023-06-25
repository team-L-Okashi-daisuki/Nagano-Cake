Rails.application.routes.draw do

  #devise_for :admins
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
    resources :orders, only: [:show, :update]
    get "/" => "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :create, :new, :show, :edit, :update]
    resources :order_details, only: [:update]
    get "/search" => "items#search"
  end

  root to: 'homes#top'
  get 'homes/about' => "homes#about"

  devise_for :customers, skip: [:passwords],  controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: 'public' do
    get 'customers/show'
    get 'customers/information/edit' => "customers#edit"
    get 'customers/unsubscribe'
    patch 'customers/withdraw' => "customers#withdraw"
    resources :customers, only: [:update]
    resources :items, only: [:index, :show]
    delete "/cart_items/destroy_all" => "cart_items#all_destroy"
    resources :cart_items, only: [:index, :update, :destroy, :create]

  end

  scope module: 'public' do
    resources :orders, only: [:new, :create, :index, :show] do
      post "confirm" => "orders#confirm"
      get "thanks" => "orders#thanks"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
