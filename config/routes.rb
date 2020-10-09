Rails.application.routes.draw do
  resources :lists
  resources :recipes
  resources :parties
  resources :party_users
  resources :party_recipes
  resources :ingredients
  resources :user_ingredients


      resources :users, only: [:create, :usernames]
      post '/login', to: 'auth#create'
      delete '/logout', to: 'auth#destroy'
      get '/logged_in', to: 'application#logged_in?'
      get '/usernames', to: 'users#usernames'
      get '/hosting', to: "party_users#hosting"
      get '/attending', to: "party_users#attending"
  
      resources :rooms, only: [:index, :show, :create]
      resources :messages, only: [:index, :create]
end