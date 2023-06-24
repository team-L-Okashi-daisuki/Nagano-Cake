Rails.application.routes.draw do


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

  scope module: 'public' do
    resources :orders, only: [:new, :create, :index, :show] do
      post "confirm" => "orders#confirm"
      get "thanks" => "orders#thanks"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
