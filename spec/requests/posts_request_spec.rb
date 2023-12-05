require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  let!(:user) { User.create(name: 'John Doe', photo: 'photo_url', bio: 'bio_text', post_counter: 0) }
  let!(:post) do
    Post.create(title: 'Test', text: 'Post content', author_id: user.id, comments_counter: 0, likes_counter: 0)
  end

  describe 'GET /posts#index' do
    it 'should check if response status code is correct' do
      get user_posts_path(user)
      expect(response).to have_http_status(200)
    end
    it 'should check if the response body includes correct placeholder text' do
      get user_posts_path(user)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
    it 'should render the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /posts#show' do
    it 'should check if response status code is correct' do
      get user_post_path(user, post)
      expect(response).to have_http_status(200)
    end
    it 'should check if the response body includes correct placeholder text' do
      get user_post_path(user, post)
      expect(response.body).to include('Here is a post for a given posts')
    end
    it 'should render the show template' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end
  end
end
