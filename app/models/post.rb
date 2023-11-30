class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'posts_id', dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    user.update(PostCounter: user.posts.count)
  end
end