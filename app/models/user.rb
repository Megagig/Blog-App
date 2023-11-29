class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', counter_cache: true
  has_many :comments
  has_many :likes
end
