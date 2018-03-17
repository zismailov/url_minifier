Rails.application.routes.draw do
  root "user_sessions#new"

  resources :urls do
    resources :statistics, only: [:index]
  end
  resources :user_sessions
  resources :users

  get "login" => "user_sessions#new", :as => :login
  post "logout" => "user_sessions#destroy", :as => :logout
  get ":short_url", to: "urls#perform_path"
end
