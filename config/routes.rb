Rails.application.routes.draw do
  root to: 'home#index'
  resources :items, only: [:index, :show]
  resources :categories, only: [:show]
  resources :brands, only: [:show]
  resources :cart_items, only: [:create, :destroy, :update]
  patch '/cart_quantity', to: 'cart_items#quantity'
  resources :users, only: [:new, :create] do
    resources :rentals, only: [:index, :create, :show]
  end
  namespace :admin do
    resources :categories, only: [:new]
  end
  get '/admin/dashboard', to: 'admin#show'
  get '/dashboard', to: 'users#show'
  get '/cart', to: 'cart#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
