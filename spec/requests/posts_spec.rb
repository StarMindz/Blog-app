require 'rails_helper'

RSpec.describe 'User Posts', type: :request do
  before(:example) do
    @user = User.create(name: 'John', photo: 'https://example.com/photo.jpg', bio: 'Teacher from the USA.',
                        post_counter: 0)
  end

  it 'displays user posts' do
    get user_posts_path(@user)

    expect(response).to have_http_status(:ok)

    expect(response).to render_template(:index)

    expect(response.body).to include('Number of post:')
  end

  it 'display all posts of a user' do
    get "/users/#{@user.id}/posts"

    expect(response).to have_http_status(:ok)

    expect(response).to render_template(:index)

    expect(response.body).to include('All User Posts')
  end

  it 'View a specific post' do
    post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                       comments_counter: 0)
    get "/users/#{@user.id}/posts/#{post.id}"

    expect(response).to have_http_status(:ok)

    expect(response).to render_template(:show)

    expect(response.body).to include('Number of comments:')
    expect(response.body).to include('This is my first post')
  end
end
