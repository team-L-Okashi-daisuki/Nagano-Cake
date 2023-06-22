Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
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
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
