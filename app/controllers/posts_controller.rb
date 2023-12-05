class PostsController < ApplicationController
  # The index method is used to display all the posts for a given user.
  # The index method will be called when a user navigates to the URL /users/:user_id/posts.
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  # The show method is used to retrieve a specific post from the database and display it to the user.
  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
end
