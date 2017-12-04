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

ActiveRecord::Schema.define(version: 20171204192124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "converted_payloads", force: :cascade do |t|
    t.jsonb "content", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geo_tracks", force: :cascade do |t|
    t.bigint "sensor_id", null: false
    t.geography "lnglat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.jsonb "metadada", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "acc"
    t.string "cmd"
    t.datetime "gpstime"
    t.datetime "systemtime"
    t.index ["lnglat"], name: "index_geo_tracks_on_lnglat", using: :gist
    t.index ["sensor_id"], name: "index_geo_tracks_on_sensor_id"
  end

  create_table "permission_transitions", force: :cascade do |t|
    t.string "to_state", null: false
    t.jsonb "metadata", default: {}
    t.integer "sort_key", null: false
    t.integer "permisson_id", null: false
    t.boolean "most_recent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permisson_id", "most_recent"], name: "index_permission_transitions_parent_most_recent", unique: true, where: "most_recent"
    t.index ["permisson_id", "sort_key"], name: "index_permission_transitions_parent_sort", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ec_id", null: false
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ec_id"], name: "index_permissions_on_ec_id"
    t.index ["state"], name: "index_permissions_on_state"
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.string "serial_code"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sensors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "email"
    t.string "profile_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
