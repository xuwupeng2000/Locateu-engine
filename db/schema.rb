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

ActiveRecord::Schema.define(version: 20180820080010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "geo_tracks", force: :cascade do |t|
    t.bigint "sensor_id", null: false
    t.geography "lnglat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.jsonb "metadada", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lnglat"], name: "index_geo_tracks_on_lnglat", using: :gist
    t.index ["sensor_id"], name: "index_geo_tracks_on_sensor_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "logo"
    t.string "web_url"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_packages_on_category"
    t.index ["name"], name: "index_packages_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "ec1"
    t.string "ec2"
    t.string "serial_code"
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
