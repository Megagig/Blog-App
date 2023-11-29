class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  #The dependent: :destroy ensures that when a post is deleted, its
  # associated likes and comments will also be deleted.
  has_many :comments, foreign_key: 'posts_id', dependent: :destroy
  has_many :likes, dependent: :destroy
end
