Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy], module: :posts
      resources :likes, only: [:new, :create], module: :posts
    end
  end
  namespace :api do
    resources :users, only: [] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end

