Rails.application.routes.draw do
  # default route
  root 'posts#index'

  # resource routes
  resources :comments
  resources :image_posts
  resources :text_posts
  resources :posts
  resources :users

  # registration
  get 'signup', to: 'users#new', as: 'signup'

  # login, logout
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # user routes
  post 'follow/:id', to: 'users#follow', as: 'follow_user'

end
