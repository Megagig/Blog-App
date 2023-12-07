class CommentsController < ApplicationController
    def create_comment # This method is used to create a new comment on behalf of the current_user
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params.merge(user: current_user))
      if @comment.save
        redirect_to user_post_path(@post.user, @post), notice: 'Comment added successfully.'
      else
        render :show
    end
end
    private
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end