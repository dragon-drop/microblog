Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end

  root to: "posts#index"
end
