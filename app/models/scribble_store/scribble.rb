module ScribbleStore
  class Scribble < ActiveRecord::Base
    mount_uploader :image, ScribbleStore::ScribbleUploader
  end
end
