Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resource :user, except: [:update]

  get "/top" => "users#index"
end
