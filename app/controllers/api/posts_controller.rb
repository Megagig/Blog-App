class Api::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def index
    @posts = Post.all
    render json: @posts
  end
end
