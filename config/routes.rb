Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  get "/categories" => "welcome#categories"

  resources :categories

  resources :baskets

  get '/orders/success/:id', to: 'orders#success', as: 'orders_success'
  
  get '/orders/fail', to: 'orders#fail', as: 'orders_fail'

  get '/orders/confirm', to: 'orders#confirm', as: 'orders_confirm'

  resources :orders

  post '/charges/webhook', to: 'charges#webhook', as: 'charges_webhook'

  resources :charges

  post '/charges/create_checkout_session', to: 'charges#create_checkout_session', as: 'create_checkout_session'

  post '/categories/increase_quantity', to: 'categories#increase_quantity', as: 'increase_quantity'

  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
