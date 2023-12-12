require 'rails_helper'
RSpec.feature 'UserShowPages', type: :feature do
  before do
    @user = User.create!(name: 'John', photo: '/path/to/photo.jpg', posts_counter: 0, bio: 'This is a bio')
    @posts = Array.new(3) do |i|
      Post.create!(title: "Post #{i}", text: "Post text #{i}", user: @user, comments_counter: 0, likes_counter: 0)
    end
    visit user_path(@user)
  end
  it "displays the user's profile picture" do
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end
  it "displays the user's username" do
    expect(page).to have_content(@user.name)
  end
  it 'displays the number of posts the user has written' do
    expect(page).to have_content(@user.posts_counter)
  end
  it "displays the user's bio" do
    expect(page).to have_content(@user.bio)
  end
  it "displays the user's first 3 posts" do
    @posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end
  it "displays a button that lets me view all of a user's posts" do
    expect(page).to have_link('See all posts', href: user_posts_path(@user))
  end
  it "redirects to the user's post's index page when clicking to see all posts" do
    click_link 'See all posts'
    expect(current_path).to eq user_posts_path(@user)
  end
end
