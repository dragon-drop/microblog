Rails.application.routes.draw do
  devise_for :users

  resources :posts, except: :index do
    member do
      post 'like', to: 'likes#create'
      delete 'unlike', to: 'likes#destroy'
    end
  end

  root "posts#index"
end
