class Post < ActiveRecord::Base
	def self.search(search)
	  where("posts.tittle ILIKE ?", "%#{search}%") 
	  where("posts.body ILIKE ?", "%#{search}%")
	  where("posts.categories ILIKE ?", "%#{search}%")
	  where("posts.location ILIKE ?", "%#{search}%")
	  where("posts.position ILIKE ?", "%#{search}%")
	  where("posts.joblevel ILIKE ?", "%#{search}%")
	  where("posts.salary ILIKE ?", "%#{search}%")
	end
	belongs_to :user
end
