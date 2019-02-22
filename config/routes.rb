Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'
  post '/', to: 'posts#create'
  resources :posts
  resources :likes, only: [:index, :create, :destroy]

  resources :users, only: :show 
end
