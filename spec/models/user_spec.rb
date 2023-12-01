require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a negative post_counter' do
    user = User.new(post_counter: -1)
    expect(user).to_not be_valid
  end

  it 'should return three most recent posts' do
    user = User.create(name: 'John Doe', post_counter: 0)
    posts = (1..5).map { |i| Post.create(title: "Post #{i}", user: user, comments_counter: 0, likes_counter: 0) }
    expect(user.three_most_recent_posts).to eq(posts.last(3).reverse)
  end
end
