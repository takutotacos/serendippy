Rails.application.routes.draw do
  resources :users

  get "/top" => "users#index"
end
