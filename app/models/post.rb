class Post < ActiveRecord::Base
	mount_uploader :map, MapUploader
	scope :title, -> (title) { where("posts.title ilike ?", "#{title}%")}
	scope :categories, -> (categories) { where("posts.categories ilike ?", "#{categories}%")}
	scope :salary, -> (salary) { where("posts.salary ilike ?", "#{salary}%")}
	scope :location, -> (location) { where("posts.location ilike ?", "#{location}%")}
	scope :position, -> (position) { where("posts.position ilike ?", "#{position}%")}
	default_scope -> { order(id: :desc) }
	belongs_to :user
	has_many :resumes
end
