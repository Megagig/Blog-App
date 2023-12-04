class PostsController < ApplicationController
    #The index method is used to display all the posts for a given user. 
    #The index method will be called when a user navigates to the URL /users/:author_id/posts.
    #The index method will be called when a user navigates to the URL /users/:author_id/posts.
  def index
    @user = User.find(params[:author_id])
    @posts = Post.all
  end
    #The index method is used to retrieve a specific post from the database and display it to the user.
  def show
    @post = Post.find(params[:id])
  end

end