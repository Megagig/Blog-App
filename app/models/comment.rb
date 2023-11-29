class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'

  # The function `update_post_comments_counter` increments the
  # `CommentsCounter` attribute of a post.
  def update_post_comments_counter
    post.increment!(:CommentsCounter)
  end
end
