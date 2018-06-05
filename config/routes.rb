Rails.application.routes.draw do
  resources :users
  resources :discoveries

  get "/top" => "users#index"
end
