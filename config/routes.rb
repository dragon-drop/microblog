Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: :index
  resources :likes, only: :create
  root "posts#index"
end