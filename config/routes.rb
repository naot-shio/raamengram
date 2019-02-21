Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'
  post '/', to: 'posts#create'
  resources :posts
end
