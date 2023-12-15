class Api::CommentsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(text: params[:text], user_id: params[:user_id])

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
