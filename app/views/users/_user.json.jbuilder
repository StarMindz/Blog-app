json.extract! user, :id, :name, :photo, :bio, :updated_at, :created_at, :post_counter, :created_at, :updated_at
json.url user_url(user, format: :json)