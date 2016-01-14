Rails.application.routes.draw do
  resources :image_posts
  resources :text_posts
  resources :posts
  resources :users
end
