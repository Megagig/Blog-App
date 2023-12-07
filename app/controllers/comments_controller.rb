class CommentsController < ApplicationController
  # This method is used to instantiate a new comment
  def new
    @comment = Comment.new
  end

  # This method is used to create a new comment on behalf of the current_user
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to user_post_path(@post.user, @post), notice: 'Comment added successfully.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
