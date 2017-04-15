class CreateScribbleStoreScribbles < ActiveRecord::Migration[5.0]
  def change
    create_table :scribble_store_scribbles do |t|
      t.text :before_image
      t.text :after_image
      t.string :requester_email

      t.timestamps
    end
  end
end
