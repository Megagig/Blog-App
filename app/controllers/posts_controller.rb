class PostsController < ApplicationController
  load_and_authorize_resource
  # The index method is used to display all the posts for a given user.
  # The index method will be called when a user navigates to the URL /users/:user_id/posts.
  def index
    current_user = User.find(params[:user_id])
    @posts = current_user.posts.includes(:comments)
    @posts = Post.all
  end

  # The show method is used to retrieve a specific post from the database and display it to the user.
  def show
    @user = current_user
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
    @like = Like.new
    cookies[:post_id] = @post.id if @post.present?

    return unless @post.nil?

    redirect_to root_path, alert: 'Comment deleted successfully.'
  end

  # The create method is used to create a new post on behalf of the current_user.
  def create_comment
    @post = current_user.posts.build(post_params) # Creates a new post and associates it with the current user

    if @post.save # If the post is successfully saved
      @post.increment_posts_counter
      redirect_to user_posts_path(current_user), notice: 'Successfully created post.' # Redirects to the user's posts
    else
      @posts = current_user.posts
      render :index # Renders the index page with the user's posts if there are errors
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user), notice: 'Post deleted successfully.'
  end

  private

  # The function `post_params` is used to extract and permit specific parameters from
  # the `params` object in a Ruby on Rails application.
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
