Rails.application.routes.draw do
  root to: "home#show"

  resources :users, except: :index

  resources :sessions, only: :create
  get "sign_in", to: "sessions#new", as: "sign_in"
  delete "sign_out", to: "sessions#destroy", as: "sign_out"

  resources :posts

  resources :comments, only: %i( destroy )
end
