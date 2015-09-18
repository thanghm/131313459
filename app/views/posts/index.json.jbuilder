json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :published, :user_id, :salary, :categories, :location, :position, :skill, :created_at, :updated_at
  json.url post_url(post, format: :json)
end
