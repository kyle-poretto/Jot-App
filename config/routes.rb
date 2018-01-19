Rails.application.routes.draw do
  root to: "static#home"

  #users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do 
    resources :jots
  end
  
  resources :users do
    resources :jewels
  end

  resources :users do 
    member do get :followers, :following
    end
  end

  #relationships
  resources :relationships, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  #jots
  post '/jots/new', to: 'jots#create' 
  post '/jots/:id/edit', to: 'jots#update'
  get '/users/sign_out', to: 'jots#home'

  #jewels
  
  #patch '/jewels', to: 'jewels#update'
  #get 'jewels/all', to: 'jewels#index'



end
