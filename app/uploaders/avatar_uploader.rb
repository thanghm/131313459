# encoding: utf-8
class AvatarUploader < CarrierWave::Uploader::Base  
  include CarrierWave::MiniMagick
  # Choose what kind of storage to use for this uploader:
  storage :file
  #storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # For Cache location
  # def cache_dir
  # "/tmp/your-folder-cache"
  # end
  # def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
    #{}"/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # 'default_avatar.png' #rails will look at 'app/assets/images/default_avatar.png'
  # end
  version :medium_avatar do
    # returns a 50x50 image
    process :resize_to_fill => [50, 50]
  end
  version :small_avatar do
    # returns a 35x35 image
    process :resize_to_fill => [35, 35]
  end
   
  # Only allows jpg, jpeg, or png
  def extension_white_list
  %w(jpg jpeg png)
  end
end
