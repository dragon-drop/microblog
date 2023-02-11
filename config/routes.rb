Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: :index do
    member do
      patch :like, to: 'posts#toggle_like'
    end
  end
  root "posts#index"
end
