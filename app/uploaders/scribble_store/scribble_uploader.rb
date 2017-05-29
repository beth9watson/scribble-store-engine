module ScribbleStore
  class ScribbleUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    def extension_white_list
      %w(jpg jpeg png gif)
    end

    version :featured do
      process resize_to_fit: [400, 400]
    end

    storage :file
  end
end