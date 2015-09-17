class Post < ActiveRecord::Base
	
	scope :title, -> (title) { where("posts.title ilike ?", "#{title}%")}
	scope :categories, -> (categories) { where("posts.categories ilike ?", "#{categories}%")}
	scope :salary, -> (salary) { where("posts.salary ilike ?", "#{salary}%")}
	scope :location, -> (location) { where("posts.location ilike ?", "#{location}%")}

	belongs_to :user

end
