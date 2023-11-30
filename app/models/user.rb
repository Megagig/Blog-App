class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', counter_cache: true
  has_many :comments
  has_many :likes

  # The function retrieves the three most recent posts written
  # by the author.
  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
