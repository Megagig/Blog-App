require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'update post comment_counter after save' do
    user = User.create(name: 'John Doe', post_counter: 0)
    post = Post.create(title: 'Post 1', user:, comments_counter: 0, likes_counter: 0)
    expect(post.comments_counter).to eq(0)
    Comment.create(text: 'Comment 1', user:, post:)
    post.reload
    expect(post.comments_counter).to eq(1)
  end
end
