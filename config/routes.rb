Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :show, :create] do
    resource :likes
  end

  root to: "posts#index"
end
