Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'posts#index'
  post '/', to: 'posts#create'

  resources :posts
  resources :likes, only: [:index, :create, :destroy]
  resources :users, only: :show 
  resources :rankings, only: :index
end
