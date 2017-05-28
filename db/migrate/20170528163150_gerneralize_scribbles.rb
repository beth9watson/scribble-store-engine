class GerneralizeScribbles < ActiveRecord::Migration[5.0]
  def change
    change_table :scribble_store_scribbles do |t|
      t.rename :before_image, :image
      t.rename :requester_email, :artist_email

      t.remove :after_image

      t.references :source_scribble, references: :scribbles
    end  
  end
end
