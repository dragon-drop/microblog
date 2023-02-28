Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: :index do 
    resources :likes, only: [:create, :destroy]
  end

  root "posts#index"
end
