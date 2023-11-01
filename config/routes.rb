Rails.application.routes.draw do
  root to: "users#index"
  
  resources :users, only: [:show] do
    resources :posts, only: [:index, :show]
  end

  # Uncomment and customize these resource routes as needed:
  # resources :comments
  # resources :likes
  # resources :posts
  # resources :users
end
