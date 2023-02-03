class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def most_recent_post
    posts.limit(3).order(created_at: :desc)
  end
end
