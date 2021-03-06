Rails.application.routes.draw do
  root 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/timeline' => 'timeline#index'
  get '/search/new' => 'search#new'
  get '/search/show' => 'search#show'

  resources :users
  resources :discoveries
  resources :genres
  resources :tasks
end
