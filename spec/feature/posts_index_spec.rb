require 'rails_helper'

RSpec.describe 'PostsIndex', type: :feature do
  before do
    @user = User.create!(name: 'John', photo: '/path/to/photo.jpg', posts_counter: 0)
    @posts = Array.new(5) do |i|
      Post.create!(title: "Post #{i}", text: "Text for post #{i}", user: @user)
    end
    visit user_posts_path(@user)
  end

  it 'displays the user profile picture' do
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end

  it 'displays the user username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'displays a post title and some of the post body' do
    @posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  it 'displays the first comments on a post' do
    # Assuming you have a setup for comments
    @posts.each do |post|
      post.five_most_recent_comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end

  it 'displays how many comments a post has' do
    @posts.each do |post|
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end
  end

  it 'displays how many likes a post has' do
    @posts.each do |post|
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end
  end

  it 'displays a pagination button' do
    expect(page).to have_button('Pagination')
  end

  it "redirects to post's show page when clicking on a post" do
    @posts.each_with_index do |post, _index|
      link = find_link('Read post', href: user_post_path(@user, post))
      link.click
      expect(current_path).to eq user_post_path(@user, post)
      visit user_posts_path(@user) # Go back to the index page for the next iteration
    end
  end
end
