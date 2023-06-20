Rails.application.routes.draw do
  scope module: 'public' do
    get 'customers/show'
    get 'customers/information/edit' => "customers#edit"
    get 'customers/unsubscribe'
  end
  devise_for :customers
  root to: 'homes#top'
  get 'homes/about' => "homes#about"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
