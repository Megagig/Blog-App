Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
#   get "/users/:author_id/posts", to: "posts#index", as: :user_posts # user_posts_path(author_id: 1)
#   get "/posts/:id", to: "posts#show", as: :user_post # user_post_path(id: 1)
#   get "/users", to: "users#index"
#   get "/users/:id", to: "users#show", as: :user
# end
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end

