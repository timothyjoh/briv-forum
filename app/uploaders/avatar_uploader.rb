class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :display do
    process :eager => true
    process :resize_to_fill => [512, 512, :north]
  end

  version :thumbnail do
    process :eager => true
    process :resize_to_fit => [64, 64, :north]
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
