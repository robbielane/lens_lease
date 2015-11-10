Rails.application.routes.draw do
  root to: 'home#index'
  resources :items, only: [:index, :show]
  resources :categories, only: [:show]
  resources :cart_items, only: [:create, :destroy]
  get '/cart', to: 'cart#index'
end
