Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  get "/categories" => "welcome#categories"

  resources :categories

  resources :baskets



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
