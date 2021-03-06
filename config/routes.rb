Rails.application.routes.draw do
  root to: 'home#index'
  resources :items, only: [:index, :show]
  resources :brands, only: [:show], param: :name
  resources :cart_items, only: [:create, :destroy, :update]
  resources :charges

  patch '/cart_quantity', to: 'cart_items#quantity'

  resources :users, only: [:new, :create, :destroy, :edit, :update] do
    resources :rentals, only: [:index, :create, :show, :update]
    resources :addresses, only: [:edit, :update]
  end
  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    resources :categories, only: [:new, :create]
    resources :rentals, only: [:show, :update]
    resources :items, only: [:new, :create, :index, :edit, :update]
    resources :brands, only: [:new, :create]
  end
  get '/dashboard', to: 'users#show'
  get '/cart', to: 'cart#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/:category', to: 'categories#show', param: :name
end
