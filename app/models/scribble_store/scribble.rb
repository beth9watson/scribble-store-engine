module ScribbleStore
  class Scribble < ActiveRecord::Base
    mount_uploader :before_image, ScribbleStore::ScribbleUploader
  end
end
