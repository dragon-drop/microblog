Rails.application.routes.draw do
  devise_for :users

  resources :posts, except: :index
  resources :reactions, only: %i[create]
  root "posts#index"
end
