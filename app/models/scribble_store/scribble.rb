module ScribbleStore
  class Scribble < ActiveRecord::Base
    mount_uploader :image, ScribbleStore::ScribbleUploader

    belongs_to :source_scribble, class_name: 'Scribble', foreign_key: 'source_scribble_id', optional: true
    has_many :response_scribbles, class_name: 'Scribble', foreign_key: 'source_scribble_id'
  
    validates :image, presence: true
  end
end
