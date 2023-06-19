Rails.application.routes.draw do
  
  # homes
  root to: 'homes#top'
  get 'homes/about' => "homes#about"

  scope module: 'public' do
    # items
    get 'items' => "items#index"
    get 'items/show'
  end


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
