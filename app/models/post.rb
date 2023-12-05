class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'posts_id', dependent: :destroy
  has_many :likes, dependent: :destroy

  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    # user.update(post_counter: user.posts.count)
    post_count = user.posts.count
    user.update(post_counter: post_count.zero? ? 0 : post_count)
  end
end
