class AddCropInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :scribble_store_scribbles, :crop_height, :integer
    add_column :scribble_store_scribbles, :crop_width, :integer
    add_column :scribble_store_scribbles, :crop_x, :integer
    add_column :scribble_store_scribbles, :crop_y, :integer
  end
end
