class Post < ActiveRecord::Base
	mount_uploader :map, MapUploader
	scope :title, -> (title) { where("posts.title like ?", "%#{title}%")}
	scope :categories, -> (categories) { where("posts.categories like ?", "%#{categories}%")}
	scope :salary, -> (salary) { where("posts.salary like ?", "%#{salary}%")}
	scope :location, -> (location) { where("posts.location like ?", "%#{location}%")}
	scope :position, -> (position) { where("posts.position like ?", "%#{position}%")}
	default_scope -> { order(id: :desc) }
	belongs_to :user
	has_many :resumes
end
