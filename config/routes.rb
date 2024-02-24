# frozen_string_literal: true

Rails.application.routes.draw do
  get 'chat_page/home'
  resources :time_slots
  resources :requests
  resources :pickups
  resources :users
  resources :conditions
  resources :sizes
  resources :statuses
  resources :genders
  resources :types
  resources :colors
  resources :items
  resources :messages, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'items#index'

  #OAuth Routes
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/:google_oauth2/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/signout', to: 'sessions#destroy', as: 'signout'

  # chat routes
  # mount ActionCable.server => '/cable'

  resources :users do
    patch 'update_user', on: :member
    member do
      get 'account_creation', to: 'users#account_creation'
    end
  end

  get 'users/:id/student', to: 'users#show_student', as: 'user_student'
  get 'users/:id/donor', to: 'users#show_donor', as: 'user_donor'

  resources :items

  resources :items do
    member do
      patch :image_upload
    end
  end

end
