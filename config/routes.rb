Rails.application.routes.draw do
  resources :lists
  resources :recipes
      resources :users, only: [:create]
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'application#logged_in?'
  
end