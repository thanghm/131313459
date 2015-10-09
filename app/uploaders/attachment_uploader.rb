# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base

  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def original_filename
    return @original_filename if @original_filename
    if @file and @file.respond_to?(:original_filename)
      @file.original_filename
    elsif path
      File.basename(path)
    end
  end

  def extension_white_list
    %w(pdf doc htm html docx jpg jpeg png txt docx)
  end

end
