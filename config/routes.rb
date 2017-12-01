Rails.application.routes.draw do
  resources :shipping_addresses
  resources :billing_addresses
  resources :line_items
  resources :carts
  devise_for :users, controllers: {
    confirmations: 'user/confirmations',
    passwords: 'user/passwords',
    registrations: 'user/registrations',
    sessions: 'user/sessions',
    unlocks: 'user/unlocks'
  }
  resources :products
  resources :productlines
  resources :payments
  resources :orders
  resources :orderdetails
  resources :offices
  resources :employees
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: 'products#index'
end
