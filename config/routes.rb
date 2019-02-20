Rails.application.routes.draw do
  root 'posts#index'
  post '/', to: 'posts#create'
  resources :posts
end
