require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before do
    @users = Array.new(5) do
      User.create!(name: 'John', photo: '/path/to/photo.jpg', posts_counter: 3)
    end
    visit users_path
  end

  it 'displays the username of all other users' do
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'displays the profile picture for each user' do
    @users.each do |user|
      expect(page).to have_css("img[src='#{user.photo}']")
    end
  end

  it 'displays the number of posts each user has written' do
    @users.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  it 'redirects to the user show page when clicking on a user' do
    @users.each do |user|
      click_link 'View profile', href: user_path(user)
      expect(current_path).to eq(user_path(user))
      visit users_path
    end
  end
end
