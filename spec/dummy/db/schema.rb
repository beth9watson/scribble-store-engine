# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170603190718) do

  create_table "crop_infos", force: :cascade do |t|
    t.integer  "x_coor"
    t.integer  "y_coor"
    t.integer  "width"
    t.integer  "height"
    t.integer  "scribble_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["scribble_id"], name: "index_crop_infos_on_scribble_id"
  end

  create_table "scribble_store_scribbles", force: :cascade do |t|
    t.text     "image"
    t.string   "artist_email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "source_scribble_id"
    t.integer  "crop_height"
    t.integer  "crop_width"
    t.integer  "crop_x"
    t.integer  "crop_y"
    t.index ["source_scribble_id"], name: "index_scribble_store_scribbles_on_source_scribble_id"
  end

end
