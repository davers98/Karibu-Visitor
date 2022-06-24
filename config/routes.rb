Rails.application.routes.draw do
  root 'public#home'

  resources :user_logs, except: [:update, :destroy]
  resources :visitor_logs, except: [:update, :destroy]
 
  devise_for :users

  get '/users', to: 'users#index'
  get '/user/:id', to: 'users#show'
  put '/user/:id', to: 'users#update'
  delete '/user/:id', to: 'users#destroy'
 
end
