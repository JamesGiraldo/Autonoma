class PerfilUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  process resize_to_fill: [800, 800]

  version :thumb, if: :image? do
    process resize_to_fill: [136, 160]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end

  protected

  def image?(new_file)
    new_file.content_type.start_with? 'image'
  end
end
