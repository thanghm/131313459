class Post < ActiveRecord::Base
	def self.search(search)
	  where("posts.tittle ILIKE ?", "%#{search}%") 
	  where("posts.body ILIKE ?", "%#{search}%")
	end
	belongs_to :user
 	belongs_to :topic

end
