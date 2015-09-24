# encoding: utf-8
class AvatarUploader < CarrierWave::Uploader::Base  

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # For Cache location
  def cache_dir
  "/tmp/your-folder-cache"
  end
   
  # Only allows jpg, jpeg, or png
  def extension_white_list
  %w(jpg jpeg png)
  end
end
