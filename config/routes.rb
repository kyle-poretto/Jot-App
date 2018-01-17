Rails.application.routes.draw do
  devise_for :users
  root to: "static#home"

  resources :jots
  resources :jewels
  resources :relationships, only: [:create, :destroy]

  post '/jots/new', to: 'jots#create' 
  patch '/jewels', to: 'jewels#update'
  post '/jots/:id/edit', to: 'jots#update'
  get '/users/sign_out', to: 'jots#home'

  resources :users do 
    member do get :followers, :following
  end
end
end
