module ScribbleStore
  class ScribbleUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    storage :file

    def extension_white_list
      %w(jpg jpeg png gif)
    end

    version :featured do
      process :crop
      resize_to_fit(400, 400)
    end

    def crop
      if model.crop_x.present?
        resize_to_fit(400, 400)
        manipulate! do |image|
          x = model.crop_x.to_i
          y = model.crop_y.to_i
          w = model.crop_w.to_i
          h = model.crop_h.to_i
          image.crop([[w,h].join('x'), [x,y].join('+')].join('+'))
        end 
      end
    end
  end
end