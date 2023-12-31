require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'user', post_counter: 0) }
  let(:post) do
    Post.create(title: 'test', text: 'post content', author_id: user.id, comments_counter: 0, likes_counter: 0)
  end
  subject { Like.create(post_id: post.id, user_id: user.id) }

  it 'should increments likes_counter by 1' do
    expect { subject }.to change { post.reload.likes_counter }.by(1)
  end
end
