Rails.application.routes.draw do
  # default route
  root 'posts#index'

  # resource routes
  resources :comments
  resources :image_posts
  resources :text_posts
  resources :posts
  resources :users

  # registration and signin routes
  get 'signup', to: 'users#new', as: 'signup'

end
