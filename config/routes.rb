Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: :index
  root "posts#index"

  post 'like', to: 'likes#create'
  post 'dislike', to: 'likes#destroy'
end
