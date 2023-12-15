class Api::PostsController < ApplicationController
  skip_before_action :verify_authentication_token
  skip_before_action :authenticate_user!
  def index
    @posts = Post.all
    render json: @posts
  end
end
