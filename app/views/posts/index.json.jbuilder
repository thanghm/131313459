json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :published, :user_id, :salary, :categories, :location, :position, :logo, :about, :skill, :map, :phone, :created_at, :updated_at, :roles_mask
  json.url post_url(post, format: :json)
end
