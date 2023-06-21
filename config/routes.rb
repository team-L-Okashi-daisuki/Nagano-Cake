Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => "homes#about"

  devise_for :customers
  scope module: 'public' do
    get 'customers/show'
    get 'customers/information/edit' => "customers#edit"
    get 'customers/unsubscribe'
    resources :customers, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
