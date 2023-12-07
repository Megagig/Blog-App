Rails.application.routes.draw do
  root to: "users#index"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create], module: :posts
      resources :likes, only: [:create], module: :posts
    end
  end
end

