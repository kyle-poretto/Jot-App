Rails.application.routes.draw do
  devise_for :users
  root to: "jots#home"

  resources :jots
  resources :jewels

  post '/jots/new', to: 'jots#create' 
  patch '/jewels', to: 'jewels#update'
  post '/jots/:id/edit', to: 'jots#update'

end
