Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'
  post '/', to: 'posts#create'
  resources :posts do
    member do
      resources :likes
    end
  end

  resources :users, only: :show do
  end
end
