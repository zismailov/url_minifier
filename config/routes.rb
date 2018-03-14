Rails.application.routes.draw do
  root "user_sessions#new"
  resources :urls, only: %i[new create show]
  resources :user_sessions
  resources :users

  get "login" => "user_sessions#new", :as => :login
  post "logout" => "user_sessions#destroy", :as => :logout
end
