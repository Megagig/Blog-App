class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'users_id'
  belongs_to :post, foreign_key: 'posts_id'

  # The function `update_post_likes_counter` increments the `LikesCounter`
  # attribute of a post.
  def update_post_likes_counter
    post.increment!(:LikesCounter)
  end
end
