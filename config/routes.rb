Rails.application.routes.draw do
  root 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/timeline' => 'timeline#index'
  get '/search' => 'search#new'
  get '/search' => 'search#search'

  resources :users
  resources :discoveries
  resources :genres
end
