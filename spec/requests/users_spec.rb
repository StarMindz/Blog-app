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

  it 'displays a single post' do
    post = Post.create(author: @user, title: 'My First Post', text: 'This is my initial post content.',
                       likes_counter: 0, comments_counter: 0)
    get user_post_path(@user, post)

    expect(response).to have_http_status(:ok)

    expect(response).to render_template(:show)

    # Update the expectation to match the content in your view
    expect(response.body).to include('This is my initial post content.')
  end
end
# gem install rspec-support -v 3.12.2 --default
