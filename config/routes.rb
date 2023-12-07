Rails.application.routes.draw do
  root to: "users#index"
  #Create a new post on behalf of the current_user
  post "/posts", to: "posts#create"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      #Create a new post on behalf of the current_user
      post "/comments", to: "posts#create_comment", as: :post_comments

      #Allow the current_user to add a like to a post
      post "/likes", to: "posts#create_like", as: :post_likes
    end
  end
end

