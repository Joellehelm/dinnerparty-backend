Rails.application.routes.draw do
  resources :lists
  resources :recipes
  resources :parties
  resources :party_users


      resources :users, only: [:create, :usernames]
      post '/login', to: 'auth#create'
      delete '/logout', to: 'auth#destroy'
      get '/logged_in', to: 'application#logged_in?'
      get '/usernames', to: 'users#usernames'
  
end