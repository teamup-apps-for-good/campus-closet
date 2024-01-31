# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :conditions
  resources :sizes
  resources :statuses
  resources :genders
  resources :types
  resources :colors
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'items#index'

  #OAuth Routes
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/signout', to: 'sessions#destroy', as: 'signout'

  resources :users do
    patch 'update_user', on: :member
    member do
      get 'account_creation', to: 'users#account_creation'
    end
  end


  resources :items

  resources :items do
    member do
      patch :image_upload
    end
  end
end
