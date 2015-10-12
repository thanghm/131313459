json.array!(@posts) do |post|
  json.extract! post, :id, :title, :company, :body, :published, :user_id, :salary, :categories, :location, :position, :logo, :about, :skill, :endday, :address, :map, :phone, :created_at, :updated_at, :roles_mask
  json.url post_url(post, format: :json)
end
