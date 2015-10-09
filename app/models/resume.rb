class Resume < ActiveRecord::Base
	mount_uploader :attchment, AttachmentUploader
	belongs_to :user
	belongs_to :post
end
