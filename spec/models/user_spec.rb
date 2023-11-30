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
  it 'should three most recent post' do
    expect(subject.three_most_recent_posts).to eq(subject.posts.order(updated_at: :desc).limit(3))
  end
end
