# encoding: utf-8

class GalleryUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [120, 120]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
