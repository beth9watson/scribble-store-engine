module ScribbleStore
  class ScribbleUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    def extension_white_list
      %w(jpg jpeg png gif)
    end

    process resize_to_fit: [500, 500]

    version :thumb do
      process resize_to_fill: [200,200]
    end

    storage :file
  end
end