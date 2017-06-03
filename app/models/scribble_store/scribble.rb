module ScribbleStore
  class Scribble < ActiveRecord::Base
    mount_uploader :image, ScribbleStore::ScribbleUploader
    attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
    
    after_update :crop_scribble

    belongs_to :source_scribble, class_name: 'Scribble', foreign_key: 'source_scribble_id', optional: true
    has_many :response_scribbles, class_name: 'Scribble', foreign_key: 'source_scribble_id'
  
    validates :image, presence: true

    def crop_scribble
      image.recreate_versions! if crop_x.present?
    end
  end
end
