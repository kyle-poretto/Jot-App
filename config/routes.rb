Rails.application.routes.draw do
  devise_for :users
  root to: "jots#home"

  resources :jots
  resources :jewels

  post '/jots/new', to: 'jots#create' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
