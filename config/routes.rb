Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  post '/', to: 'posts#create'
  resources :posts
end
