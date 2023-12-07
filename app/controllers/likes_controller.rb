class LikesController < ApplicationController
  # This method is used to instantiate a new like
  def new
    @like = Like.new
  end

  # This method is used to create a new like on behalf of the current_user
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(like_params.merge(post_id: @post.id))
    if @like.save
      @like.update_post_likes_counter
      redirect_to user_post_path(@post.user, @post), notice: 'Post liked successfully.'
    else
      render :new
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
