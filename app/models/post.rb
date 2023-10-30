class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  after_save :update_post_counter

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def update_post_counter
    user.increment!(:post_counter)
  end
end
