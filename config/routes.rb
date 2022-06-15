Rails.application.routes.draw do
  root 'public#home'

  resources :user_logs
  resources :visitor_logs
 
  devise_for :users

  get '/users', to: 'users#index'
  get '/user/:id', to: 'users#show'
 
end
