class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  process resize_to_limit: [600, 750]
  version :user_img do
    process resize_to_fit: [150, 150]
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
