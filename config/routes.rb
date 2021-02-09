Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  get "/categories" => "welcome#categories"

  resources :categories

  resources :baskets

  resources :orders

  post '/categories/increase_quantity', to: 'categories#increase_quantity', as: 'increase_quantity'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
