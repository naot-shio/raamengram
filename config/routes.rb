Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'posts#index'
  post '/', to: 'posts#create'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :likes, only: [:index, :create, :destroy]
  resources :users, only: :show 
  resources :rankings, only: :index
end
