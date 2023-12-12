require 'rails_helper'
RSpec.describe 'Posts Show', type: :feature do
  before do
    @user = User.create!(name: 'John', posts_counter: 0, photo: 'https://picsum.photos/200', bio: 'I am John')
    @post = Post.create!(title: "Post title", text: "Text for post", comments_counter: 1, likes_counter: 1, user: @user)
    @comments = Array.new(5) do |i|
      Comment.create!(text: "Comment #{i}", user: @user, post: @post)
    end
    visit user_posts_path(@user, @post)
  end
  describe "#showpage" do
  it 'displays the post title' do
    expect(page).to have_selector('h2', text: @post.title)
  end
  it 'displays who wrote the post' do
    expect(page).to have_content(@user.name)
  end
  it 'displays how many comments the post has' do
    expect(page).to have_content(@post.comments.count)
  end
  it 'displays how many likes the post has' do
    expect(page).to have_content(@post.likes.count)
  end
  it 'displays the post body' do
    expect(page).to have_content(@post.text)
  end
  it 'displays the username of each commentor and the comment they left' do
    @comments.each do |comment|
      expect(page).to have_content(comment.user.name)
      expect(page).to have_content(comment.text)
    end
  end
end
end