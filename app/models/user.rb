class User < ApplicationRecord
  # devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', counter_cache: true
  has_many :comments
  has_many :likes

  # Validation

  validates :name, presence: true # This is validating that the `Name`
  # attribute of the `User` model is present, meaning it cannot be blank or nil.
  # validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # is adding a validation to the `User` model. It ensures that the `PostCounter` attribute is a
  # numerical value and that it is greater than or equal to 0. This means that the `PostCounter`
  # attribute cannot be a non-integer value or a negative number.
  # The function below retrieves the three most recent posts written
  # by the author.
  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
