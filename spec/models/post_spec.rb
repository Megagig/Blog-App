require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John Doe', photo: 'photo_url', bio: 'bio_text', post_counter: 0) }

  it 'is valid with valid attributes' do
    post = Post.new(
      title: 'Valid Title',
      user:,
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = Post.new(
      user:,
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).to_not be_valid
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'is not valid with a title exceeding 250 characters' do
    post = Post.new(
      title: 'a' * 251,
      user:,
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).to_not be_valid
    expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
  end

  it 'is not valid with a non-integer comments_counter' do
    post = Post.new(
      title: 'Valid Title',
      user:,
      comments_counter: 'invalid',
      likes_counter: 0
    )
    expect(post).to_not be_valid
    expect(post.errors[:comments_counter]).to include('is not a number')
  end

  it 'is not valid with a negative comments_counter' do
    post = Post.new(
      title: 'Valid Title',
      user:,
      comments_counter: -1,
      likes_counter: 0
    )
    expect(post).to_not be_valid
    expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')
  end

  it 'is not valid with a non-integer likes_counter' do
    post = Post.new(
      title: 'Valid Title',
      user:,
      comments_counter: 0,
      likes_counter: 'invalid'
    )
    expect(post).to_not be_valid
    expect(post.errors[:likes_counter]).to include('is not a number')
  end

  it 'is not valid with a negative likes_counter' do
    post = Post.new(
      title: 'Valid Title',
      user:,
      comments_counter: 0,
      likes_counter: -1
    )
    expect(post).to_not be_valid
    expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
  end
end
